import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class varifird extends StatefulWidget {
  const varifird({super.key});

  @override
  State<varifird> createState() => _varifirdState();
}

class _varifirdState extends State<varifird> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("veri"),
      ),
      body: Center(
        child: Column(children: [
          ElevatedButton(
              onPressed: () async {
                final user = FirebaseAuth.instance.currentUser;
                if (user!.emailVerified) {
                  Navigator.pushNamed(context, "/login");
                } else {
                  await user.sendEmailVerification();
                  print("plese enter your emmmmmmmmmm");
                }
              },
              child: Container(
                color: Color.fromARGB(9, 40, 37, 211),
                child: Text("verify your Email"),
              ))
        ]),
      ),
    );
  }
}
