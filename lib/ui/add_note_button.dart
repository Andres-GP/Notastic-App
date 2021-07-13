import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notastic_app/note_operation.dart';
import 'package:notastic_app/ui/utils/colors.dart';
import 'package:provider/provider.dart';

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
    padding: EdgeInsets.all(16),
    child: Column(
      mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              ElevatedButton(onPressed: () {
                Provider.of<NoteOperation>(context, listen: false).addNewNote(titleText, descriptionText);
                Navigator.pop(context);
                Icon(CupertinoIcons.back);
              }),
              Spacer(),
              ElevatedButton(onPressed: () => Navigator.of(context).pop(), child: Icon(Icons.image)),
            ],
          ),
          TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Title here...",
              hintStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black
              )
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
                      color: Colors.black
                  )
              ),
              onChanged: (value){
              descriptionText = value;
            },
            ),

        ],
      ),
  );
}
