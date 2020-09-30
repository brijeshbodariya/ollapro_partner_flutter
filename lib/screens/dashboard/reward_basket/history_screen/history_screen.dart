import 'package:flutter/material.dart';
import 'package:ollapro_partner/common/app.dart';
import 'package:ollapro_partner/common/common_widgets.dart';
import 'package:ollapro_partner/common/utils.dart';
import 'package:ollapro_partner/model/transactions.dart';

import 'history_screen_view_model.dart';

class HistoryScreen extends StatefulWidget {
  @override
  HistoryScreenState createState() => HistoryScreenState();
}

class HistoryScreenState extends State<HistoryScreen>
    with SingleTickerProviderStateMixin {
  HistoryScreenViewModel model;
  List<Transactions> list = List();
  AnimationController animation;
  Animation<double> _fadeInFadeOut;

  void initState() {
    animation = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );
    _fadeInFadeOut = Tween<double>(begin: 0.0, end: 1).animate(animation);
    animation.forward();
    animation.addStatusListener((status) {});
    super.initState();
    list.add(Transactions(
        App.transactionLogo, "Tx.IDHJ4542AD", "27/08/2020", "ASHJ5652"));
    list.add(Transactions(
        App.transactionLogo, "Tx.IDHJ4542AD", "27/08/2020", "ASHJ5652"));
    list.add(Transactions(
        App.transactionLogo, "Tx.IDHJ4542AD", "27/08/2020", "ASHJ5652"));
    list.add(Transactions(
        App.transactionLogo, "Tx.IDHJ4542AD", "27/08/2020", "ASHJ5652"));
    list.add(Transactions(
        App.transactionLogo, "Tx.IDHJ4542AD", "27/08/2020", "ASHJ5652"));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("runtimeType -> " + runtimeType.toString());
    model ?? (model = HistoryScreenViewModel(this));
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: primaryColor,
          child: Stack(
            children: [
              appBarReward(context, App.history),
              Container(
                  height: Utils.getDeviceHeight(context),
                  width: Utils.getDeviceWidth(context),
                  margin: EdgeInsets.only(top: 60),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25)),
                      color: white),
                  child: SingleChildScrollView(
                    child: FadeTransition(
                      opacity: _fadeInFadeOut,
                      child: Container(
                        margin: EdgeInsets.only(top: 15),
                        child: transactionsDetails(),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  transactionsDetails() {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.only(top: 10),
            height: 140,
            color: grey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(20),
                          margin: EdgeInsets.only(left: 10),
                          height: 60,
                          width: 60,
                          decoration: new BoxDecoration(
                              shape: BoxShape.circle, color: white),
                          child: Image.asset(
                            list[index].image,
                            height: 50,
                            width: 50,
                          ),
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              list[index].tid,
                              style: TextStyle(
                                  color: primaryColor,
                                  fontFamily: App.font,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                list[index].date,
                                style: TextStyle(
                                    color: secondaryColor,
                                    fontFamily: App.font,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              App.landLordID,
                              style: TextStyle(
                                color: secondaryColor,
                                fontFamily: App.font,
                                fontSize: 16,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                list[index].lid,
                                style: TextStyle(
                                    color: secondaryColor,
                                    fontFamily: App.font,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  height: 1,
                  color: secondaryColor,
                  width: Utils.getDeviceWidth(context),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            App.amount,
                            style: TextStyle(
                                color: secondaryColor,
                                fontFamily: App.font,
                                fontSize: 18),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "500.00",
                            style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.bold,
                                fontFamily: App.font,
                                fontSize: 18),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset(
                            App.successLogo,
                            height: 20,
                            width: 20,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Success",
                            style: TextStyle(
                                color: green,
                                fontWeight: FontWeight.bold,
                                fontFamily: App.font,
                                fontSize: 16),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
