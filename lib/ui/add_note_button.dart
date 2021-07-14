import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notastic_app/note_operation.dart';
import 'package:notastic_app/ui/utils/colors.dart';
import 'package:provider/provider.dart';

import 'color_picker.dart';

class AddNoteButton extends StatefulWidget {
  @override
  _AddNoteButtonState createState() => _AddNoteButtonState();
}

class _AddNoteButtonState extends State<AddNoteButton> {
  String titleText;
  String descriptionText;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          margin: const EdgeInsets.only(top: 440),
          child: FloatingActionButton(
            onPressed: () => showModalBottomSheet(

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                )
              ),
                isScrollControlled: true,
                context: context,
                builder: (context)
                //Input Generator
                => buildSheet()),
            backgroundColor: AppColor.addNoteButtonColor,
            child: Icon(Icons.add),
          ),

        )
    );
  }



  //Note Generator
  Widget buildSheet() => Container(

    child: Stack(
      children: [
        ColorPickerWidget(),
        Container(
          padding: EdgeInsets.all(18),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,

                    child: FloatingActionButton(
                      onPressed: () {
                        Provider.of<NoteOperation>(context, listen: false).addNewNote(titleText, descriptionText);
                        Navigator.pop(context);
                      },

                      backgroundColor: AppColor.colorPickerButtonBackgroundColor,
                      child: Icon(Icons.check,
                        color: AppColor.colorPickerButtonIconColor,
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: 40,
                    height: 40,

                    child: FloatingActionButton(
                      onPressed: () => Navigator.of(context).pop(),
                      backgroundColor: AppColor.colorPickerButtonBackgroundColor,

                      child: Icon(Icons.close,
                        color: AppColor.colorPickerButtonIconColor,
                      ),
                    ),
                  ),
                ],
              ),
              TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Title here...",
                    hintStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    )
                ),
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                ),
                onChanged: (value){
                  titleText = value;
                },
              ),
              TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "And a description here...",
                    hintStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.white
                    )
                ),
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white
                ),
                onChanged: (value){
                  descriptionText = value;
                },
              ),
            ],
          ),
        )
      ],
    )
    );
}





