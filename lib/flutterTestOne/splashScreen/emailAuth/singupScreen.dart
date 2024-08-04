// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_test_one/flutterTestOne/homeScreen.dart';
// import 'package:flutter_test_one/flutterTestOne/splashScreen/emailAuth/loginScreen.dart';
// import 'package:fluttertoast/fluttertoast.dart';
//
// class SingupPages extends StatefulWidget {
//   const SingupPages({super.key});
//
//   @override
//   _RegistrationFormState createState() => _RegistrationFormState();
// }
//
// class _RegistrationFormState extends State<SingupPages> {
//   final TextEditingController _firstnameController = TextEditingController();
//   final TextEditingController _lastnameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   bool _isChecked = false;
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//
//   Future<void> signup() async {
//     if (!_formKey.currentState!.validate() || !_isChecked) {
//       return;
//     }
//
//     try {
//       UserCredential userCredential =
//       await _auth.createUserWithEmailAndPassword(
//         email: _emailController.text,
//         password: _passwordController.text,
//       );
//
//       Map<String, dynamic> userData = {
//         'first_name': _firstnameController.text,
//         'last_name': _lastnameController.text,
//         'email': _emailController.text,
//       };
//
//       await FirebaseFirestore.instance
//           .collection('users')
//           .doc(userCredential.user?.uid)
//           .set(userData);
//
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => homeScreen()),
//       );
//
//       Fluttertoast.showToast(
//         msg: 'Sign Up Successfully',
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.BOTTOM,
//       );
//     } catch (e) {
//       print('Error during registration: $e');
//       Fluttertoast.showToast(
//         msg: 'Registration Failed: $e',
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.BOTTOM,
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Sign up Form'),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 SizedBox(
//                   height: 50,
//                 ),
//                 TextFormField(
//                   controller: _firstnameController,
//                   decoration: const InputDecoration(
//                     labelText: 'First name',
//                     suffixIcon: Icon(Icons.people),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.zero,
//                     ),
//                   ),
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Please enter your first name';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 16.0),
//                 TextFormField(
//                   controller: _lastnameController,
//                   decoration: const InputDecoration(
//                     labelText: 'Last name',
//                     suffixIcon: Icon(Icons.people),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.zero,
//                     ),
//                   ),
//                   keyboardType: TextInputType.text,
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Please enter your last name';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 16.0),
//                 TextFormField(
//                   controller: _emailController,
//                   keyboardType: TextInputType.emailAddress,
//                   decoration: InputDecoration(
//                     labelText: 'Email',
//                     suffixIcon: Icon(Icons.email),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.zero,
//                     ),
//                   ),
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Please enter your email';
//                     }
//                     // You can add more email validation logic here if needed
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 16.0),
//                 TextFormField(
//                   controller: _passwordController,
//                   obscureText: true,
//                   decoration: InputDecoration(
//                     labelText: 'Password',
//                     suffixIcon: Icon(Icons.password),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.zero,
//                     ),
//                   ),
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Please enter your password';
//                     }
//                     // You can add more password validation logic here if needed
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 10.0),
//                 Row(
//                   children: [
//                     Checkbox(
//                       value: _isChecked,
//                       onChanged: (bool? value) {
//                         setState(() {
//                           _isChecked = value!;
//                         });
//                       },
//                     ),
//                     Text('I agree to terms and conditions'),
//                   ],
//                 ),
//                 const SizedBox(height: 10.0),
//                 ElevatedButton(
//                   onPressed: signup,
//                   child: const Text(
//                     'Sign Up',
//                     style: TextStyle(color: Colors.white, letterSpacing: 3),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 50,
//                   child: Container(
//                     child: TextButton(
//                       onPressed: () {
//                         Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => loginScreen(),
//                           ),
//                         );
//                       },
//                       child: Text('Already have an Account'),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
