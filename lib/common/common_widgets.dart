import 'package:flutter/material.dart';
import 'app.dart';

Widget commonTextField({TextEditingController controller,String title,String hintText,TextInputType textInputType,prefixIcon,suffixIcon,obscureText}){
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
          controller: controller,
         // obscureText: obscureText ,
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


appBarKYC(context,route) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: 12, top: 10),
            child: InkWell(
              child: Image.asset(App.backButtonLogo,height: 50,width: 50,),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, top: 10),
            alignment: Alignment.center,
            child: Text(
              App.completeYourKyc,
              style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          )
        ],
      ),
      Container(
        margin: EdgeInsets.only(right: 15, top: 10),
        alignment: Alignment.center,
        child: InkWell(
          onTap: (){
            Navigator.push(context, route);
          },
          child: Text(
            App.skip,
            style: TextStyle(
                color: primaryColor, fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ),
      )
    ],
  );
}

appBarDash(context,String title) {
  return Container(
    margin: EdgeInsets.only(left: 10, top: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(
                App.arrowBack,
                color: white,
                height: 25,
                width: 25,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Text(
               title,
                style: TextStyle(
                    color: white, fontFamily: App.font, fontSize: 20),
              ),
            ),
          ],
        ),
        Container(
            margin: EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {},
              child: Image.asset(
                App.notificationLogo,
                height: 25,
                width: 25,
              ),
            )),
      ],
    ),
  );
}