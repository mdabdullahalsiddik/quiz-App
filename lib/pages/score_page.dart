import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_left_right_page.dart';

// ignore: must_be_immutable
class ScorePage extends StatefulWidget {
  int? scor;
  int? qunumber;
  ScorePage({required this.scor, required this.qunumber});
  @override
  State<ScorePage> createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {
  @override
  inChang() async {
    State<ScorePage> createState() => _ScorePageState();
    SharedPreferences spref = await SharedPreferences.getInstance();
    await spref.setString("Score", widget.scor.toString());
    await spref.setString("Question", widget.qunumber.toString());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    inChang();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => LeftToRight(
              score: widget.scor,
              question: widget.qunumber,
            ),
          ),
        );
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.green.shade100,
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            backgroundColor: Colors.green.shade100,
            elevation: 0,
            leading: InkWell(
              onTap: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => LeftToRight(
                            score: widget.scor,
                            question: widget.qunumber,
                          )),
                );
              },
              child: Icon(Icons.arrow_back),
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              color: Colors.green.shade100,
              // height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKjj8GwyGQqHDG7snzwTSPlJ9Glr1FBjFgEw&usqp=CAU"),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "প্রশ্ন সংখ্যা",
                    style: TextStyle(
                        fontFamily: "bangla",
                        color: Colors.red.shade900,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Text(
                    widget.qunumber.toString(),
                    style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "টোটাল স্কোর",
                    style: TextStyle(
                        fontFamily: "bangla",
                        color: Colors.red.shade900,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Text(
                    widget.scor.toString(),
                    style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Text(widget.scor == 3
                      ? "অভিনন্দন!! খুব ভালো করেছেন |"
                      : "আবার চেষ্টা করুন |"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
