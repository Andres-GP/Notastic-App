import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notastic_app/ui/utils/colors.dart';

class FavoriteNoteCard extends StatefulWidget {
  @override
  _FavoriteNoteCardState createState() => _FavoriteNoteCardState();
}

class _FavoriteNoteCardState extends State<FavoriteNoteCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.only(top: 10, bottom: 10, left:7 , right: 7),
        elevation: 20,
        color: AppColor.colorPickerRed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Container(
          alignment: Alignment.center,
          height: 205,
          width: 180,
            child: Text("Title",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: Colors.white
              ),),
        ),
      );
  }
}
