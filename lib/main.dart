import 'package:flutter/material.dart';
import 'package:notastic_app/note_operation.dart';
import 'package:notastic_app/ui/home_screen.dart';
import 'package:notastic_app/ui/tooltips/intro.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NoteOperation>(
      create: (context) => NoteOperation(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home: Intro(),
      ),
    );
  }
}


