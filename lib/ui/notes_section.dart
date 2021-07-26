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

class _NotesSectionState extends State<NotesSection> with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {

    return Center(
        child: Container(
          child: Consumer<NoteOperation>(
              builder: (context,NoteOperation data, child) {
                return ListView.builder(
                        itemCount: data.getNotes.length,
                        itemBuilder: (context, index) {
                          final item = data.getNotes;
                          return Dismissible(
                            key: UniqueKey(),
                            onDismissed: (direction) {
                              setState(() {
                                item.removeAt(index);
                              });
                            },
                            child: NoteCard(data.getNotes[index]),
                          );
                        }
                    );
              }
          ),
        ),
      );
  }
}









