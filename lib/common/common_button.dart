import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ollapro_partner/common/utils.dart';
import 'app.dart';

Widget commonButton(context, {String buttonName, VoidCallback onPressed, Color colorName, Color textColor, double customFontSize}) {
  return Padding(
      padding: EdgeInsets.only(bottom: 15),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: 20, right: 20),
          height: 50,
          width: Utils.getDeviceWidth(context),
          decoration: BoxDecoration(
            color: colorName ?? primaryColor,
            borderRadius: BorderRadius.all(
                Radius.circular(30) //
                ),
          ),
          child: Text(
            buttonName,
            style: TextStyle(color: textColor ??  white, fontFamily: App.font, fontSize: customFontSize ?? 20),
          ),
        ),
      ));
}

Widget commonRowButton(context,
    {String buttonName1, String buttonName2, VoidCallback onPressed}) {
  return Container(
    width: Utils.getDeviceWidth(context),
    margin: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            alignment: Alignment.center,
            height: 50,
            width: Utils.getDeviceWidth(context) / 2.5,
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.all(
                  Radius.circular(30) //         <--- border radius here
                  ),
            ),
            child: Text(
              buttonName1,
              style:
                  TextStyle(color: white, fontFamily: App.font, fontSize: 20),
            ),
          ),
        ),
        InkWell(
          onTap: onPressed,
          child: Container(
            alignment: Alignment.center,
            height: 50,
            width: Utils.getDeviceWidth(context) / 2.5,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.all(
                  Radius.circular(30) //         <--- border radius here
                  ),
            ),
            child: Text(
              buttonName2,
              style:
                  TextStyle(color: white, fontFamily: App.font, fontSize: 20),
            ),
          ),
        )
      ],
    ),
  );
}
