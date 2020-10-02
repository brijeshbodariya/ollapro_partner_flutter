import 'dart:io';

import 'package:flutter/material.dart';
import 'app.dart';
import 'utils.dart';

Widget commonTextField(
    {context,
    TextEditingController controller,
    String title,
    String hintText,
      TextInputAction textInputAction,
    TextInputType textInputType,
    prefixIcon,
    suffixIcon,
    validation,
      FocusNode focusNode,
      VoidCallback onFieldChanged(String term),
    bool obscureText}) {
  return Column(
    children: [
      Container(
        alignment: Alignment.topLeft,
        margin: EdgeInsets.only(left: 15, top: 15),
        child: Text(
          title,
          style: TextStyle(
              fontSize: 16, color: secondaryColor, fontFamily: App.font),
        ),
      ),
      Container(
        alignment: Alignment.topLeft,
        margin: EdgeInsets.only(left: 15, right: 15),
        child: TextFormField(
          onFieldSubmitted: onFieldChanged,
          controller: controller,
          focusNode: focusNode,
          textInputAction: textInputAction,
          validator: validation,
          obscureText: obscureText ?? false,
          decoration: InputDecoration(
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: secondaryColor,
              ),
            ),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            hintText: hintText,
            hintStyle: TextStyle(
              color: secondaryColor,
              fontFamily: App.font,
            ),
          ),
          keyboardType: textInputType,
        ),
      )
    ],
  );
}

Widget commonPhotoField(context,
    {VoidCallback onPressed, File imageName, String fileName, String title,String errorName}) {
  return Column(
    children: [
      Container(
        alignment: Alignment.topLeft,
        margin: EdgeInsets.only(left: 15, top: 15, right: 15),
        child: Text(
          title,
          style: TextStyle(
              fontSize: 17, color: secondaryColor, fontFamily: App.font),
        ),
      ),
      Container(
        padding: EdgeInsets.all(8.0),
        height: 55,
        margin: EdgeInsets.only(left: 15, right: 15),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: secondaryColor),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            imageName != null
                ? Flexible(
                    child: Text(
                    fileName,
                    maxLines: 2,
                    style: TextStyle(color: primaryColor, fontFamily: App.font),
                  ))
                : Container(),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: RaisedButton(
                onPressed: onPressed,
                child: Text(App.chooseFile),
              ),
            ),
          ],
        ),
      ),
      imageName != null
          ? Container()
          : Container(
              margin: EdgeInsets.only(left: 15),
              alignment: Alignment.topLeft,
              child: Text(
                errorName,
                style: TextStyle(
                  color: red,
                  fontFamily: App.font,
                ),
              ),
            ),
    ],
  );
}
Widget commonTextWithTextField(context,{
  TextEditingController controller,
  String title,
  prefixIcon,
  suffixIcon,
  validation,
  VoidCallback onFieldChanged(String term),
  FocusNode focusNode, TextInputType textInputType, String hintText,
}) {
  return Container(
    width: Utils.getDeviceWidth(context),
    color: white,
    child: Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left:10, top: 20),
          child: Text(
            title,
            style: TextStyle(color: primaryColor, fontFamily: App.font, fontSize: 15),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 3),
          child: TextFormField(
            cursorColor: grey,
            style: TextStyle(color: primaryColor, fontFamily: App.font),
            controller: controller,
            validator: validation,
            onFieldSubmitted:  onFieldChanged,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: white
                  )
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: white,
                  ),
                ),
                errorStyle: TextStyle(color: red, fontFamily: App.font),
                hintStyle: TextStyle(color: grey1, fontFamily: App.font),
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon,
                hintText: hintText),
            keyboardType: textInputType,
          ),
        )
      ],
    ),
  );
}

