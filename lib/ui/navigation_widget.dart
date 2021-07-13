import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:notastic_app/ui/utils/colors.dart';

class NavigationWidget extends StatefulWidget {
  @override
  _NavigationWidgetState createState() => _NavigationWidgetState();
}

class _NavigationWidgetState extends State<NavigationWidget> {

  bool toggleValue = false;

  @override
  Widget build(BuildContext context) {
    return
      Center(
       child: Container(
         width: 50,
         height: 50,
         margin: const EdgeInsets.only(top: 600),
         child: LiteRollingSwitch(
           value: false,
           textOn: "",
           textOff: "",
           textSize: 12.0,
           iconOn: CupertinoIcons.heart_fill,
           iconOff: CupertinoIcons.pen,
           colorOff: AppColor.navigationSwitchButtonIconYellowColor,
           colorOn: AppColor.navigationSwitchButtonIconRedColor,
           onChanged: (bool position) {
             print("the button has been switched to $position");
           },
           //onTap: ,
         ),
       )

      );
  }
}
