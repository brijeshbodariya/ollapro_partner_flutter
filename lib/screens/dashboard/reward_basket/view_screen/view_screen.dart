import 'package:flutter/material.dart';
import 'package:ollapro_partner/common/app.dart';
import 'package:ollapro_partner/common/utils.dart';
import 'package:ollapro_partner/model/transactions.dart';
import 'package:ollapro_partner/screens/dashboard/reward_basket/view_screen/view_screen_view_model.dart';

class ViewScreen extends StatefulWidget {
  @override
  ViewScreenState createState() => ViewScreenState();
}

class ViewScreenState extends State<ViewScreen> {
  ViewScreenViewModel model;
  List<Transactions> list = List();
  void initState() {
    // TODO: implement initState
    super.initState();
    list.add(Transactions(App.transactionLogo,"Tx.IDHJ4542AD","27/08/2020","ASHJ5652"));
    list.add(Transactions(App.transactionLogo,"Tx.IDHJ4542AD","27/08/2020","ASHJ5652"));
    list.add(Transactions(App.transactionLogo,"Tx.IDHJ4542AD","27/08/2020","ASHJ5652"));
    list.add(Transactions(App.transactionLogo,"Tx.IDHJ4542AD","27/08/2020","ASHJ5652"));
    list.add(Transactions(App.transactionLogo,"Tx.IDHJ4542AD","27/08/2020","ASHJ5652"));
  }


  @override
  Widget build(BuildContext context) {
    print("runtimeType -> " + runtimeType.toString());
    model ?? (model = ViewScreenViewModel(this));
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: primaryColor,
          child: Stack(
            children: [
              appBar(),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
  appBar() {
    return Container(
      height: 50,
      margin: EdgeInsets.only(left: 10),
      child: Row(
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
              App.view,
              style:
                  TextStyle(color: white, fontFamily: App.font, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
  blackCard() {
    return Container(
      width: Utils.getDeviceWidth(context),
      height: 150,
      margin: EdgeInsets.only(top: 30, left: 10, right: 10),
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
              margin: EdgeInsets.only(top: 20),
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
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: App.font),
              )),
        ],
      ),
    );
  }
  transactionsDetails() {
    return  ListView.builder(
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
                          height: MediaQuery.of(context).size.height / 11,
                          width: MediaQuery.of(context).size.width / 7,
                          decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              color: white
                          ),
                          child: Image.asset(list[index].image,height: 50,width: 50,),),
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
                              margin: const EdgeInsets.only(top:10.0),
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
                              margin: const EdgeInsets.only(top:10.0),
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
                          Text(App.amount,style: TextStyle(color: secondaryColor,fontFamily: App.font,fontSize: 18),),
                          SizedBox(width: 5,),
                          Text("500.00",style: TextStyle(color: primaryColor,fontWeight: FontWeight.bold,fontFamily: App.font,fontSize: 18),),
                        ],
                      ),
                     Row(
                       children: [
                         Image.asset(App.successLogo,height: 20,width: 20,),
                         SizedBox(width: 5,),
                         Text("Success",style: TextStyle(color: green,fontWeight: FontWeight.bold,fontFamily: App.font,fontSize: 16),),
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
