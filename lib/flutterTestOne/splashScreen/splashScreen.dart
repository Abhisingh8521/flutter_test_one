// import 'dart:async';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test_one/flutterTestOne/homeScreen.dart';
// import 'package:flutter_test_one/flutterTestOne/intoPage/introPage.dart';
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Timer(const Duration(seconds: 3), () => userCheck(context));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//      // backgroundColor: Colors.indigoAccent,
//       body: Center(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               "Welcome to Our Apps",
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 25,
//
//                 fontWeight: FontWeight.bold,
//                 letterSpacing: 4,
//               ),
//             ),
//             SizedBox(height: 50,),
//             SizedBox(
//               width: 300,
//               height: 280,
//               child: CircleAvatar(
//                 backgroundImage: AssetImage('assets/images/splash.png'),
//               ),
//             ),
//             SizedBox(
//               height: 80,
//             ),
//
//           ],
//         ),
//       ),
//     );
//   }
//   void userCheck(BuildContext context) async {
//     var currentUser = FirebaseAuth.instance.currentUser;
//
//     if (currentUser != null) {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) =>  homeScreen()),
//       );
//     } else {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) =>  IntroScreen()),
//       );
//     }
//   }
// }
