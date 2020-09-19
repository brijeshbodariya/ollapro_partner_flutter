import 'package:flutter/material.dart';
import 'package:ollapro_partner/common/app.dart';
import 'package:ollapro_partner/common/common_widgets.dart';
import 'package:ollapro_partner/common/header.dart';
import 'package:ollapro_partner/common/utils.dart';
import 'package:ollapro_partner/common/validation.dart';
import 'package:ollapro_partner/screens/kyc/reference/reference_view_model.dart';
import 'package:ollapro_partner/screens/kyc/upload_document/uploaddocument.dart';

import '../../../common/app.dart';

class ReferenceScreen extends StatefulWidget {
  @override
  ReferenceScreenState createState() => ReferenceScreenState();
}

class ReferenceScreenState extends State<ReferenceScreen> {
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
  @override
  Widget build(BuildContext context) {
    print("runtimeType -> " + runtimeType.toString());
    model ?? (model = ReferenceViewModel(this));
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
                                  textInputType: TextInputType.text
                              ),
                              SizedBox(height: 10),
                              // reference1 place
                              commonTextField(
                                  title: App.place,
                                  validation: validation.validatePlace,
                                  controller: placeController,
                                  hintText: "Enter Place",
                                  textInputType: TextInputType.text
                              ),SizedBox(height: 10),
                              // reference1 mobile number
                              commonTextField(
                                  title: App.mobileNumber,
                                  validation: validation.validatePhone,
                                  controller: phoneController,
                                  hintText: "Enter Mobile Number",
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
                                  textInputType: TextInputType.text
                              ),SizedBox(height: 10),
                              // reference2 place
                              commonTextField(
                                  title: App.place,
                                  validation: validation.validatePlace,
                                  controller: place1Controller,
                                  hintText: "Enter Place",
                                  textInputType: TextInputType.text
                              ),SizedBox(height: 10),
                              // reference2 mobile number
                              commonTextField(
                                  title: App.mobileNumber,
                                  validation: validation.validatePhone,
                                  controller: phone1Controller,
                                  hintText: "Enter Mobile Number",
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
