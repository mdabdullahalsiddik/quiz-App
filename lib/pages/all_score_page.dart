import 'dart:io';

import 'package:flutter/material.dart';

import 'package:quiz_app/widgets/costom_scor_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class AllScore extends StatefulWidget {
  var score;
  var question;
  AllScore({this.score, this.question, super.key});

  @override
  State<AllScore> createState() => _AllScoreState();
}

class _AllScoreState extends State<AllScore> {
  var myScore = "0";
  var myQuestion = "0";
  dataget() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    setState(() {
      myScore = spref.getString("Score") ?? 0.toString();
      myQuestion = spref.getString("Question") ?? 0.toString();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    dataget();
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
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Dismissible(
                      key: ValueKey("value"),
                      background: Container(
                        color: Colors.red,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(Icons.delete),
                            Icon(Icons.delete),
                          ],
                        ),
                      ),
                      child: ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ScoreCostomCard("সর্বশেষ স্কোর", myScore),
                            ScoreCostomCard("প্রশ্ন সংখ্যা", myQuestion),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
