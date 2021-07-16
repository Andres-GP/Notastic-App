
import 'package:flutter/material.dart';
import 'package:notastic_app/ui/tooltips/second_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:after_layout/after_layout.dart';

import '../home_screen.dart';
import 'first_page.dart';



///Para hacer nuevos tooltips copiar el patron dado en las pages y siempre dejar la ultima como el boton "go"




class Intro extends StatefulWidget {
  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> with AfterLayoutMixin<Intro> {
  @override
  void afterFirstLayout(BuildContext context) {
    checkFirstScreen();
  }

  Future checkFirstScreen() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    bool isFirstRun = _prefs.getBool("isFirstRun");
    if (isFirstRun == true || isFirstRun == null) {
      // Navigator.of(context).pushReplacement(
      //     new MaterialPageRoute(builder: (context) => Intro()));
    } else {
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => HomeScreen()));
    }
  }



  final controller = PageController(
    initialPage: 0,
  );


  Future<void> onDonePress() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.setBool("isFirstRun", false);
    Navigator.of(context).pushReplacement(
        new MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      children: [
        FirstPageScreen(),
        SecondPageScreen(),
      ],
    );
  }
}