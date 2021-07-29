import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:notastic_app/ui/refresh_screen.dart';
import 'package:notastic_app/ui/utils/app_images.dart';
import 'package:notastic_app/ui/utils/colors.dart';
import 'package:flutter/cupertino.dart';

import 'notes_section.dart';



Color colorPickerColor = AppColor.colorPickerYellow;


//UI
class ColorPickerWidget extends StatefulWidget {
  @override
  _ColorPickerWidgetState createState() => _ColorPickerWidgetState();
}

class _ColorPickerWidgetState extends State<ColorPickerWidget> with SingleTickerProviderStateMixin{

  var colorPickerButtonColor = AppColor.colorPickerButtonIconColorFolded;

  final Duration colorMenuAnimationDuration = const Duration(milliseconds:550);
  bool moveHorizontal = false;


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedPositioned(
          duration: colorMenuAnimationDuration,
          top: 0,
          bottom: 0,
          left: moveHorizontal ? -5 : -90,
          right: 0,
          curve: Curves.easeInOutCirc,
          child: Container(
            width: 160,
            margin: EdgeInsets.only(top: 180),
            child: Stack(
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 15),
                      padding: EdgeInsets.all(0),
                      height: 430,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10.0,
                            spreadRadius: 0.0,
                            offset: Offset(0.0, 4.0), // shadow direction: bottom right
                          )
                        ],
                      ),
                      child: Container(
                        child: MyColorPicker(
                            onSelectColor: (value) {
                              setState(() {
                                colorPickerColor = value;
                              });
                            },
                            availableColors: [
                              AppColor.colorPickerYellow,
                              AppColor.colorPickerGreen,
                              AppColor.colorPickerRed,
                              AppColor.colorPickerBlue,
                              AppColor.colorPickerOrange,
                            ],
                            initialColor: Colors.yellow),
                      )
                  ),
                  Positioned(
                    top: 330,
                    left: 95,
                    child: Container(
                      width: 65,
                      height: 65,
                      decoration: BoxDecoration(
                        color: AppColor.colorPickerButtonContainerColor,
                        borderRadius: BorderRadius.circular(40),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 13.0,
                            spreadRadius: 0.0,
                            offset: Offset(0.0, 4.0), // shadow direction: bottom right
                          )
                        ],
                      ),
                      child: Container(
                            width: 42,
                            height: 42,
                            margin: EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          color: AppColor.colorPickerButtonContainerColor,
                          borderRadius: BorderRadius.circular(40),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 15.0,
                              spreadRadius: 0.0,
                              offset: Offset(0.0, 4.0), // shadow direction: bottom right
                            )
                          ],
                        ),
                            child: FloatingActionButton(
                              onPressed: () {
                                moveHorizontal = !moveHorizontal;
                                if (colorPickerButtonColor == AppColor.colorPickerButtonIconColorUnFolded) {
                                  setState(() {
                                    colorPickerButtonColor = AppColor.colorPickerButtonIconColorFolded;
                                  });
                                }else{
                                  setState(() {
                                    colorPickerButtonColor = AppColor.colorPickerButtonIconColorUnFolded;
                                  });
                                }
                              },
                              backgroundColor: AppColor.colorPickerButtonBackgroundColor,
                              child: Icon(Icons.color_lens_rounded,
                                color: colorPickerButtonColor,
                              ),
                            ),
                          ),
                    ),
                  )
                ]
              ),
          ),
        ),
      ],
    );
  }
}





//Logic
class MyColorPicker extends StatefulWidget {
  final Function onSelectColor; // This function sends the selected color to outside
  final List<Color> availableColors; // List of pickable colors
  final Color initialColor; // The default picked color
  final bool circleItem; // Determnie shapes of color cells

  MyColorPicker(
      {@required this.onSelectColor,
        @required this.availableColors,
        @required this.initialColor,
        this.circleItem = true});

  @override
  _MyColorPickerState createState() => _MyColorPickerState();
}

class _MyColorPickerState extends State<MyColorPicker> {
  Color _pickedColor;

  @override
  void initState() {
    _pickedColor = widget.initialColor;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.colorPickerContainerColor,
        borderRadius: BorderRadius.circular(20),
      ),
      width: 70,
      height: 100,
      child: Container(
        child: ListView.builder(
          itemCount: widget.availableColors.length,
          itemBuilder: (context, index) {
            final itemColor = widget.availableColors[index];
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RefreshScreen()),
                );


                widget.onSelectColor(itemColor);
                setState(() {
                  _pickedColor = itemColor;
                });
              },
              child: Container(
                margin: const EdgeInsets.only(top: 15),
                width: 55,
                height: 55,
                decoration: BoxDecoration(
                    color: itemColor,
                    shape: widget.circleItem == true
                        ? BoxShape.circle
                        : BoxShape.rectangle,),
                child: itemColor == _pickedColor
                    ? Center(
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
                )
                    : Container(),
              ),
            );
          },
        ),
      ),
    );
  }
}





