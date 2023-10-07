import 'package:firebase_core/firebase_core.dart';
// import 'main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:forth_project/login.dart';
import 'firebase_options.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'login.dart';

void main() {
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
      // routes: {"/": (context) => login(), "/login": (context) => login()},
      ));
}

class login extends StatefulWidget {
  loginc createState() => loginc();
}

class loginc extends State<login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  // void initstate() {
  //   // email = TextEditingController();
  //   // password = TextEditingController();
  //   print("tttttttttttttt");
  //   final user = FirebaseAuth.instance.currentUser;
  //   print(user);
  //   super.initState();
  // }

  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            TextField(
              controller: email,
              decoration: InputDecoration(hintText: "Enter your Email"),
              autocorrect: false,
              enableSuggestions: false,
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: password,
              decoration: InputDecoration(hintText: "Enter your Email"),
              autocorrect: false,
              enableSuggestions: false,
              obscureText: true,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    // print("fffff");
                    // final user = FirebaseAuth.instance.currentUser;
                    // print(user);
                    // print(FirebaseAuth.instance.currentUser);
                    // }
                    try {
                      final email1 = email.text;
                      final pass = password.text;
                      // final user = FirebaseAuth.instance.currentUser;
                      // if (FirebaseAuth.instance.currentUser!.emailVerified) {
                        final UserCredential = await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: email1, password: pass);
                        Navigator.pushNamed(context, "/logout");
                      // } else {
                        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            // content: Text("plese first verify your email")));
                      // }

                      // print(UserCredential);
                    } on FirebaseAuthException catch (e) {
                      print(e.code);
                      if (e.code == "INVALID_LOGIN_CREDENTIALS") {
                        print("jjjjjjj");
                        // ScaffoldMessenger.of(context)
                        //     .showSnackBar(SnackBar(content: Text(e.code)));
                        Fluttertoast.showToast(
                            msg: "plese enter valid password or email");
                      } else if (e.code == "invalid-email") {
                        print("wrong email");
                        Fluttertoast.showToast(msg: "plese enter valid email");
                      } else {
                        print("hhhhhh");
                        print(e);
                      }
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    color: Color.fromARGB(9, 40, 37, 211),
                    child: Text("Login"),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/");
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      color: Color.fromARGB(9, 40, 37, 211),
                      child: Text("Register"),
                    ))
              ],
            ),
          ],
        ));
  }
}
