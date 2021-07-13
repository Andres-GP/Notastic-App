import 'package:flutter/cupertino.dart';
import 'package:notastic_app/ui/note.dart';

class NoteOperation extends ChangeNotifier {
  List<Note> _notes = new List<Note>();

  List<Note> get getNotes {
    return _notes;
  }

  NoteOperation() {
    addNewNote('1st Note', '1st Description');
  }

  void addNewNote(String title, String description) {
    Note note = Note(title, description);
    _notes.add(note);
    notifyListeners();
  }
}