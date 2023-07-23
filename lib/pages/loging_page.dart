// ignore_for_file: override_on_non_overriding_member

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/costom_text.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_left_right_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  dataset() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    setState(() {
      spref.setString("Mail", mailController.text.toString());
      spref.setString("Password", passwordController.text.toString());
    });
  }

  var _passwordVisible;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return (await showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Confirmation"),
                content: Text("Are you suru exit."),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.orange)),
                          onPressed: () {
                            Navigator.pop(context, false);
                          },
                          child: Text(
                            "No",
                            style: TextStyle(color: Colors.black),
                          )),
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.orange)),
                          onPressed: () {
                            exit(0);
                          },
                          child: Text("Yes",
                              style: TextStyle(color: Colors.black))),
                    ],
                  )
                ],
              );
            }));
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.green.shade100,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 100.0),
                Padding(
                  padding:
                      EdgeInsets.only(left: 20.0, right: 20.0, bottom: 8.0),
                  child: Row(
                    children: [Text("Mail")],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
                  child: TextField(
                    controller: mailController,
                    decoration: InputDecoration(
                      hintText: "flutter@gmail.com",
                      labelText: "Mail",
                      hintStyle: TextStyle(color: Colors.black),
                      labelStyle: TextStyle(color: Colors.black),
                      prefixIcon: Icon(Icons.mail),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green)),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: 20.0, right: 20.0, bottom: 8.0),
                  child: Row(
                    children: [Text("Password")],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: 20.0, right: 20.0, bottom: 8.0),
                  child: TextField(
                    controller: passwordController,
                    obscureText: !_passwordVisible,
                    decoration: InputDecoration(
                      hintText: "!@#%^*123456789",
                      labelText: "Password",
                      hintStyle: TextStyle(color: Colors.black),
                      labelStyle: TextStyle(color: Colors.black),
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(
                          // Based on passwordVisible state choose the icon
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Theme.of(context).primaryColorDark,
                        ),
                        onPressed: () {
                          // Update the state i.e. toogle the state of passwordVisible variable
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green)),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
                      child: InkWell(
                        onTap: () {
                          dataset();
                          if (mailController.text.toString().isNotEmpty &&
                              passwordController.text.toString().isNotEmpty) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => LeftToRight()));
                          }
                        },
                        child: SizedBox(
                          height: 75.0,
                          width: MediaQuery.of(context).size.width,
                          child: Card(
                            color: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Center(
                                child: CostomText(
                              text: "Login",
                              color: Colors.black,
                              fontSize: 24.0,
                            )),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
