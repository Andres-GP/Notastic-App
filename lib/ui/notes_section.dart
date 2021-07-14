import 'dart:math';

import 'package:flutter/cupertino.dart';
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
              itemBuilder: (context, index){
                return NoteCard(data.getNotes[index]);
              },
            );
          },
        ),
      ),
    );
  }
}






