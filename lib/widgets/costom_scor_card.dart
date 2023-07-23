import 'package:flutter/material.dart';
import 'costom_text.dart';

Card ScoreCostomCard(title, score) {
  return Card(
    shadowColor: Colors.black,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    child: SizedBox(
      height: 150,
      width: 150,
      child: Padding(
        padding: EdgeInsets.only(top: 30.0),
        child: Column(
          children: [
            CostomText(
              text: title,
              color: Colors.black,
              fontSize: 20.0,
            ),
            SizedBox(height: 10),
            CostomText(
              text: score,
              color: Colors.red,
              fontSize: 30.0,
            ),
          ],
        ),
      ),
    ),
  );
}
