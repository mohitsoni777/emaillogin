import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:forth_project/login.dart';
import 'firebase_options.dart';

void main() {
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ); // WidgetsFlutterBinding.ensureInitialized();
  // runApp(MaterialApp(
  // routes: {"/": (context) => login(), "/login": (context) => login()},
  // ));
}

class logout extends StatefulWidget {
  const logout({super.key});

  @override
  logoutc createState() => logoutc();
}

class logoutc extends State<logout> {
  @override
  Widget build(BuildContext context) {
    print(FirebaseAuth.instance.currentUser);

    if (FirebaseAuth.instance.currentUser!.emailVerified) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        body: Center(
          child: Column(
            children: [
              Text("Home Page"),
              ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                              title: Text("Sign Out"),
                              content: Text("Are you sure "),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("cancel"),
                                ),
                                TextButton(
                                  onPressed: () async {
                                    // final user =
                                    //     FirebaseAuth.instance.currentUser;
                                    // print(user);
                                    await FirebaseAuth.instance.signOut();
                                    // print(user);
                                    Navigator.pushNamed(context, "/login");
                                  },
                                  child: Text("Okey"),
                                )
                              ],
                            ));
                  },
                  child: Text("Logout"))
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        body: Center(
            child: Column(
          children: [
            Text("plese verify your email first "),
            ElevatedButton(
                onPressed: () async {
                  print(FirebaseAuth.instance.currentUser!.emailVerified);
                  Navigator.pop(context);
                },
                child: Text("click hear to enter the app"))
          ],
        )),
      );
    }
  }
}

class logouty extends StatelessWidget {
  const logouty({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("1234567890000000000000000");
  }
}
