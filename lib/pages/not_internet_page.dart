import 'dart:io';

import 'package:flutter/material.dart';

class NotInternet extends StatefulWidget {
  const NotInternet({super.key});

  @override
  State<NotInternet> createState() => _NotInternetState();
}

class _NotInternetState extends State<NotInternet> {
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
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.wifi_off,
                    size: 50,
                  ),
                  SizedBox(height: 20),
                  Text("Check Your Internet ...")
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
