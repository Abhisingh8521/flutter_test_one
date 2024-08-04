// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test_one/flutterTestOne/splashScreen/emailAuth/loginScreen.dart';
// import '../Updare/UpdateProfile.dart';
//
// class homeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<homeScreen> {
//   final TextEditingController firstnameController = TextEditingController();
//   final TextEditingController lastnameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//
//   Map<String, dynamic>? userData;
//   String? imageUrl; // To store the image URL
//
//   @override
//   Widget build(BuildContext context) {
//     var currentUser = FirebaseAuth.instance.currentUser;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile'),
//         centerTitle: true,
//       ),
//       body: FutureBuilder<DocumentSnapshot>(
//         future: FirebaseFirestore.instance.collection('users').doc(currentUser?.uid).get(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           }
//
//           if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           }
//
//           if (!snapshot.hasData || snapshot.data == null || !snapshot.data!.exists) {
//             return Center(child: Text('No user data available.'));
//           }
//           userData = snapshot.data!.data() as Map<String, dynamic>;
//           imageUrl = userData!['profile_image']; // Replace 'profile_image' with your image URL key
//           return Center(
//             child: Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   imageUrl != null
//                       ? Image.network(
//                     imageUrl!,
//                     width: 150,
//                     height: 150,
//                     fit: BoxFit.cover,
//                   )
//                       : Image.asset(
//                     'assets/images/profile.png',
//                     width: 150,
//                     height: 150,
//                     fit: BoxFit.cover,
//                   ),
//                   SizedBox(height: 20,),
//                   TextFormField(
//                     readOnly: true,
//                     controller: firstnameController..text = userData!['first_name'],
//                     decoration: InputDecoration(
//                       labelText: ' First Name',
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.zero,
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                     width: 10,
//                   ),
//                   TextFormField(
//                     readOnly: true,
//                     controller: lastnameController..text = userData!['last_name'],
//                     decoration: InputDecoration(
//                       labelText: 'Last Name',
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.zero,
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                     width: 10,
//                   ),
//                   TextFormField(
//                     readOnly: true,
//                     controller: emailController..text = userData!['email'],
//                     decoration: InputDecoration(
//                       labelText: 'Your Email',
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.zero,
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                     width: 10,
//                   ),
//                   SizedBox(height: 20),
//                   ElevatedButton(
//                     onPressed: () {
//                       if (userData != null) {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => UpdateProfile(userData: userData!),
//                           ),
//                         );
//                       } else {
//                         print('User data is null.');
//                       }
//                     },
//                     child: Text("Update"),
//                   ),
//                   SizedBox(height: 20),
//                   ElevatedButton(
//                     onPressed: () async {
//                       try {
//                         await FirebaseAuth.instance.signOut();
//                         // Navigator.push(
//                         //   context,
//                         //   MaterialPageRoute(
//                         //     builder: (context) => loginScreen(),
//                         //   ),
//                         // );
//                       } catch (e) {
//                         print("Error signing out: $e");
//                         // Handle error if sign out fails
//                       }
//                     },
//                     child: Text("LogOut"),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
