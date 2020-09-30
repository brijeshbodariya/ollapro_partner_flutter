import 'package:flutter/material.dart';
import 'package:ollapro_partner/common/app.dart';
import 'package:ollapro_partner/common/common_appbar.dart';
import 'package:ollapro_partner/common/common_button.dart';
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
  final FocusNode f1 = FocusNode();
  final FocusNode f2 = FocusNode();
  final FocusNode f3 = FocusNode();



  @override
  Widget build(BuildContext context) {
    print("runtimeType -> " + runtimeType.toString());
    model ?? (model = IdentifyDetailScreenViewModel(this));
    validation = Validation();
    return Scaffold(
      body: SafeArea(
        child: Container(
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
                            focusNode: f1,
                            textInputAction: TextInputAction.next,
                            onFieldChanged: (String term){
                              App.fieldFocusChange(context, f1, f2);
                              return ;
                            },
                            hintText: "Enter Aadhar Number",
                            textInputType: TextInputType.phone
                        ),
                        SizedBox(height: 10,),
                        //pan card
                        commonTextField(
                            title: App.pan,
                            validation: validation.validatePAN,
                            controller: panController,
                            hintText: "Enter PAN Number",
                            focusNode: f2,
                            textInputAction: TextInputAction.next,
                            onFieldChanged: (String term){
                              App.fieldFocusChange(context, f2, f3);
                              return ;
                            },
                            textInputType: TextInputType.text
                        ),SizedBox(height: 10,),
                        //gstin
                        commonTextField(
                            title: App.gst,
                            validation: validation.validateGST,
                            controller: gstController,
                            focusNode: f3,
                            hintText: "Enter GSTIN Number",
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
      ),
      bottomNavigationBar: commonRowButton(context,
          buttonName1: App.backButton,
          buttonName2: App.nextButton,
          onPressed:_validateInputs ),
    );
  }
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

}
