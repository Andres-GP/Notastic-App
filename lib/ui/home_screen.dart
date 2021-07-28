import 'package:flutter/material.dart';
import 'package:notastic_app/ui/utils/colors.dart';
import 'package:provider/provider.dart';
import 'add_note_button.dart';
import 'background.dart';
import 'color_picker.dart';
import 'favorites_screen.dart';
import 'linear_gradient.dart';
import 'navigation_widget.dart';
import 'notes_section.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color _color = Colors.blue;
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Background(),
            NotesSection(),
            AddNoteButton(),
            //FavoritesScreen(),
            ColorPickerWidget(),
            NavigationWidget(),
            LinearGradientBorderTop(),
          ],
        ),
      ),
    );
  }
}










