import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ollapro_partner/common/utils.dart';
import 'app.dart';

Widget commonButton(context,
    {String buttonName,
    VoidCallback onPressed,
    Color colorName,
    Color textColor,
    double customFontSize}) {
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
            borderRadius: BorderRadius.all(Radius.circular(30) //
                ),
          ),
          child: Text(
            buttonName,
            style: TextStyle(
                color: textColor ?? white,
                fontFamily: App.font,
                fontSize: customFontSize ?? 20),
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

Widget iconButton(context,
    {VoidCallback onPressed, String imageName, String buttonName}) {
  return Padding(
      padding: EdgeInsets.only(bottom: 10, top: 10),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          alignment: Alignment.center,
          height: 50,
          width: Utils.getDeviceWidth(context) / 2.5,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.all(
                Radius.circular(30) //         <--- border radius here
                ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imageName,
                color: white,
                height: 16,
                width: 16,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                buttonName,
                style:
                    TextStyle(color: white, fontFamily: App.font, fontSize: 20),
              ),
            ],
          ),
        ),
      ));
}

Widget getButton(String title,{ VoidCallback onPressed}){
  return  InkWell(
    onTap:onPressed,
    child: Container(
      height: 60,
      margin: EdgeInsets.only(left: 10, right: 10,top: 20),
      decoration: BoxDecoration(
          color: white
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(title,style: TextStyle(fontFamily: App.font,fontSize: 17, color: primaryColor),),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Image.asset(App.rightSideArrowLogo,color: primaryColor,height: 15,width: 15,),
          )
        ],
      ),
    ),
  );
}
