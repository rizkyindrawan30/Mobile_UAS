import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:latihan_mvvm/UI/homePage.dart';
import 'package:latihan_mvvm/UI/wisataBll.dart';

Widget buildButtomBar(index, BuildContext context) {
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    currentIndex: index,
    onTap: (i) {
      switch (i) {
        case 0:
          Navigator.of(context).pushReplacement(new MaterialPageRoute(
              builder: (BuildContext context) => HomePage()));
          break;
        case 1:
          Navigator.of(context).pushReplacement(new MaterialPageRoute(
              builder: (BuildContext context) => WisataBll()));
          break;
        default:
      }
    },
    items: [
      BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
      BottomNavigationBarItem(
          icon: Icon(Icons.supervised_user_circle_outlined),
          title: Text("Wisata Buleleng")),
    ],
  );
}
