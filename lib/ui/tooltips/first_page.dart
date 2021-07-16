

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notastic_app/ui/utils/app_images.dart';
import 'package:notastic_app/ui/utils/colors.dart';

class FirstPageScreen extends StatefulWidget {
  @override
  _FirstPageScreenState createState() => _FirstPageScreenState();
}


class _FirstPageScreenState extends State<FirstPageScreen> {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: AppColor.backgroundPrimaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 30),
            child: Text(
              "Write down everything you need",
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
            margin: const EdgeInsets.only(top: 25),
            child: Image.asset(
              AppTooltipImages.firstTooltipCards,
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height * 0.6,
            ),
          ),
        ],
      ),
    );
  }
}