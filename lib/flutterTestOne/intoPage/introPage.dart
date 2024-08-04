// // import 'dart:async';
// //
// // import 'package:flutter/material.dart';
// // import 'package:flutter_test_one/flutterTestOne/splashScreen/emailAuth/loginScreen.dart';
// // import 'package:flutter_test_one/flutterTestOne/splashScreen/emailAuth/singupScreen.dart';
// //
// // class IntroScreen extends StatefulWidget {
// //   const IntroScreen({Key? key}) : super(key: key);
// //
// //   @override
// //   State<IntroScreen> createState() => _SplashScreenState();
// // }
// //
// // class _SplashScreenState extends State<IntroScreen> {
// //   @override
// //
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //
// //       body: Center(
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.center,
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             Text(
// //               "Intro to Our App",
// //               style: TextStyle(
// //                 color: Colors.black,
// //                 fontSize: 35,
// //                 fontWeight: FontWeight.bold,
// //                 letterSpacing: 3,
// //               ),
// //             ),
// //             SizedBox(height: 20,),
// //             Text(
// //               "Experience seamless connectivity and effortless \n organization with our innovative app, empowering\nyou to achieve more with ease.",
// //               style: TextStyle(
// //                 color: Colors.black,
// //                 fontSize: 16,
// //               ),
// //               textAlign: TextAlign.center,
// //             ),
// //           SizedBox(height: 20,),
// //           SizedBox(
// //             width: 300,
// //             height: 280,
// //             child: Image(
// //               image: AssetImage('assets/images/img_1.png'),
// //               fit: BoxFit.cover, // You can adjust the BoxFit property as needed
// //             ),
// //           ),
// //             SizedBox(height: 40,),
// //             InkWell(
// //               onTap: () {
// //                 Navigator.push(
// //                   context,
// //                   MaterialPageRoute(builder: (context) => singupScreen()),
// //                 );
// //               },
// //               child: Container(
// //                 color: Colors.blue,
// //                 height: 40, // Adjust height as needed
// //                 width: 190, // Adjust width as needed
// //                 child: Center(
// //                   child: Text(
// //                     'Signup',
// //                     style: TextStyle(
// //                       color: Colors.white,
// //                       fontSize: 18,
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //             ),
// //             SizedBox(
// //               height: 20,
// //             ),
// //             InkWell(
// //               onTap: () {
// //                 Navigator.push(
// //                   context,
// //                   MaterialPageRoute(builder: (context) => loginScreen()),
// //                 );
// //               },
// //               child: Container(
// //
// //                 color: Colors.blue,
// //                 height: 40, // Adjust height as needed
// //                 width: 190, // Adjust width as needed
// //                 child: Center(
// //                   child: Text(
// //                     'Login',
// //                     style: TextStyle(
// //                       color: Colors.white,
// //                       fontSize: 18,
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //             )
// //
// //
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// //
// //
// // }
//
//
// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:flutter_test_one/flutterTestOne/splashScreen/emailAuth/loginScreen.dart';
// import 'package:flutter_test_one/flutterTestOne/splashScreen/emailAuth/singupScreen.dart';
// class IntroScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Container(
//
//
//           width: double.infinity,
//           height: MediaQuery.of(context).size.height,
//           padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
//           child: Column(
//             // even space distribution
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               Column(
//                 children: <Widget>[
//                   Text(
//                     "Welcome",
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 30,
//
//                     ),
//
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Text("Back to Intro Page Flutter provides extraordinary Functions And enjoy. ",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       color: Colors.grey[700],
//                       fontSize: 18,
//
//                     ),)
//                 ],
//               ),
//               Container(
//                 height: MediaQuery.of(context).size.height / 3,
//                 decoration: BoxDecoration(
//                     image: DecorationImage(
//                         image: AssetImage("assets/images/welcome1.png")
//                     )
//                 ),
//               ),
//
//               Column(
//                 children: <Widget>[
//                   // the login button
//                   MaterialButton(
//                     minWidth: double.infinity,
//                     height: 60,
//                     onPressed: () {
//                       Navigator.push(context, MaterialPageRoute(builder: (context) => loginScreen()));
//
//                     },
//                     // defining the shape
//                     shape: RoundedRectangleBorder(
//                         side: BorderSide(
//                             color: Colors.black
//                         ),
//                         borderRadius: BorderRadius.circular(50)
//                     ),
//                     child: Text(
//                       "Login",
//                       style: TextStyle(
//                           fontWeight: FontWeight.w600,
//                           fontSize: 18
//                       ),
//                     ),
//                   ),
//                   // creating the signup button
//                   SizedBox(height:20),
//                   MaterialButton(
//                     minWidth: double.infinity,
//                     height: 60,
//                     onPressed: (){
//                       Navigator.push(context, MaterialPageRoute(builder: (context)=> SingupPages()));
//
//                     },
//                     color: Color(0xff0095FF),
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(50)
//                     ),
//                     child: Text(
//                       "Sign up",
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.w600,
//                           fontSize: 18
//                       ),
//                     ),
//                   )
//
//                 ],
//               )
//
//
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }