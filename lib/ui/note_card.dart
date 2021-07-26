import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notastic_app/ui/notes_section.dart';
import 'package:notastic_app/ui/utils/colors.dart';

import 'color_picker.dart';
import 'color_picker.dart';
import 'note.dart';



class NoteCard extends StatefulWidget {
  final Note note;

  NoteCard(this.note);

  @override
  _NoteCardState createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard> {
  var likeButtonColor = AppColor.noteButtonDeactivatedIconColor;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      margin: const EdgeInsets.only(top: 13, bottom: 12, left: 20, right: 20),
      decoration: BoxDecoration(
        //TODO add color retrieve of the constructed card
        color: colorPickerColor, /*AppColor.colorPickerBlue,*/
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 12.0,
            spreadRadius: 1.0,
            offset: Offset(1.0, 1.0), // shadow direction: bottom right
          )
        ],
      ),
      child: Column(
        children: [

          //Title
          Row(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                height: 40,
                width: 250,
                margin: EdgeInsets.only(top: 20),
                child: Container(
                  margin: EdgeInsets.only(left: 12),
                  child: Text(widget.note.title,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                width: 40,
                height: 40,
              ),

              //Spacer
              Container(
                width: 12,
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                width: 40,
                height: 40,

                child: FloatingActionButton(
                  onPressed: () {
                    if (likeButtonColor == AppColor.noteButtonDeactivatedIconColor) {
                      setState(() {
                        likeButtonColor = AppColor.noteButtonRedIconColor;
                      });
                    }else{
                      setState(() {
                        likeButtonColor = AppColor.noteButtonDeactivatedIconColor;
                      });
                    }
                  },
                  backgroundColor: AppColor.noteButtonBackgroundColor,
                  child: Container(
                    margin: EdgeInsets.only(top: 3),
                    child: Icon(CupertinoIcons.heart_fill,
                      color: likeButtonColor,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),

          //Description
          Container(
            alignment: Alignment.topLeft,
            height: 320,
            width: 350,
            child: Container(
              margin: EdgeInsets.only(top: 20, left: 11),
              child: Text(widget.note.description,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),),
            )
          ),
        ],
      ),
    );
  }
}