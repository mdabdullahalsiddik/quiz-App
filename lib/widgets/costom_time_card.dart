import 'package:flutter/material.dart';
import 'costom_text.dart';

Card CostomTimeCard(cardtime) {
    return Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.red, width: 1),
            borderRadius: BorderRadius.circular(50),
          ),
          child: SizedBox(
            height: 60,
            width: 60,
            child: Center(
              child: 
              CostomText(text: cardtime,color: Colors.red.shade700,fontSize: 25.0,)
            ),
          ),
        );
  }