import 'package:flutter/material.dart';
import 'package:google_auth/services.dart';

import 'home_screen.dart';


class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(40.0),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: const [0.1, 0.4, 0.7, 0.9],
                colors: [
                  Colors.purple.shade600,
                  Colors.purple.shade500,
                  Colors.purple.shade300,
                  Colors.purple.shade200,
                ]
            )
        ),
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              ElevatedButton(onPressed: () async {
                await FirebaseServices().signInWithGoogle();
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              }, child: const Text('Login with google')),

            ],
          ),
        ),
      ),
    );
  }
}


