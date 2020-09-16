import 'package:flutter/material.dart';
import 'package:ollapro_partner/common/app.dart';
import 'package:ollapro_partner/common/common_widgets.dart';
import 'package:ollapro_partner/common/utils.dart';

class RewardBasketScreen extends StatefulWidget {
  @override
  RewardBasketScreenState createState() => RewardBasketScreenState();
}

class RewardBasketScreenState extends State<RewardBasketScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            color: primaryColor,
            child: Column(
              children: [
                appBarDash(context, App.rewardBasket),
                Container(
                  width: Utils.getDeviceWidth(context),
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25)),
                      color: white),
                  child: Column(
                    children: [
                      blackCard(),
                      yellowcard(),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        App.tranHistory,
                        style: TextStyle(
                            color: primaryColor,
                            fontSize: 20,
                            fontFamily: App.font,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        height: Utils.getDeviceHeight(context) /5,
                        color: grey,
                        child: Column(
                          children: [
                            Row(
                              children: [],
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 8,),
                      Container(
                        height: Utils.getDeviceHeight(context) /5,
                        color: grey,
                        child: Column(
                          children: [
                            Row(
                              children: [],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  blackCard() {
    return Container(
      width: Utils.getDeviceWidth(context),
      height: 200,
      margin: EdgeInsets.only(top: 20, bottom: 10, left: 10, right: 10),
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(App.blackCard),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.only(top: 15),
              child: Text(
                App.payout,
                style:
                    TextStyle(color: white, fontSize: 18, fontFamily: App.font),
              )),
          Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                App.balance,
                style: TextStyle(
                    color: white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: App.font),
              )),
          Container(
              margin: EdgeInsets.only(top: 20),
              child: Text(
                "10000.01",
                style: TextStyle(
                    color: white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontFamily: App.font),
              )),
          Container(
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 40,
                  width: Utils.getDeviceWidth(context) / 3.6,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: white)),
                  child: FlatButton(
                    child: Text(
                      App.view,
                      style: TextStyle(
                          color: white, fontFamily: App.font, fontSize: 18),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  height: 40,
                  width: Utils.getDeviceWidth(context) / 3.6,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: white)),
                  child: FlatButton(
                    child: Text(
                      App.transfer,
                      style: TextStyle(
                          color: white, fontFamily: App.font, fontSize: 18),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  yellowcard() {
    return Container(
      width: Utils.getDeviceWidth(context),
      height: 200,
      margin: EdgeInsets.only(top: 20, bottom: 10, left: 10, right: 10),
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(App.yellowCard),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.only(top: 15),
              child: Text(
                App.reward,
                style:
                    TextStyle(color: white, fontSize: 18, fontFamily: App.font),
              )),
          Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                App.balance,
                style: TextStyle(
                    color: white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: App.font),
              )),
          Container(
              margin: EdgeInsets.only(top: 20),
              child: Text(
                "10000.01",
                style: TextStyle(
                    color: white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontFamily: App.font),
              )),
          Container(
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 40,
                  width: Utils.getDeviceWidth(context) / 3.6,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: white)),
                  child: FlatButton(
                    child: Text(
                      App.view,
                      style: TextStyle(
                          color: white, fontFamily: App.font, fontSize: 18),
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  width: Utils.getDeviceWidth(context) / 3.6,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: white)),
                  child: FlatButton(
                    child: Text(
                      App.history,
                      style: TextStyle(
                          color: white, fontFamily: App.font, fontSize: 18),
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  width: Utils.getDeviceWidth(context) / 3.6,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: white)),
                  child: FlatButton(
                    child: Text(
                      App.claim,
                      style: TextStyle(
                          color: white, fontFamily: App.font, fontSize: 18),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
