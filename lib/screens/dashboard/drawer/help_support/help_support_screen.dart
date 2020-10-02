import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ollapro_partner/common/app.dart';
import 'package:ollapro_partner/common/common_appbar.dart';
import 'package:ollapro_partner/common/utils.dart';

import 'help_support_view_model.dart';

class HelpSupportScreen extends StatefulWidget {
  @override
  HelpSupportScreenState createState() => HelpSupportScreenState();
}

class HelpSupportScreenState extends State<HelpSupportScreen> {
  HelpSupportViewModel model;

  @override
  Widget build(BuildContext context) {
    print("runtimeType -> " + runtimeType.toString());
    model ?? (model = HelpSupportViewModel(this));
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: primaryColor,
          child: Stack(
            children: [
              appBarReward(context, App.helpDrawer),
              Container(
                height: Utils.getDeviceHeight(context),
                width: Utils.getDeviceWidth(context),
                margin: EdgeInsets.only(top: 60),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25)),
                    color: whiteMain),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      imageComputer(),
                      Container(
                        margin: EdgeInsets.only(top: 50),
                        child: Text(
                          "NEED SOME HELP!",
                          style: TextStyle(
                              color: yellow,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,fontFamily: App.font),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text(
                          "Feel free to ask anything via call or mail",
                          style: TextStyle(color: primaryColor, fontSize: 18,fontFamily: App.font),
                        ),
                      ),
                      contactInfo(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  imageComputer() {
    return Container(
      margin: EdgeInsets.only(top: 60),
      child: Image.asset(
        App.supportBgLogo,
        fit: BoxFit.fitWidth,
      ),
    );
  }

  contactInfo() {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: Utils.getDeviceWidth(context) / 2.2,
            height: Utils.getDeviceHeight(context) / 4.5,
            child: Card(
              color: whiteColor,
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Image.asset(
                        App.supportCallLogo,
                        height: 70,
                        width: 70,
                      )),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                      "+91 9876543210",
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,fontFamily: App.font),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: Utils.getDeviceWidth(context) / 2.2,
            height: Utils.getDeviceHeight(context) / 4.5,
            child: Card(
              color: whiteColor,
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Image.asset(
                        App.supportEmailLogo,
                        height: 70,
                        width: 70,
                      )),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                      "info@ollapro.com",
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,fontFamily: App.font),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
