import 'package:flutter/material.dart';
import 'package:ollapro_partner/common/app.dart';
import 'package:ollapro_partner/common/common_widgets.dart';
import 'package:ollapro_partner/common/header.dart';
import 'package:ollapro_partner/common/utils.dart';
import 'package:ollapro_partner/common/validation.dart';
import 'package:ollapro_partner/screens/kyc/bankdetail/bank_detail_screen.dart';

import 'identify_detail_screen_view_model.dart';

class IdentifyDetailScreen extends StatefulWidget {
  @override
  IdentifyDetailScreenState createState() => IdentifyDetailScreenState();
}

class IdentifyDetailScreenState extends State<IdentifyDetailScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController aadharController = TextEditingController();
  TextEditingController panController = TextEditingController();
  TextEditingController gstController = TextEditingController();
  IdentifyDetailScreenViewModel model;
  bool _autoValidate = false;
  Validation validation;
  void _validateInputs() {
      if (_formKey.currentState.validate()) {
        _formKey.currentState.save();
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BankDetailScreen()));
      } else {
        setState(() {
          _autoValidate = true;
          Utils.showToast("Please enter details");
        });
      }
  }
  @override
  Widget build(BuildContext context) {
    print("runtimeType -> " + runtimeType.toString());
    model ?? (model = IdentifyDetailScreenViewModel(this));
    validation = Validation();
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.topLeft,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  autovalidate: _autoValidate,
                  child: Container(
                   // height: Utils.getDeviceHeight(context),
                    width: Utils.getDeviceWidth(context),
                    margin: EdgeInsets.only(top: 160),
                    child: Column(
                      children: [
                        //aadhar card
                        commonTextField(
                            title: App.aadhar,
                            validation: validation.validateAadhar,
                            controller: aadharController,
                            hintText: "Enter Aadhar NUmber",
                            textInputType: TextInputType.phone
                        ),
                        SizedBox(height: 10,),
                        //pan card
                        commonTextField(
                            title: App.pan,
                            validation: validation.validatePAN,
                            controller: panController,
                            hintText: "Enter PAN NUmber",
                            textInputType: TextInputType.text
                        ),SizedBox(height: 10,),
                        //gstin
                        commonTextField(
                            title: App.gst,
                            validation: validation.validateGST,
                            controller: gstController,
                            hintText: "Enter GSTIN NUmber",
                            textInputType: TextInputType.text
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 160,
                color: Colors.white,
                child: Column(
                  children: [
                    appBarKYC(context,MaterialPageRoute(builder: (context)=> BankDetailScreen())),
                    HeaderLine.headerLineComplete(context, 3, 3, 1, 2, 2, 2),
                    identifyDetailText(),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
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
          _validateInputs();
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
