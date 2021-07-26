import 'dart:math';

import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notastic_app/ui/utils/colors.dart';
import 'package:provider/provider.dart';

import '../note_operation.dart';
import 'note_card.dart';


class NotesSection extends StatefulWidget {
  @override
  _NotesSectionState createState() => _NotesSectionState();
}

class _NotesSectionState extends State<NotesSection> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 50, bottom: 30),
        child: Consumer<NoteOperation>(
          builder: (context,NoteOperation data, child) {
            return ListView.builder(
              itemCount: data.getNotes.length,
              itemBuilder: (context, index) {
                final item = data.getNotes;
                return Stack(
                    children: [
                      NoteCard(data.getNotes[index]),
                      Positioned(
                        top: 33,
                        left: 265,
                        child: Container(
                          width: 40,
                          height: 40,
                          child: FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                item.removeAt(index);
                              });
                            },
                            backgroundColor: AppColor.noteButtonBackgroundColor,
                            child: Icon(Icons.delete_outline,
                              color: AppColor.noteButtonIconColor,
                            ),
                          ),
                        ),
                      ),
                    ]
                );
              }
              );
          }
          ),
      ),
    );
  }
}











