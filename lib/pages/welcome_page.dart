import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_left_right_page.dart';
import 'loging_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  StreamSubscription? subscription;
  var myMail ;
  var myPassword ;
  dataget() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    setState(() {
      myMail = spref.getString("Mail");
      myPassword = spref.getString("Password");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    welcome();
dataget();
    ;
    super.initState();
    
  }

      
    Future welcome()async{
      Future.delayed(Duration(seconds: 5)).then((value) => {
        if (myMail  == null && myPassword == null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => LoginPage()))
      }else if (myMail.toString().isEmpty && myPassword.toString().isEmpty) {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => LoginPage()))
      } else {
        Navigator.push(context, MaterialPageRoute(builder: (_) => LeftToRight()))
      }
      });
    }
      
    
      @override
      void dispose() {
        subscription!.cancel();
        super.dispose();
      }
    
      @override
      Widget build(BuildContext context) {
        return SafeArea(
          child: Scaffold(
            body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Center(
                  child: Image.asset(
                      "assets/images/welcome.gif")),
            ),
          ),
        );
      }
    }
  

  

