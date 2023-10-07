import 'dart:js';
import 'verifiye.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:forth_project/login.dart';
import 'package:forth_project/logout.dart';
import 'firebase_options.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'login.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    routes: {
      "/": (context) => Home(),
      "/login": (context) => login(),
      "/logout": (context) => logout(),
      "/verify": (context) => varifird(),
    },
  ));
}

class Home extends StatefulWidget {
  @override
  homec createState() => homec();
}

class homec extends State<Home> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  // @override
  // void initstate() {
  //   // email = TextEditingController();
  //   // password = TextEditingController();
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
        title: Text("Register"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, Snapshot) {
          return Column(
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
                        try {
                          final email1 = email.text;
                          final pass = password.text;
                          final UserCredential = await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                  email: email1, password: pass);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == "invalid-email") {
                            Fluttertoast.showToast(
                                msg: "You Enter Wrong Email");
                          } else if (e.code == "email-already-in-use") {
                            Fluttertoast.showToast(
                                msg: 'Email is already Exist');
                          } else if (e.code == "weak-password") {
                            Fluttertoast.showToast(
                                msg: 'Your Password is Wrong');
                          } else {
                            print(e.code);
                          }
                        }
                        // Navigator.pushNamed(context, "/verify");
                        
                        final user = FirebaseAuth.instance.currentUser;
                        if(user!.emailVerified){
                          print("your email is verifiesd");
                        }
                        else{
                         await user.sendEmailVerification();
                        Navigator.pushNamed(context, '/login');
                        }
                        // if (user!.emailVerified) {
                        //   print("ccccccccccc");
                        // } else {
                        //   await user.sendEmailVerification();
                        // Navigator.pushNamed(context, '/login');
                        // Fluttertoast.showToast(
                        //     msg:
                        //         'we semd a verification code in yor gamil plese verrify your email');
                        // }
                        // int i = 0;
                        // while (user.emailVerified) {
                        //   print('email is veridired');
                        //   Navigator.pushNamed(context, "/login");
                        //   break;
                        // }

                        // print(UserCredential);
                      },
                      child: Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        color: Color.fromARGB(9, 40, 37, 211),
                        child: Text("Register"),
                      )),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/login");
                      },
                      child: Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        color: Color.fromARGB(9, 40, 37, 211),
                        child: Text("Login"),
                      ))
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
