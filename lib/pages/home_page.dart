import 'dart:io';
import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/costom_card.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [SizedBox(height: 20), OrderCard()],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
