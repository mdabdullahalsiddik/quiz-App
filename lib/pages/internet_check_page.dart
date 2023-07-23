import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import '../pages/not_internet_page.dart';
import '../pages/welcome_page.dart';

class InternetCheck extends StatefulWidget {
  const InternetCheck({super.key});

  @override
  State<InternetCheck> createState() => _InternetCheckState();
}

class _InternetCheckState extends State<InternetCheck> {
  StreamSubscription? subscription;

  @override
  void initState() {
    subscription = Connectivity().onConnectivityChanged.listen((event) {
      internetCheck();
    });

    internetCheck();

    super.initState();
  }

  @override
  void dispose() {
    subscription!.cancel();
    super.dispose();
  }

  Future internetCheck() async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => WelcomePage()));
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (_) => NotInternet()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Center(child: Image.asset("assets/images/welcome.gif")),
        ),
      ),
    );
  }
}
