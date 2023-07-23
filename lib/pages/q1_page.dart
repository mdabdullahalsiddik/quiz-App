import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/costom_button.dart';
import 'package:quiz_app/widgets/costom_row.dart';
import 'package:quiz_app/widgets/q_costom_row.dart';
import '../widgets/costom_time_card.dart';
import 'q2_page.dart';

class Qu1Page extends StatefulWidget {
  const Qu1Page({super.key});

  @override
  State<Qu1Page> createState() => _Qu1PageState();
}

class _Qu1PageState extends State<Qu1Page> {
  @override
  void initState() {
    // TODO: implement initState
    qu1();
    super.initState();
  }

  int time = 30;
  Future qu1() async {
    Future.delayed(Duration(seconds: 1)).then((value) {
      if (time > 0) {
        setState(
          () {
            time--;
            qu1();
          },
        );
      } else {
        if (checkBoxValue1 == true) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => Qu2Page(
                        scor: a + 1,
                        qunumber: 1,
                      )));
        } else {
          a = 0;
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => Qu2Page(
                        scor: a,
                        qunumber: 1,
                      )));
        }
      }
    });
  }

  int a = 0;
  bool? checkBoxValue1 = false;
  bool? checkBoxValue2 = false;
  bool? checkBoxValue3 = false;
  bool? checkBoxValue4 = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async {
        return Future(() => false);
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.green.shade100,
          body: SingleChildScrollView(
            child: Container(
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
                            "আল্লাহকে একক সত্তা হিসেবে\nস্বীকারও বিশ্বাস করাকে কি বলে?"),
                        CostomRow(
                          "তাওহীদ",
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
                          "আকাইদ",
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
                          "রিসালাত",
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
                          "নবুইয়্যত",
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
