import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'costom_text.dart';

Row CostomRow(text, textcolor, value, ontap) {
  return Row(
    children: [
      Checkbox(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.black, width: 5),
          borderRadius: BorderRadius.circular(50),
        ),
        value: value,
        activeColor: Colors.orange,
        onChanged: ontap,
      ),
      CostomText(
        text: text.toString(),
        fontSize: 16.0,
        color: textcolor,
        fontFamily: "bangla",
      )
    ],
  );
}
