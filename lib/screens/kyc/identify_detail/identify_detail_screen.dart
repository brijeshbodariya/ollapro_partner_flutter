import 'package:flutter/material.dart';
import 'package:ollapro_partner/common/app.dart';
import 'package:ollapro_partner/common/header.dart';
import 'package:ollapro_partner/common/utils.dart';
import 'package:ollapro_partner/screens/kyc/bankdetail/bank_detail_screen.dart';

import 'identify_detail_screen_view_model.dart';

class IdentifyDetailScreen extends StatefulWidget {
  @override
  IdentifyDetailScreenState createState() => IdentifyDetailScreenState();
}

class IdentifyDetailScreenState extends State<IdentifyDetailScreen> {
  TextEditingController aadharController = TextEditingController();
  TextEditingController panController = TextEditingController();
  TextEditingController gstController = TextEditingController();
  IdentifyDetailScreenViewModel model;

  @override
  Widget build(BuildContext context) {
    print("runtimeType -> " + runtimeType.toString());
    model ?? (model = IdentifyDetailScreenViewModel(this));
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            child: Container(
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  appBar(),
                  HeaderLine.headerLineComplete(context, 3, 3, 1, 2, 2, 2),
                  identifyDetailText(),
                  aadharText(),
                  aadharField(),
                  panText(),
                  panField(),
                  gstText(),
                  gstField(),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: bottomButton(),
      ),
    );
  }
bottomButton(){
    return  Container(
      width: Utils.getDeviceWidth(context),
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          backButton(),
          nextButton(),
        ],
      ),
    );
}
  appBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 12, top: 10),
              child: InkWell(
                child: Image.asset(
                  App.backButtonLogo,
                  height: 50,
                  width: 50,
                ),
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
          child: Text(
            App.skip,
            style: TextStyle(
                color: primaryColor, fontWeight: FontWeight.bold, fontSize: 15),
          ),
        )
      ],
    );
  }

  identifyDetailText() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 15, top: 20),
      child: Text(
        App.identifyDetail,
        style: TextStyle(
            fontSize: 20,
            color: primaryColor,
            fontWeight: FontWeight.bold,
            fontFamily: App.font),
      ),
    );
  }

  aadharText() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 15, top: 20),
      child: Text(
        App.aadhar,
        style: TextStyle(
            fontSize: 16, color: secondaryColor, fontFamily: App.font),
      ),
    );
  }

  aadharField() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 15, right: 15),
      child: TextFormField(
        style: TextStyle(color: primaryColor,fontWeight: FontWeight.bold,fontFamily: App.font),
        controller: aadharController,
        decoration: InputDecoration(
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: secondaryColor,
            ),
          ),
          hintText: "Enter Aadhar Number",
          hintStyle: TextStyle(
            color: secondaryColor,
            fontFamily: App.font,
          ),
        ),
        keyboardType: TextInputType.phone,
        textInputAction: TextInputAction.next,
      ),
    );
  }

  panText() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 15, top: 20),
      child: Text(
        App.pan,
        style: TextStyle(
            fontSize: 16, color: secondaryColor, fontFamily: App.font),
      ),
    );
  }

  panField() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 15, right: 15),
      child: TextFormField(
        controller: panController,
        style: TextStyle(color: primaryColor,fontWeight: FontWeight.bold,fontFamily: App.font),
        decoration: InputDecoration(
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: secondaryColor,
            ),
          ),
          hintText: "Enter PAN Number",
          hintStyle: TextStyle(
            color: secondaryColor,
            fontFamily: App.font,
          ),
        ),
        keyboardType: TextInputType.phone,
        textInputAction: TextInputAction.next,
      ),
    );
  }

  gstText() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 15, top: 20),
      child: Text(
        App.gst,
        style: TextStyle(
            fontSize: 16, color: secondaryColor, fontFamily: App.font),
      ),
    );
  }

  gstField() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 15, right: 15),
      child: TextFormField(
        style: TextStyle(color: primaryColor,fontWeight: FontWeight.bold,fontFamily: App.font),
        controller: gstController,
        decoration: InputDecoration(
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: secondaryColor,
            ),
          ),
          suffix: Text('Optional',style: TextStyle(color: grey1,fontFamily: App.font),),
          hintText: "Enter GSTIN Number",
          hintStyle: TextStyle(
            color: secondaryColor,
            fontFamily: App.font,
          ),
        ),
        keyboardType: TextInputType.phone,
        textInputAction: TextInputAction.next,
      ),
    );
  }
  backButton() {
    return Padding(
        padding: EdgeInsets.only(bottom: 30, top: 30),
        child: InkWell(
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
              App.backButton,
              style:
              TextStyle(color: white, fontFamily: App.font, fontSize: 20),
            ),
          ),
        ));
  }

  nextButton() {
    return Padding(
        padding: EdgeInsets.only(bottom: 30, top: 30),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BankDetailScreen()));
          },
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
              App.nextButton,
              style:
              TextStyle(color: white, fontFamily: App.font, fontSize: 20),
            ),
          ),
        ));
  }
}
