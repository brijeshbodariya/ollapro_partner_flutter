import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:ollapro_partner/common/app.dart';
import 'package:ollapro_partner/common/common_appbar.dart';
import 'package:ollapro_partner/common/utils.dart';

import 'refer_earn_screen_view_model.dart';

class ReferEarnScreen extends StatefulWidget {
  @override
  ReferEarnScreenState createState() => ReferEarnScreenState();
}

class ReferEarnScreenState extends State<ReferEarnScreen> {
  ReferEarnViewModel model;

  @override
  Widget build(BuildContext context) {
    print("runtimeType -> " + runtimeType.toString());
    model ?? (model = ReferEarnViewModel(this));
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: primaryColor,
          child: Stack(
            children: [
              appBarReward(context, App.referDrawer),
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
                      imageFriends(),
                      referText(),
                      rewardDescription(),
                      Container(
                        height: 2,
                        margin: EdgeInsets.only(top: 30),
                        width: Utils.getDeviceWidth(context),
                        color: white,
                      ),
                      shareReferalCodeText(),
                      referalCode(),
                      socialMedia(),
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

  imageFriends() {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Image.asset(
        App.friendsLogo,
        fit: BoxFit.fitWidth,
      ),
    );
  }
  referText() {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: Text(
        "REFER & EARN",
        style:
            TextStyle(color: yellow, fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
  rewardDescription() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Text(
        "You will get INR 30 & your friend will get INR100 for every successful referal.",
        maxLines: 2,
        textAlign: TextAlign.center,
        style: TextStyle(color: primaryColor, fontSize: 18),
      ),
    );
  }
  shareReferalCodeText() {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Text(
        "SHARE YOUR REFEREAL CODE",
        style: TextStyle(
            color: primaryColor, fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
  socialMedia() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              App.whatAppLogo,
              height: 50,
              width: 50,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              App.fbLogo,
              height: 50,
              width: 50,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              App.twitterLogo,
              height: 50,
              width: 50,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              App.instagramLogo,
              height: 50,
              width: 50,
            ),
          ),
        ],
      ),
    );
  }
  referalCode() {
    return Container(
      margin: EdgeInsets.only(top: 25),
      height: 50,
      width: Utils.getDeviceWidth(context) / 2,
      child: DottedBorder(
        color: yellow,
        strokeWidth: 1,
        child: Align(
          alignment: Alignment.center,
          child: Text(
            "A S D 4 5 S D F 2",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: yellow,
                fontFamily: App.font),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
