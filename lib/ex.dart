// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';
// import 'package:vsr_app/view/SummaryListScreen.dart';
//
// import 'OTP Screen.dart';
//
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);
//
//   @override
//   // ignore: library_private_types_in_public_api
//   _LoginScreenState createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
//
//   Future<void> _handleGoogleSignIn() async {
//     try {
//       final GoogleSignInAccount? googleSignInAccount =
//           await _googleSignIn.signIn();
//       if (googleSignInAccount != null) {
//         final GoogleSignInAuthentication googleSignInAuthentication =
//             await googleSignInAccount.authentication;
//         final AuthCredential credential = GoogleAuthProvider.credential(
//           accessToken: googleSignInAuthentication.accessToken,
//           idToken: googleSignInAuthentication.idToken,
//         );
//         final UserCredential authResult =
//             await _auth.signInWithCredential(credential);
//         final User? user = authResult.user;
//         if (user != null) {
//           showToast("Login Successfully", false);
//           Navigator.pushAndRemoveUntil(
//               context,
//               MaterialPageRoute(builder: (context) => ResultScreen()),
//               (route) => false);
//         } else {
//           showToast("Google Sign-In Failed", true);
//         }
//       }
//     } catch (error) {
//       print(error);
//     }
//   }
//
//   final _phoneKey = GlobalKey<FormState>();
//   TextEditingController phoneController = TextEditingController();
//   bool _isPhoneNumberValid = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Form(
//               key: _phoneKey,
//               child: Column(
//                 children: [
//                   IntlPhoneField(
//                     controller: phoneController,
//                     decoration: const InputDecoration(
//                       labelText: 'Phone Number',
//                       prefixIcon: Icon(Icons.phone),
//                     ),
//                     initialCountryCode: 'IN',
//                     onChanged: (phone) {
//                       setState(() {
//                         _isPhoneNumberValid = phone.isValidNumber();
//                       });
//                     },
//                     onSaved: (phone) {
//                       final completePhoneNumber = phone?.completeNumber;
//                       final countryCode = phone?.countryCode;
//                     },
//                   ),
//                   SizedBox(height: 20),
//                   ElevatedButton(
//                     onPressed: _isPhoneNumberValid
//                         ? () {
//                             if (_phoneKey.currentState!.validate()) {
//                               _phoneKey.currentState!.save();
//                               Navigator.of(context).push(MaterialPageRoute(
//                                   builder: (context) =>
//                                       OTPScreen(phoneController.text)));
//                             }
//                           }
//                         : null,
//                     child: Text('Send OTP'),
//                   ),
//                   SizedBox(height: 20),
//                   ElevatedButton.icon(
//                     onPressed: _handleGoogleSignIn,
//                     icon: Image.asset(
//                       "assets/g_logo.png",
//                       scale: 20,
//                     ),
//                     label: Text('Sign in with Google'),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   void _phoneAuth() async {
//     if (_phoneKey.currentState!.validate()) {
//       String phoneNumber = phoneController.text;
//       try {
//         await _auth.verifyPhoneNumber(
//           phoneNumber: phoneNumber,
//           verificationCompleted: (PhoneAuthCredential credential) async {
//             await _auth.signInWithCredential(credential);
//             showToast("Phone Number Verified", false);
//             // Navigate to the next screen or perform desired actions
//           },
//           verificationFailed: (FirebaseAuthException e) {
//             print('Error: ${e.message}');
//             showToast('Error: ${e.message}', true);
//           },
//           codeSent: (String verificationId, int? resendToken) {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => otpscreen(verificationId, phoneNumber),
//               ),
//             );
//           },
//           codeAutoRetrievalTimeout: (String verificationId) {},
//         );
//       } catch (error) {
//         print(error);
//       }
//     }
//   }
//
//   void showToast(String message, bool isFailure) {
//     Fluttertoast.showToast(
//       msg: message,
//       toastLength: Toast.LENGTH_LONG,
//       gravity: ToastGravity.BOTTOM,
//       backgroundColor: isFailure ? Colors.red : Colors.green,
//       textColor: Colors.white,
//       fontSize: 16.0,
//   );
// }
// }