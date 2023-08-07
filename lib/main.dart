import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'login_screen.dart';
// import 'package:google_sign_in/google_sign_in.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // GoogleSignIn _googleSignIn = GoogleSignIn(
  //   clientId: '870295326689-tcccfaue6i762a3otltjgknpd2dq1aul.apps.googleusercontent.com',
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
      home: const LogInScreen(),
    );
  }
}