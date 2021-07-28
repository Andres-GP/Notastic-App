import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notastic_app/ui/utils/app_images.dart';
import 'package:notastic_app/ui/utils/colors.dart';

import 'home_screen.dart';

class RefreshScreen extends StatefulWidget {
  @override
  _RefreshScreenState createState() => _RefreshScreenState();
}

class _RefreshScreenState extends State<RefreshScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundPrimaryColor,
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 100),
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(BackgroundImages.backgroundModalShapes)
              ),
            ),
          ),
          Container(
            width: 330,
            height: 100,
            margin: EdgeInsets.only(top: 330, left: 10),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 25, right: 155),
                  child: Text(
                    "Colors Changed!!",
                    style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w600,
                        color: Colors.white
                    ),
                    textAlign: TextAlign.center,
                  ),
                  alignment: Alignment.center,
                ),
                Container(
                  width: 320,
                  height: 50,
                  child: RaisedButton(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    elevation: 15,
                    color: AppColor.tooltipsButtonColor,
                    child: Text(
                      "Continue",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

    );
  }
  
}

