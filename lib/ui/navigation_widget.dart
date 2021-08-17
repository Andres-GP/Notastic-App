import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:notastic_app/ui/refresh_screen.dart';
import 'package:notastic_app/ui/utils/colors.dart';

import 'copyright_policies_screen.dart';


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
           iconOn: Icons.book,
           iconOff: CupertinoIcons.pen,
           colorOff: AppColor.navigationSwitchButtonIconYellowColor,
           colorOn: AppColor.copyRightBackgroundColor,
           onChanged: (bool position) {

             if (position == true) {
               Navigator.push(
                 context,
                 MaterialPageRoute(
                     builder: (context) => CopyrightAndPoliciesScreen()),
               );
             } else {
               print("navigation error");
             }
             print("the button has been switched to $position");
           },
           //onTap: ,
         ),
       )
      );
  }
}


