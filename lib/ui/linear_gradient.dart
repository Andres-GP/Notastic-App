import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notastic_app/ui/utils/colors.dart';

class LinearGradientBorderTop extends StatefulWidget {
  @override
  _LinearGradientBorderTopState createState() => _LinearGradientBorderTopState();
}

class _LinearGradientBorderTopState extends State<LinearGradientBorderTop> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [AppColor.backgroundPrimaryColor, Colors.transparent]
              )
          ),
          alignment: Alignment.topCenter,
          width: double.infinity,
          height: 75,
        ),
      ],
    );
  }

}


