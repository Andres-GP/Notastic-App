import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'note.dart';


class NoteCard extends StatelessWidget {
  final Note note;

  NoteCard(this.note);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      margin: const EdgeInsets.only(top: 45),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15)
      ),
      child: Column(
        children: [
          Text(note.title),
          Text(note.description)
        ],
      ),
    );
  }
}