import 'package:flutter/material.dart';
import 'costom_text.dart';

// ignore: must_be_immutable
class CostomButton extends StatelessWidget {
  var ontap;
  CostomButton({
    this.ontap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: ontap,
      child: CostomText(text: "সাবমিট করুন", color: Colors.black,fontFamily: "bangla",),
      style:
          ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.orange)),
    );
  }
}
