import 'dart:async';

import 'package:database_app/screen/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';



class SplshScreen extends StatefulWidget {
  const SplshScreen({Key? key}) : super(key: key);

  @override
  State<SplshScreen> createState() => _SplshScreenState();
}

class _SplshScreenState extends State<SplshScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 5),() {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
    },);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.black,

      body: Center(
        child:Lottie.asset("assets/lottie/ani1.json"),
      ),

    ));
  }
}
