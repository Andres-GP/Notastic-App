import 'package:flutter/material.dart';
import 'package:notastic_app/ui/utils/colors.dart';



Color colorPickerColor = AppColor.colorPickerYellow;

//UI
class ColorPickerWidget extends StatefulWidget {
  @override
  _ColorPickerWidgetState createState() => _ColorPickerWidgetState();
}

class _ColorPickerWidgetState extends State<ColorPickerWidget> {


  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: colorPickerColor,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            )
        ),
        padding: EdgeInsets.all(16),
        height: 360,
        child: Container(
          margin: const EdgeInsets.only(top: 270),
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
      margin: const EdgeInsets.only(left: 40, right: 40),
      decoration: BoxDecoration(
        color: AppColor.colorPickerContainerColor,
        borderRadius: BorderRadius.circular(20),
      ),
      width: double.infinity,
      height: 200,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 50,
            childAspectRatio: 1 / 1,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemCount: widget.availableColors.length,
        itemBuilder: (context, index) {
          final itemColor = widget.availableColors[index];
          return InkWell(
            onTap: () {
              widget.onSelectColor(itemColor);
              setState(() {
                _pickedColor = itemColor;
              });
            },
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              width: 30,
              height: 30,
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
    );
  }
}





