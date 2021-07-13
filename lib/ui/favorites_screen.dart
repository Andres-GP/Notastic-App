import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      right: 90,
      child: Material(
        color: Colors.transparent,
      child: Container(
        color: Colors.transparent,
        child: Scaffold(
            backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Container(
                width: 300,
                height: 660,
                color: Colors.white,
              ),
            ],
          )
        ),
      ),
     ),
    );
  }
}




