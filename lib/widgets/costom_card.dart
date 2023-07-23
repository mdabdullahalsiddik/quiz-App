import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quiz_app/pages/q1_page.dart';
import 'package:quiz_app/pages/upcomming_page.dart';

import 'costom_text.dart';

class OrderCard extends StatelessWidget {
  OrderCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List titleList = ["ইসলাম", "নবী - রাসূল"];
    List imageList = [
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsrVkA4Be3FwyGBy7ntJcWOHR-_J43wp_B2w&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNkBAQGp9VXT_tglWC1cVAlzQI3xFnroMp7A&usqp=CAU"
    ];

    List onList = [Qu1Page(), UpCommingPage()];

    return GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 150,
        ),
        itemCount: imageList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => onList[index]));
            },
            child: Card(
              shadowColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 30.0),
                child: Column(
                  children: [
                    CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(imageList[index])),
                    SizedBox(height: 10),
                    CostomText(
                      color: Colors.black,
                      text: titleList[index],
                      fontSize: 18.0,
                      fontFamily: "bangla",
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
