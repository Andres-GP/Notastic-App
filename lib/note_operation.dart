import 'package:flutter/cupertino.dart';
import 'package:notastic_app/ui/note.dart';

class NoteOperation extends ChangeNotifier {
  List<Note> _notes = new List<Note>();

  List<Note> get getNotes {
    return _notes;
  }

  NoteOperation() {
    addNewNote('Fries list', 'Standard Cut. Standard Cut is a popular, well-known, and a common version of French fries, Tornado Fries. Tornado fries are originated as street food in South Korea. Sweet Potato Fries. Poutine. Pommes Souffles. Potato Wedges. Shoestring. Chili Cheese Fries');
  }

  void addNewNote(String title, String description) {
    Note note = Note(title, description);
    _notes.add(note);
    notifyListeners();
  }
}