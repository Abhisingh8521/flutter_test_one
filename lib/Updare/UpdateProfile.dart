// import 'dart:io';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:image_picker/image_picker.dart';
// import '../flutterTestOne/homeScreen.dart';
//
// class UpdateProfile extends StatefulWidget {
//   final Map<String, dynamic> userData;
//   UpdateProfile({required this.userData});
//
//   @override
//   _UpdateProfileState createState() => _UpdateProfileState();
// }
//
// class _UpdateProfileState extends State<UpdateProfile> {
//   late TextEditingController updatedfirstNameController;
//   late TextEditingController updatedlastNameController;
//   late TextEditingController updatedEmailController;
//   bool _isLoading = false;
//   File? _image;
//   double _uploadProgress = 0.0;
//
//   @override
//   void initState() {
//     super.initState();
//
//     updatedfirstNameController =
//         TextEditingController(text: widget.userData['first_name']);
//     updatedlastNameController =
//         TextEditingController(text: widget.userData['last_name']);
//     updatedEmailController =
//         TextEditingController(text: widget.userData['email']);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Update Profile'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               GestureDetector(
//                 onTap: () {
//                   _uploadImage(); // Open image picker on tap
//                 },
//                 child: Container(
//                   width: 150,
//                   height: 140,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     image: _image != null
//                         ? DecorationImage(
//                       image: FileImage(_image!),
//                       fit: BoxFit.cover,
//                     )
//                         : const DecorationImage(
//                       image: AssetImage('assets/images/profile.png'),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               TextFormField(
//                 controller: updatedfirstNameController,
//                 decoration: InputDecoration(
//                   suffixIcon: Icon(Icons.people),
//                   labelText: 'First Name',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.zero,
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               TextFormField(
//                 controller: updatedlastNameController,
//                 decoration: const InputDecoration(
//                   suffixIcon: Icon(Icons.people),
//                   labelText: 'Last Name',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.zero,
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               TextFormField(
//                 controller: updatedEmailController,
//                 enabled: false,
//                 decoration: const InputDecoration(
//                   labelText: 'Updated Email',
//                   suffixIcon: Icon(Icons.email),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.zero,
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   setState(() {
//                     _isLoading = true;
//                   });
//                   if (_image != null) {
//                     _uploadProfileImage();
//                   } else {
//                     updateUserDataInFirestore(
//                       updatedfirstNameController.text,
//                       updatedlastNameController.text,
//                     );
//                   }
//                 },
//                 child: Text("Save Changes"),
//               ),
//               SizedBox(height: 20),
//               if (_uploadProgress > 0 && _uploadProgress < 1)
//                 LinearProgressIndicator(value: _uploadProgress),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Future<void> _uploadImage() async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);
//
//     if (pickedFile != null) {
//       setState(() {
//         _image = File(pickedFile.path);
//       });
//     } else {
//       print('No image selected.');
//     }
//   }
//
//   Future<void> _uploadProfileImage() async {
//     try {
//       String fileName = DateTime.now().millisecondsSinceEpoch.toString();
//       Reference firebaseStorageRef =
//       FirebaseStorage.instance.ref().child('userProfileImages/$fileName.jpg');
//       UploadTask uploadTask = firebaseStorageRef.putFile(_image!);
//
//       uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
//         setState(() {
//           _uploadProgress = snapshot.bytesTransferred / snapshot.totalBytes;
//         });
//       });
//
//       uploadTask.whenComplete(() async {
//         String imageUrl = await firebaseStorageRef.getDownloadURL();
//         updateUserDataInFirestoreWithImage(
//           updatedfirstNameController.text,
//           updatedlastNameController.text,
//           imageUrl,
//         );
//         print('Uploaded Image Url: $imageUrl');
//       });
//     } catch (error) {
//       print('Error uploading image: $error');
//     }
//   }
//
//   void updateUserDataInFirestore(
//       String updatedName,
//       String updatedPhone,
//       ) async {
//     try {
//       var currentUser = FirebaseAuth.instance.currentUser;
//       if (currentUser != null) {
//         var userDocRef =
//         FirebaseFirestore.instance.collection('users').doc(currentUser.uid);
//
//         await userDocRef.update({
//           'first_name': updatedName,
//           'last_name': updatedPhone,
//         });
//         Fluttertoast.showToast(
//           msg: 'Successfully updated',
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.BOTTOM,
//         );
//         setState(() {
//           _isLoading = false;
//         });
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => homeScreen()),
//         );
//       } else {
//         setState(() {
//           _isLoading = false;
//         });
//         print('Current user is null.');
//       }
//     } catch (error) {
//       setState(() {
//         _isLoading = false;
//       });
//       print('Error updating user data: $error');
//     }
//   }
//
//   void updateUserDataInFirestoreWithImage(
//       String updatedName,
//       String updatedPhone,
//       String imageUrl,
//       ) async {
//     try {
//       var currentUser = FirebaseAuth.instance.currentUser;
//       if (currentUser != null) {
//         var userDocRef =
//         FirebaseFirestore.instance.collection('users').doc(currentUser.uid);
//
//         await userDocRef.update({
//           'first_name': updatedName,
//           'last_name': updatedPhone,
//           'profile_image': imageUrl,
//         });
//         Fluttertoast.showToast(
//           msg: 'Successfully updated',
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.BOTTOM,
//         );
//
//         setState(() {
//           _isLoading = false;
//         });
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => homeScreen()),
//         );
//       } else {
//         print('Current user is null.');
//       }
//     } catch (error) {
//       print('Error updating user data: $error');
//     }
//   }
//
//   @override
//   void dispose() {
//     updatedfirstNameController.dispose();
//     updatedlastNameController.dispose();
//     updatedEmailController.dispose();
//     super.dispose();
//   }
// }
