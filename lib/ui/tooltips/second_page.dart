

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notastic_app/ui/utils/app_images.dart';
import 'package:notastic_app/ui/utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home_screen.dart';

class SecondPageScreen extends StatefulWidget {
  @override
  _SecondPageScreenState createState() => _SecondPageScreenState();
}


class _SecondPageScreenState extends State<SecondPageScreen> with SingleTickerProviderStateMixin {



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



  @override




  Future<void> onDonePress() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.setBool("isFirstRun", false);
    Navigator.of(context).pushReplacement(
        new PageRouteBuilder(
            transitionDuration: Duration(seconds: 2),
            transitionsBuilder: (context, animation, animationTime,child){
              animation = CurvedAnimation(parent: animation, curve: Curves.easeInOutCubic);
              return SlideTransition(
                position: Tween(
                    begin: Offset(0.0, 1.0),
                    end: Offset(0.0, 0.0))
                    .animate(animation),
                child: child,
              );
            },
            pageBuilder: (context, animation, animationTime){
              return HomeScreen();
            }
        )
      //MaterialPageRoute(builder: (context) => HomeScreen())
    );
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: AppColor.backgroundPrimaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 95),
            child: Text(
              "Organize your favorites",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.white
              ),
              textAlign: TextAlign.center,
            ),
            alignment: Alignment.center,
          ),
          Container(
            margin: const EdgeInsets.only(top: 15),
            child: Image.asset(
              AppTooltipImages.secondTooltipCards,
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height * 0.6,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: ButtonTheme(
              minWidth: 320,
              height: 45,
              child: RaisedButton(
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0),
                ),
                elevation: 15,
                color: AppColor.tooltipsButtonColor,
                child: Text(
                  "Go!",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                ),
                onPressed: () {onDonePress();},
              ),
            ),
          ),
        ],
      ),

    );
  }
}