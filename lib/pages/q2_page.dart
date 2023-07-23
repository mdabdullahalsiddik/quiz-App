import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/costom_button.dart';
import 'package:quiz_app/widgets/costom_row.dart';
import 'package:quiz_app/widgets/costom_time_card.dart';
import 'package:quiz_app/widgets/q_costom_row.dart';
import 'q3_page.dart';

// ignore: must_be_immutable
class Qu2Page extends StatefulWidget {
  int scor;
  int qunumber;

  Qu2Page({required this.scor, required this.qunumber});

  @override
  State<Qu2Page> createState() => _Qu2PageState();
}

class _Qu2PageState extends State<Qu2Page> {
  @override
  void initState() {
    // TODO: implement initState
    qu2();
    super.initState();
  }

  int time = 30;
  Future qu2() async {
    Future.delayed(Duration(seconds: 1)).then((value) {
      if (time > 0) {
        setState(() {
          time--;
          qu2();
        });
      } else {
        if (checkBoxValue3 == true) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => Qu3Page(
                        scor: widget.scor + 1,
                        qunumber: widget.qunumber + 1,
                      )));
        } else {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => Qu3Page(
                        scor: widget.scor + 0,
                        qunumber: widget.qunumber + 1,
                      )));
        }
      }
    });
  }

  bool? checkBoxValue1 = false;
  bool? checkBoxValue2 = false;
  bool? checkBoxValue3 = false;
  bool? checkBoxValue4 = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return Future(() => false);
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.green.shade100,
          body: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Container(
              // height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,

              child: Column(
                children: [
                  SizedBox(height: 50),
                  CostomTimeCard("$time"),
                  Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    margin: EdgeInsets.fromLTRB(20, 100, 20, 0),
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        QuCostomRow(
                            "কোন পর্বতের গুহায় মহানবী (সা.)-\nএর নিকট ওহী নাযিল হয়?"),
                        CostomRow(
                          "সাফা",
                          Colors.orange,
                          checkBoxValue1,
                          (newValue) {
                            setState(() {
                              checkBoxValue1 = newValue;
                              if (checkBoxValue1 == true) {
                                checkBoxValue2 = false;
                                checkBoxValue3 = false;
                                checkBoxValue4 = false;
                              }
                            });
                          },
                        ),
                        CostomRow(
                          "মারওয়া",
                          Colors.orange,
                          checkBoxValue2,
                          (newValue) {
                            setState(() {
                              checkBoxValue2 = newValue;
                              if (checkBoxValue2 == true) {
                                checkBoxValue1 = false;
                                checkBoxValue3 = false;
                                checkBoxValue4 = false;
                              }
                            });
                          },
                        ),
                        CostomRow(
                          "হেরা",
                          Colors.orange,
                          checkBoxValue3,
                          (newValue) {
                            setState(() {
                              checkBoxValue3 = newValue;
                              if (checkBoxValue3 == true) {
                                checkBoxValue1 = false;
                                checkBoxValue2 = false;
                                checkBoxValue4 = false;
                              }
                            });
                          },
                        ),
                        CostomRow(
                          "সওর",
                          Colors.orange,
                          checkBoxValue4,
                          (newValue) {
                            setState(() {
                              checkBoxValue4 = newValue;
                              if (checkBoxValue4 == true) {
                                checkBoxValue1 = false;
                                checkBoxValue2 = false;
                                checkBoxValue3 = false;
                              }
                            });
                          },
                        ),
                        CostomButton(
                          ontap: () {
                            time = -1;
                          },
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
