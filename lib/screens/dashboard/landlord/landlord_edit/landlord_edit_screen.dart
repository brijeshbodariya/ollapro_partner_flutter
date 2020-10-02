import 'package:flutter/material.dart';
import 'package:ollapro_partner/common/app.dart';
import 'package:ollapro_partner/common/common_appbar.dart';
import 'package:ollapro_partner/common/common_button.dart';
import 'package:ollapro_partner/common/common_widgets.dart';
import 'package:ollapro_partner/common/utils.dart';
import 'package:ollapro_partner/common/validation.dart';
import 'lanlord_edit_screen_view_model.dart';

class LandLordEditScreen extends StatefulWidget {
  @override
  LandLordEditScreenState createState() => LandLordEditScreenState();
}

class LandLordEditScreenState extends State<LandLordEditScreen> {
  LandLordEditViewModel model;
  FocusNode f1 = FocusNode();
  FocusNode f2 = FocusNode();
  FocusNode f3 = FocusNode();
  FocusNode f4 = FocusNode();
  FocusNode f5 = FocusNode();
  bool _autoValidate = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController aadharController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  Validation validation;

  @override
  Widget build(BuildContext context) {
    print("runtimeType -> " + runtimeType.toString());
    model ?? (model = LandLordEditViewModel(this));
    validation = Validation();
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: primaryColor,
          child: Stack(
            children: [
              appBarReward(context, "Mukesh Kumar"),
              Container(
                height: Utils.getDeviceHeight(context),
                width: Utils.getDeviceWidth(context),
                margin: EdgeInsets.only(top: 60),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25)),
                    color: whiteMain),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25)),
                          color: whiteMain,
                        ),
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            dashBoard(),
                          ],
                        ),
                      ),
                      Form(
                        key: _formKey,
                        autovalidate: _autoValidate,
                        child: Column(
                          children: [
                            Container(
                              color: whiteMain,
                              child: Stack(
                                alignment: Alignment.topCenter,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                      top: 15,
                                      bottom: 15,
                                    ),
                                    child: editableField(),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(top: 10),
        child: commonButton(
          context,
          onPressed: _validateInputs,
          buttonName: App.submitButton,
        ),
      ),
    );
  }

  void _validateInputs() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      Utils.showToast("Success");
      /* Navigator.push(context,
            MaterialPageRoute(builder: (context) => ContactDetailScreen()));*/
    } else {
      setState(() {
        _autoValidate = true;
        Utils.showToast("Please enter details");
      });
    }
  }

  dashBoard() {
    return Container(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                  margin: EdgeInsets.only(top: 20, bottom: 10),
                  width: 120.0,
                  height: 120.0,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                            App.userImage,
                          )))),
              Positioned(
                bottom: 0,
                child: GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      App.camera,
                      height: 40,
                      width: 40,
                    )),
              )
            ],
          ),
          Container(
              margin: EdgeInsets.only(top: 5, bottom: 10),
              child: Text(
                "Mukesh Kumar",
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: App.font,
                    color: primaryColor,
                    fontWeight: FontWeight.bold),
              )),
        ],
      ),
    );
  }

  editableField() {
    return Column(
      children: [
        // full name
        commonTextWithTextField(
          context,
          textInputType: TextInputType.text,
          hintText: "Enter Full Name",
          focusNode: f1,
          controller: fullNameController,
          title: "Full Name",
          prefixIcon: Image.asset(
            App.personLogo,
            color: primaryColor,
            height: 10,
            width: 10,
          ),
          validation: validation.validateFullName,
          suffixIcon: Image.asset(
            App.editLogo,
            color: primaryColor,
            height: 10,
            width: 10,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        //enter email
        commonTextWithTextField(
          context,
          focusNode: f2,
          textInputType: TextInputType.emailAddress,
          hintText: "Enter Email",
          controller: emailController,
          title: "Email",
          prefixIcon: Image.asset(
            App.emailLogo,
            color: primaryColor,
            height: 10,
            width: 10,
          ),
          validation: validation.validateEmail,
          suffixIcon: Image.asset(
            App.editLogo,
            height: 10,
            width: 10,
            color: primaryColor,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        // mobile number
        commonTextWithTextField(
          context,
          focusNode: f3,
          textInputType: TextInputType.phone,
          hintText: "Enter Mobile Number",
          controller: phoneController,
          prefixIcon: Image.asset(
            App.mobileLogo,
            color: primaryColor,
            height: 10,
            width: 10,
          ),
          title: "Phone Number",
          validation: validation.validatePhone,
          suffixIcon: Image.asset(
            App.editLogo,
            height: 10,
            width: 10,
            color: primaryColor,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        // aadhar
        commonTextWithTextField(
          context,
          focusNode: f4,
          textInputType: TextInputType.phone,
          hintText: "Enter Aadhar Number",
          controller: aadharController,
          prefixIcon: Image.asset(
            App.idSmallLogo,
            color: primaryColor,
            height: 10,
            width: 10,
          ),
          title: App.aadhar,
          validation: validation.validateAadhar,
          suffixIcon: Image.asset(
            App.editLogo,
            height: 10,
            width: 10,
            color: primaryColor,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        // location
        commonTextWithTextField(
          context,
          focusNode: f5,
          textInputType: TextInputType.text,
          hintText: "Enter Location ",
          controller: locationController,
          prefixIcon: Image.asset(
            App.locationSmallLogo,
            color: primaryColor,
            height: 8,
            width: 8,
          ),
          title: App.location,
          validation: validation.validatePlace,
          suffixIcon: Image.asset(
            App.editLogo,
            height: 10,
            width: 10,
            color: primaryColor,
          ),
        ),
      ],
    );
  }
}
