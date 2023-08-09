import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_auth/services.dart';
import 'package:google_auth/login_screen.dart';
// import 'package:google_auth/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(FirebaseAuth.instance.currentUser!.photoURL!),
            const SizedBox(height: 20.0,),
            Text('${FirebaseAuth.instance.currentUser!.displayName}'),
            Text('${FirebaseAuth.instance.currentUser!.email}'),
            const SizedBox(height: 20.0,),
            ElevatedButton(onPressed: () async {
              await FirebaseServices().signOut();
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => const LogInScreen()),
              );
            }, child: const Text('Log Out')),
          ],
        ),
      ),
    );
  }
}
