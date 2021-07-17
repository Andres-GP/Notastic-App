import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'favorite_note_card.dart';

class FavoritesScreen extends StatefulWidget {
  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {


  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 100),
      top: 0,
      bottom: 0,
      left: 0,
      right: 0,
      child: Material(
        color: Colors.transparent,
      child: Container(
        color: Colors.transparent,
        child: Scaffold(
            backgroundColor: Colors.transparent,
          body: ListView/*.builder*/(
            /*itemCount: data.getNotes.length,
            itemBuilder: (context, index){
              return*/ children: [
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 230,
                color: Colors.transparent,
                child: Row(
                children: [
                  Spacer(),
                  FavoriteNoteCard(),
                  FavoriteNoteCard(),
                  Spacer()
          ],
        ),
              ),
          ]
            /*},*/
          )
        ),
      ),
     ),
    );
  }
}




