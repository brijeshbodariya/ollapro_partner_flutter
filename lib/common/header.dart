import 'package:flutter/material.dart';
import 'app.dart';
class HeaderLine {
  String text;

  static headerLineComplete(BuildContext context, int firstPage, int secondPage,
      int thirdPage, int fourthPage, int fifthPage, int sixthPage) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 15),
            alignment: Alignment.center,
            width: 30.0,
            height: 30.0,
            decoration: BoxDecoration(
                color: colorsChanges(firstPage),
                shape: BoxShape.circle
            ),
            child: firstPage == 3
                ? Icon(Icons.check, color: white,)
                : Text('1', style: TextStyle(color: white),),
          ),
          Expanded(
            flex: 1,
            child: Container(
              height: 5,
              width: 20,
              color: textChanges(firstPage),
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: 30.0,
            height: 30.0,
            decoration: BoxDecoration(
                color: colorsChanges(secondPage),
                shape: BoxShape.circle
            ),
            child:secondPage ==3
                ? Icon(Icons.check, color: white,)
                : Text('2', style: TextStyle(color: white),),
          ),
          Expanded(
            flex: 1,
            child: Container(
              height: 5,
              width: 20,
              color: lineChanges(secondPage),
            ),
          ), Container(
            alignment: Alignment.center,
            width: 30.0,
            height: 30.0,
            decoration: BoxDecoration(
                color: colorsChanges(thirdPage),
                shape: BoxShape.circle
            ),
            child: thirdPage == 3
                ? Icon(Icons.check, color: white,)
                : Text('3', style: TextStyle(color: white),),
          ),
          Expanded(
            flex: 1,
            child: Container(
              height: 5,
              width: 20,
              color: lineChanges(thirdPage),
            ),
          ), Container(
            alignment: Alignment.center,
            width: 30.0,
            height: 30.0,
            decoration: BoxDecoration(
                color: colorsChanges(fourthPage),
                shape: BoxShape.circle
            ),
            child: fourthPage == 3
                ? Icon(Icons.check, color: white,)
                : Text('4', style: TextStyle(color: white),),
          ),
          Expanded(
            flex: 1,
            child: Container(
              height: 5,
              width: 20,
              color: lineChanges(fourthPage),
            ),
          ), Container(
            alignment: Alignment.center,
            width: 30.0,
            height: 30.0,
            decoration: BoxDecoration(
                color: colorsChanges(fifthPage),
                shape: BoxShape.circle
            ),
            child: fifthPage == 3
                ? Icon(Icons.check, color: white,)
                : Text('5', style: TextStyle(color: white),),
          ),
          Expanded(
            flex: 1,
            child: Container(
              height: 5,
              width: 20,
              color: lineChanges(fifthPage) ,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 15),
            alignment: Alignment.center,
            width: 30.0,
            height: 30.0,
            decoration: BoxDecoration(
                color: colorsChanges(sixthPage) ,
                shape: BoxShape.circle
            ),
            child: sixthPage == 3
                ? Icon(Icons.check, color: white,)
                : Text('6', style: TextStyle(color: white),),
          ),
        ],
      ),
    );
  }

  static colorsChanges(int i) {
    if (i == 1) {
      return primaryColor;
    } else if (i == 2) {
      return grey1;
    } else if (i == 3) {
      return green;
    }
  }

  static textChanges(int i) {
    if (i == 1) {
      return primaryColor;
    } else if (i == 2) {
      return primaryColor;
    } else if (i == 3) {
      return green;
    }
  }

  static lineChanges(int i) {
    if (i == 1) {
      return grey1;
    } else if (i == 2) {
      return grey1;
    } else if (i == 3) {
      return green;
    }
  }
}