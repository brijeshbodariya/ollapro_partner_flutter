import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ollapro_partner/common/app.dart';
import 'package:ollapro_partner/common/common_widgets.dart';
import 'package:ollapro_partner/common/utils.dart';
import 'package:ollapro_partner/model/transactions.dart';
import 'package:ollapro_partner/screens/dashboard/reward_basket/scratch/offer_detail/offer_details.dart';
import 'package:ollapro_partner/screens/dashboard/reward_basket/scratch/scratch_screen.dart';
import 'package:ollapro_partner/screens/dashboard/reward_basket/transfer_screen/transfer_screen.dart';

import 'reward_basket_screen_view_model.dart';
import 'view_screen/view_screen.dart';

class RewardBasketScreen extends StatefulWidget {
  @override
  RewardBasketScreenState createState() => RewardBasketScreenState();
}

class RewardBasketScreenState extends State<RewardBasketScreen> {
  List<Transactions> list = List();
  RewardBasketViewModel model;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    list.add(Transactions(
        App.transactionLogo, "Tx.IDHJ4542AD", "27/08/2020", "ASHJ5652"));
    list.add(Transactions(
        App.transactionLogo, "Tx.IDHJ4542AD", "27/08/2020", "ASHJ5652"));
    list.add(Transactions(
        App.transactionLogo, "Tx.IDHJ4542AD", "27/08/2020", "ASHJ5652"));
  }

  @override
  Widget build(BuildContext context) {
    print("runtimeType -> " + runtimeType.toString());
    model ?? (model = RewardBasketViewModel(this));
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: primaryColor,
          child: Stack(
            children: [
              appBarDash(context, App.rewardBasket),
              Container(
                height: Utils.getDeviceHeight(context),
                width: Utils.getDeviceWidth(context),
                margin: EdgeInsets.only(top: 55),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25)),
                    color: white),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      blackCard(),
                      yellowCard(),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        App.tranHistory,
                        style: TextStyle(
                            color: primaryColor,
                            fontSize: 20,
                            fontFamily: App.font,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      transactionsDetails(),
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

  blackCard() {
    return Container(
      width: Utils.getDeviceWidth(context),
      height: 200,
      margin: EdgeInsets.only(top: 20, left: 10, right: 10),
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.circular(20),
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
                  width: Utils.getDeviceWidth(context) / 3.7,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: white)),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ViewScreen()));
                    },
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
                  width: Utils.getDeviceWidth(context) / 3.4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: white)),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TransferScreen()));
                    },
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

  yellowCard() {
    return Container(
      width: Utils.getDeviceWidth(context),
      height: 200,
      margin: EdgeInsets.only(top: 10, left: 10, right: 10),
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.circular(20),
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
                    onPressed: () {},
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
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OfferDetailsScreen()));
                    },
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
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ScratchScreen()));
                    },
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
            height: Utils.getDeviceHeight(context) / 4.8,
            color: grey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(20),
                          margin: EdgeInsets.only(left: 10),
                          height: MediaQuery.of(context).size.height / 11,
                          width: MediaQuery.of(context).size.width / 7,
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
                                fontSize: 15,
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
                      Container(
                        height: 25,
                        decoration: BoxDecoration(
                            border: Border.all(color: primaryColor),
                            borderRadius: BorderRadius.circular(20)),
                        child: FlatButton(
                          onPressed: () {},
                          child: Text(
                            "PAYOUT",
                            style: TextStyle(color: primaryColor),
                          ),
                        ),
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
