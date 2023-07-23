import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'all_score_page.dart';
import 'home_page.dart';

// ignore: must_be_immutable
class LeftToRight extends StatefulWidget {
  int? score;
  int? question;
  LeftToRight({this.score, this.question});

  @override
  State<LeftToRight> createState() => _LeftToRightState();
}

class _LeftToRightState extends State<LeftToRight> {
  var myScore;
  dataget() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    setState(() {
      myScore = spref.getString("Score") ?? 0.toString();
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
    return DefaultTabController(
        length: 2,
        child: SafeArea(
          child: Scaffold(
              backgroundColor: Colors.green.shade100,
              appBar: AppBar(
                backgroundColor: Colors.green.shade200,
                iconTheme: IconThemeData(color: Colors.green.shade200),
                centerTitle: true,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKjj8GwyGQqHDG7snzwTSPlJ9Glr1FBjFgEw&usqp=CAU"),
                    ),
                    SizedBox(width: 15),
                    RichText(
                        text: TextSpan(
                            text: "সর্বোচ্চ স্কোর  : ",
                            style: TextStyle(
                                fontFamily: "bangla",
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                            children: [
                          TextSpan(
                            text: myScore,
                            style: TextStyle(
                                fontFamily: "bangla",
                                color: Colors.red,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )
                        ])),
                  ],
                ),
                bottom: TabBar(
                    indicatorColor: Colors.black,
                    labelColor: Colors.black,
                    tabs: [
                      Tab(
                        icon: Icon(
                          Icons.home,
                        ),
                        text: "Home",
                      ),
                      Tab(
                        icon: Icon(Icons.score),
                        text: "Score",
                      ),
                    ]),
              ),
              body: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: TabBarView(
                  children: [
                    HomePage(),
                    AllScore(
                      score: widget.score,
                      question: widget.question,
                    ),
                  ],
                ),
              )),
        ));
  }
}
