import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_auth/login_screen.dart';

import 'firebase_options.dart';

// import 'firebase_options.dart';

// import 'login_screen.dart';
// import 'package:google_sign_in/google_sign_in.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,

  );
  // GoogleSignIn _googleSignIn = GoogleSignIn(
  //   clientId: '870295326689-fb94msth9m8tpjjps15930ig8h7qsnqa.apps.googleusercontent.com',
  // );

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Phone Number OTP Auth',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LogInScreen(),
    );
  }
}




// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// // import 'SummaryListScreen.dart';
// import 'package:google_sign_in/google_sign_in.dart';
//
// import 'firebase_options.dart';
// import 'home_screen.dart';
//
//
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(const LoginScreen());
// }
//
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});
//
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('LoginPage'),
//         ),
//         body: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.1,
//             ),
//             const Text(
//               'Your Phone Number',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 20,
//               ),
//             ),
//             const Text(
//               'Please confirm your country code\nand enter your phone number',
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.height * 0.1,
//             ),
//             const Padding(
//               padding: EdgeInsets.all(8.0),
//               child: Divider(
//                 height: 5,
//                 color: Colors.black,
//               ),
//             ),
//             ElevatedButton.icon(
//               onPressed: () async {
//                 User? user = await _signInWithGoogle();
//                 if (user != null) {
//                   Navigator.pushAndRemoveUntil(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => const HomeScreen(),
//                       ),
//                           (route) => false);
//                   // ignore: avoid_print
//                   print("Google Sign-In Successful: ${user.displayName}");
//                 }
//               },
//               icon: const FaIcon(
//                 FontAwesomeIcons.google,
//                 color: Colors.white,
//               ),
//               label: const Text(
//                 "Sign-In with Google",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final GoogleSignIn _googleSignIn = GoogleSignIn();
//
//   Future<User?> _signInWithGoogle() async {
//     try {
//       final GoogleSignInAccount? googleSignInAccount =
//       await _googleSignIn.signIn();
//       if (googleSignInAccount != null) {
//         final GoogleSignInAuthentication googleSignInAuth =
//         await googleSignInAccount.authentication;
//         final AuthCredential credential = GoogleAuthProvider.credential(
//           accessToken: googleSignInAuth.accessToken,
//           idToken: googleSignInAuth.idToken,
//         );
//         final UserCredential authResult =
//         await _auth.signInWithCredential(credential);
//         final User? user = authResult.user;
//         return user;
//       }
//     } catch (e) {
//       // ignore: avoid_print
//       print("Google Sign-In Error: $e");
//       return null;
//     }
//     return null;
//     }
// }