import 'dart:async';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../buttom_navigation/buttom_navigation.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _dbRef = FirebaseDatabase.instance.reference().child('users');

  final FirebaseStorage _storage = FirebaseStorage.instance;
  final DatabaseReference _database = FirebaseDatabase.instance.reference();
  final picker = ImagePicker();

  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var isChecked = false.obs;
  var isLoading = false.obs;

  Rx<User?> firebaseUser = Rx<User?>(null);

  StreamSubscription<User?>? _authListener;

  @override
  void onInit() {
    super.onInit();
    _authListener = _auth.authStateChanges().listen((User? user) {
      firebaseUser.value = user;
    });
  }

  @override
  void onClose() {
    _authListener?.cancel();
    super.onClose();
  }

  Stream<Map<String, dynamic>?> userProfileStream() {
    if (firebaseUser.value != null) {
      return _dbRef.child(firebaseUser.value!.uid).onValue.map((event) {
        if (event.snapshot.value != null) {
          Map<dynamic, dynamic>? snapshotData = event.snapshot.value as Map<dynamic, dynamic>?;

          if (snapshotData != null) {
            Map<String, dynamic> userData = {};
            snapshotData.forEach((key, value) {
              userData[key.toString()] = value;
            });

            return userData;
          }
        }
        return null;
      });
    }
    return Stream.value(null);
  }

  Future<void> signup() async {
    if (!formKey.currentState!.validate() || !isChecked.value) {
      return;
    }

    isLoading.value = true;

    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      Map<String, dynamic> userData = {
        'first_name': firstnameController.text,
        'last_name': lastnameController.text,
        'email': emailController.text,
      };

      await _dbRef.child(userCredential.user?.uid ?? '').set(userData);

      Get.offAll(() => bottom_screen());

      Fluttertoast.showToast(
        msg: 'Sign Up Successfully',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    } catch (e) {
      print('Error during registration: $e');
      Fluttertoast.showToast(
        msg: 'Registration Failed: $e',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> login() async {
    isLoading.value = true;

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: emailController.text,
      );

      print('User logged in: ${userCredential.user!.uid}');
      Fluttertoast.showToast(
        msg: 'Login Successful!',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );

      Get.offAll(() => bottom_screen());
    } catch (e) {
      print('Error during login: $e');
      Fluttertoast.showToast(
        msg: 'Login Failed: $e',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Stream<Map<String, dynamic>?> usersProfileStream() {
    return _database.child('users').child(_auth.currentUser!.uid).onValue.map((event) {
      return event.snapshot.value as Map<String, dynamic>?;
    });
  }

  Future<void> updateProfile(Map<String, dynamic> data) async {
    await _database.child('users').child(_auth.currentUser!.uid).update(data);
  }

  Future<void> uploadProfileImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      File file = File(pickedFile.path);
      TaskSnapshot snapshot = await _storage
          .ref()
          .child('profile_images/${_auth.currentUser!.uid}')
          .putFile(file);
      String downloadUrl = await snapshot.ref.getDownloadURL();
      await updateProfile({'profile_image': downloadUrl});
    }
  }
}
