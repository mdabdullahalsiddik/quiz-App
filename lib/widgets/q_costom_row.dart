import 'package:flutter/material.dart';
import 'costom_text.dart';

Row QuCostomRow(qutext) {
  return Row(
    children: [
      Icon(
        Icons.question_mark,
        size: 60,
        color: Colors.red.shade700,
      ),
      CostomText(
        text: qutext,
        color: Colors.red,
        fontFamily: "bangla",
        fontSize: 18.0,
      )
    ],
  );
}
