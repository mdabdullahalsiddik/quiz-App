import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CostomText extends StatelessWidget {
  String? text;
  var color;
  var fontSize;
  var fontFamily;
  CostomText({
    this.text,
    this.color,
    this.fontSize,
    this.fontFamily,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toString(),
      style: TextStyle(
          fontFamily: fontFamily,
          color: color,
          fontSize: fontSize,
          fontWeight: FontWeight.bold),
    );
  }
}
