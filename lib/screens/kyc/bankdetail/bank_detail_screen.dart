import 'package:flutter/material.dart';
import 'package:ollapro_partner/common/app.dart';
import 'package:ollapro_partner/common/common_widgets.dart';
import 'package:ollapro_partner/common/dropdown.dart';
import 'package:ollapro_partner/common/header.dart';
import 'package:ollapro_partner/common/utils.dart';
import 'package:ollapro_partner/screens/kyc/reference/reference_screen.dart';

import 'bank_detail_view_model.dart';

class BankDetailScreen extends StatefulWidget {
  @override
  BankDetailScreenState createState() => BankDetailScreenState();
}

class BankDetailScreenState extends State<BankDetailScreen> {
  TextEditingController bankNameController = TextEditingController();
  TextEditingController accountController = TextEditingController();
  TextEditingController account1Controller = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController ifscController = TextEditingController();
  BankDetailViewModel model;
  String account, accountActivity;

  @override
  void initState() {
    accountActivity = '';
    account = ''; // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("runtimeType -> " + runtimeType.toString());
    model ?? (model = BankDetailViewModel(this));
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.topLeft,
          child: Column(
            children: [
              appBarKYC(context,MaterialPageRoute(builder: (context)=> ReferenceScreen())),
              HeaderLine.headerLineComplete(context, 3, 3, 3, 1, 2, 2),
              bankDetailText(),

              Form(
                child: Container(
                  height: Utils.getDeviceHeight(context) /1.8,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      //bank name
                      commonTextField(
                          title: App.bankName,
                          controller: bankNameController,
                          hintText: "Enter Bank name",
                          textInputType: TextInputType.text
                      ),
                      SizedBox(height: 10),
                      //account number
                      commonTextField(
                          title: App.accountNumber,
                          controller: accountController,
                          hintText: "Enter Account Number",
                          textInputType: TextInputType.phone
                      ),SizedBox(height: 10),
                      //account number
                      commonTextField(
                          title: App.account1Number,
                          controller: account1Controller,
                          hintText: "Re enter Account Number",
                          textInputType: TextInputType.phone
                      ),SizedBox(height: 10),
                      //account holder name
                      commonTextField(
                          title: App.nameOfHolder,
                          controller: nameController,
                          hintText: "Account holder name",
                          textInputType: TextInputType.text
                      ),SizedBox(height: 10),
                      accountTypeField(),
                      //ifsc code
                      commonTextField(
                          title: App.ifscCode,
                          controller: ifscController,
                          hintText: "Enter IFSC code",
                          textInputType: TextInputType.text
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar:  Container(
          width: Utils.getDeviceWidth(context),
          margin: EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              backButton(),
              nextButton(),
            ],
          ),
        ),
      ),
    );
  }
  bankDetailText() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 15, top: 20),
      child: Text(
        App.bankDetail,
        style: TextStyle(
            fontSize: 20,
            color: primaryColor,
            fontWeight: FontWeight.bold,
            fontFamily: App.font),
      ),
    );
  }
  accountText() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 15, top: 20),
      child: Text(
        App.accountNumber,
        style: TextStyle(
            fontSize: 16, color: secondaryColor, fontFamily: App.font),
      ),
    );
  }
  accountTypeField() {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(left: 15, top: 15),
          child: Text(
            App.accountType,
            style: TextStyle(
                fontSize: 17, color: secondaryColor, fontFamily: App.font),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15, right: 15),
          child: DropDownFormField(
            hintText: 'Select Account Type',
            value: accountActivity,
            onSaved: (value) {
              setState(() {
                accountActivity = value;
              });
            },
            onChanged: (value) {
              setState(() {
                accountActivity = value;
              });
            },
            dataSource: [
              {
                "display": "Saving",
                "value": "Saving",
              },
              {
                "display": "Current",
                "value": "Current",
              },
            ],
            textField: 'display',
            valueField: 'value',
          ),
        ),
        Container(
          //padding: EdgeInsets.all(16),
          child: Text(account),
        )
      ],
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
                    builder: (context) => ReferenceScreen()));
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
