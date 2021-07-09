import 'package:flutter/material.dart';
import 'package:notastic_app/ui/utils/app_images.dart';
import 'utils/colors.dart';


class Background extends StatefulWidget {
  @override
  _BackgroundState createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundPrimaryColor,
      body: Container(
        margin: const EdgeInsets.only(top: 100),
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(BackgroundImages.backgroundShapes)
          ),
        ),
      )
    );
  }
}