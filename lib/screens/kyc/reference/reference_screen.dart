import 'package:flutter/material.dart';
import 'package:ollapro_partner/common/app.dart';
import 'package:ollapro_partner/common/common_appbar.dart';
import 'package:ollapro_partner/common/common_button.dart';
import 'package:ollapro_partner/common/common_widgets.dart';
import 'package:ollapro_partner/common/header.dart';
import 'package:ollapro_partner/common/utils.dart';
import 'package:ollapro_partner/common/validation.dart';
import 'package:ollapro_partner/screens/kyc/reference/reference_view_model.dart';
import 'package:ollapro_partner/screens/kyc/upload_document/uploaddocument.dart';


class ReferenceScreen extends StatefulWidget {
  @override
  ReferenceScreenState createState() => ReferenceScreenState();
}

class ReferenceScreenState extends State<ReferenceScreen>   {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  ReferenceViewModel model;
  TextEditingController nameController = TextEditingController();
  TextEditingController name1Controller = TextEditingController();
  TextEditingController placeController = TextEditingController();
  TextEditingController place1Controller = TextEditingController();
  TextEditingController phoneController = TextEditingController(text: "+91");
  TextEditingController phone1Controller = TextEditingController(text: "+91");
  bool _autoValidate = false;
  Validation validation;
  final FocusNode f1 = FocusNode();
  final FocusNode f2 = FocusNode();
  final FocusNode f3 = FocusNode();
  final FocusNode f4 = FocusNode();
  final FocusNode f5 = FocusNode();
  final FocusNode f6 = FocusNode();


  @override
  Widget build(BuildContext context) {
    print("runtimeType -> " + runtimeType.toString());
    model ?? (model = ReferenceViewModel(this));
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
                    width: Utils.getDeviceWidth(context),
                    margin: EdgeInsets.only(top: 160),
                    child: Column(
                      children: [ reference1Text(),
                        // reference1 name
                        Container(
                          color: white,
                          child: Column(
                            children: [
                              commonTextField(
                                  title: App.name,
                                  validation: validation.validateName,
                                  controller: nameController,
                                  hintText: "Enter Name",
                                  focusNode: f1,
                                  textInputAction: TextInputAction.next,
                                  onFieldChanged: (String term){
                                    App.fieldFocusChange(context, f1, f2);
                                    return ;
                                  },
                                  textInputType: TextInputType.text
                              ),
                              SizedBox(height: 10),
                              // reference1 place
                              commonTextField(
                                  title: App.place,
                                  validation: validation.validatePlace,
                                  controller: placeController,
                                  hintText: "Enter Place",
                                  focusNode: f2,
                                  textInputAction: TextInputAction.next,
                                  onFieldChanged: (String term){
                                    App.fieldFocusChange(context, f2, f3);
                                    return ;
                                  },
                                  textInputType: TextInputType.text
                              ),SizedBox(height: 10),
                              // reference1 mobile number
                              commonTextField(
                                  title: App.mobileNumber,
                                  validation: validation.validatePhone,
                                  controller: phoneController,
                                  hintText: "Enter Mobile Number",
                                  textInputAction: TextInputAction.next,
                                  focusNode: f3,
                                  onFieldChanged: (String term){
                                    App.fieldFocusChange(context, f3, f4);
                                    return ;
                                  },
                                  textInputType: TextInputType.phone
                              ),SizedBox(height: 10),
                            ],
                          ),
                        ),
                        reference2Text(),
                        Container(
                          color: white,
                          child: Column(
                            children: [
                              // reference2 name
                              commonTextField(
                                  title: App.name,
                                  validation: validation.validateName,
                                  controller: name1Controller,
                                  hintText: "Enter Name",
                                  textInputAction: TextInputAction.next,
                                  focusNode: f4,
                                  onFieldChanged: (String term){
                                    App.fieldFocusChange(context, f4, f5);
                                    return ;
                                  },
                                  textInputType: TextInputType.text
                              ),SizedBox(height: 10),
                              // reference2 place
                              commonTextField(
                                  title: App.place,
                                  validation: validation.validatePlace,
                                  controller: place1Controller,
                                  hintText: "Enter Place",
                                  textInputAction: TextInputAction.next,
                                  focusNode: f5,
                                  onFieldChanged: (String term){
                                    App.fieldFocusChange(context, f5, f6);
                                    return ;
                                  },
                                  textInputType: TextInputType.text
                              ),SizedBox(height: 10),
                              // reference2 mobile number
                              commonTextField(
                                  title: App.mobileNumber,
                                  validation: validation.validatePhone,
                                  controller: phone1Controller,
                                  hintText: "Enter Mobile Number",
                                  textInputAction: TextInputAction.done,
                                  focusNode: f6,
                                  textInputType: TextInputType.phone
                              ),SizedBox(height: 10),
                            ],
                          ),
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
                    appBarKYC(context,MaterialPageRoute(builder: (context)=> UploadDocument())),
                    HeaderLine.headerLineComplete(context, 3, 3, 3, 3, 1, 2),
                    referenceDetailText(),
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
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => UploadDocument()));
    } else {
      setState(() {
        _autoValidate = true;
        Utils.showToast("Please enter details");
      });

    }
  }
  referenceDetailText() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 15, top: 20),
      child: Text(
        App.referenceDetail,
        style: TextStyle(
            fontSize: 20,
            color: primaryColor,
            fontWeight: FontWeight.bold,
            fontFamily: App.font),
      ),
    );
  }
  reference1Text() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 15, top: 20,bottom: 5),
      child: Text(
        App.reference1,
        style: TextStyle(
            fontSize: 19,
            color: primaryColor,
            fontWeight: FontWeight.bold,
            fontFamily: App.font),
      ),
    );
  }
  reference2Text() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 15, top: 10,bottom: 10),
      child: Text(
        App.reference2,
        style: TextStyle(
            fontSize: 19,
            color: primaryColor,
            fontWeight: FontWeight.bold,
            fontFamily: App.font),
      ),
    );
  }
}
