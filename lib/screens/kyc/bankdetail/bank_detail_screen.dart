import 'package:flutter/material.dart';
import 'package:ollapro_partner/common/app.dart';
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
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            child: Container(
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  appBar(),
                  HeaderLine.headerLineComplete(context, 3, 3, 3, 1, 2, 2),
                  bankDetailText(),
                  bankText(),
                  bankField(),
                  accountText(),
                  accountField(),
                  account1Text(),
                  account1Field(),
                  nameText(),
                  nameField(),
                  accountTypeText(),
                  accountTypeField(),
                  ifscText(),
                  ifscField(),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: bottomButton(),
      ),
    );
  }

  bottomButton() {
    return Container(
      width: Utils.getDeviceWidth(context),
      margin: EdgeInsets.only(left: 20, right: 20),
      child: submitButton(),
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

  bankText() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 15, top: 20),
      child: Text(
        App.bankName,
        style: TextStyle(
            fontSize: 16, color: secondaryColor, fontFamily: App.font),
      ),
    );
  }

  bankField() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 15, right: 15),
      child: TextFormField(
        style: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.bold,
            fontFamily: App.font),
        controller: bankNameController,
        decoration: InputDecoration(
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: secondaryColor,
            ),
          ),
          hintText: "Enter Bank Name",
          hintStyle: TextStyle(
            color: grey1,
            fontFamily: App.font,
          ),
        ),
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
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

  accountField() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 15, right: 15),
      child: TextFormField(
        style: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.bold,
            fontFamily: App.font),
        controller: accountController,
        decoration: InputDecoration(
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: secondaryColor,
            ),
          ),
          hintText: "Enter Account Number",
          hintStyle: TextStyle(
            color: grey1,
            fontFamily: App.font,
          ),
        ),
        keyboardType: TextInputType.phone,
        textInputAction: TextInputAction.next,
      ),
    );
  }

  account1Text() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 15, top: 20),
      child: Text(
        App.account1Number,
        style: TextStyle(
            fontSize: 16, color: secondaryColor, fontFamily: App.font),
      ),
    );
  }

  account1Field() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 15, right: 15),
      child: TextFormField(
        style: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.bold,
            fontFamily: App.font),
        controller: account1Controller,
        decoration: InputDecoration(
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: secondaryColor,
            ),
          ),
          hintText: "Re enter Account Number",
          hintStyle: TextStyle(
            color: grey1,
            fontFamily: App.font,
          ),
        ),
        keyboardType: TextInputType.phone,
        textInputAction: TextInputAction.next,
      ),
    );
  }

  nameText() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 15, top: 20),
      child: Text(
        App.nameOfHolder,
        style: TextStyle(
            fontSize: 16, color: secondaryColor, fontFamily: App.font),
      ),
    );
  }

  nameField() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 15, right: 15),
      child: TextFormField(
        style: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.bold,
            fontFamily: App.font),
        controller: nameController,
        decoration: InputDecoration(
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: secondaryColor,
            ),
          ),
          hintText: "Enter Account Holder Name",
          hintStyle: TextStyle(
            color: grey1,
            fontFamily: App.font,
          ),
        ),
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
      ),
    );
  }

  accountTypeText() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 15, top: 15),
      child: Text(
        App.accountType,
        style: TextStyle(
            fontSize: 17, color: secondaryColor, fontFamily: App.font),
      ),
    );
  }

  accountTypeField() {
    return Column(
      children: [
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

  ifscText() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 15, top: 10),
      child: Text(
        App.ifscCode,
        style: TextStyle(
            fontSize: 16, color: secondaryColor, fontFamily: App.font),
      ),
    );
  }

  ifscField() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 15, right: 15),
      child: TextFormField(
        textCapitalization: TextCapitalization.characters,
        style: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.bold,
            fontFamily: App.font),
        controller: ifscController,
        decoration: InputDecoration(
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: secondaryColor,
            ),
          ),
          hintText: "Enter IFSC code here",
          hintStyle: TextStyle(
            color: grey1,
            fontFamily: App.font,
          ),
        ),
        keyboardType: TextInputType.text,
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

  submitButton() {
    return Padding(
        padding: EdgeInsets.only(bottom: 20, top: 10),
        child: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ReferenceScreen()));
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
