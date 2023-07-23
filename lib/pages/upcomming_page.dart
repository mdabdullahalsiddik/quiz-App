import 'package:flutter/material.dart';

class UpCommingPage extends StatefulWidget {
  const UpCommingPage({super.key});

  @override
  State<UpCommingPage> createState() => _UpCommingPageState();
}

class _UpCommingPageState extends State<UpCommingPage> {
  @override
  Widget build(BuildContext context) {
    
    return AlertDialog(
        backgroundColor: Colors.green.shade100,
        title: Text("Upcomming ..."),
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"))
        ]);
  }
}
