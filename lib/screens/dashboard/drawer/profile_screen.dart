import 'package:flutter/material.dart';
import 'package:ollapro_partner/common/app.dart';
import 'package:ollapro_partner/common/common_appbar.dart';
import 'package:ollapro_partner/common/common_button.dart';
import 'package:ollapro_partner/common/common_widgets.dart';
import 'package:ollapro_partner/common/utils.dart';
import 'package:ollapro_partner/common/validation.dart';

class MyProfileScreen extends StatefulWidget {
  @override
  MyProfileScreenState createState() => MyProfileScreenState();
}

class MyProfileScreenState extends State<MyProfileScreen> { bool _autoValidate = false;
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
TextEditingController fullNameController =
TextEditingController(text: "John Doe");
TextEditingController emailController =
TextEditingController(text: "johndoe@gmail.com");
TextEditingController phoneController =
TextEditingController(text: "+918888888888");
Validation validation;


@override
  Widget build(BuildContext context) {
  validation = Validation();
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: primaryColor,
          child: Stack(
            children: [
              appBarReward(context, App.editProfile),
              Container(
                height: Utils.getDeviceHeight(context),
                width: Utils.getDeviceWidth(context),
                margin: EdgeInsets.only(top: 60),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25)),
                    color: white),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 3.2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25)),
                            color: yellow),
                        child: Stack(
                          alignment:  Alignment.bottomCenter,
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
                              color: white,
                              child: Stack(
                                alignment: Alignment.topCenter,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                        top: 5, bottom: 15, left: 15, right: 15),
                                    child: Column(
                                      children: [
                                        commonTextWithTextField(
                                          textInputType: TextInputType.text,
                                          hintText: "Enter Full Name",
                                          controller: fullNameController,
                                          title: "Full Name",
                                          validation: validation.validateFullName,
                                          suffixIcon: Image.asset(
                                            App.editLogo,
                                            height: 10,
                                            width: 10,
                                          ),
                                        ),
                                        commonTextWithTextField(
                                          textInputType: TextInputType.emailAddress,
                                          hintText: "Enter Email",
                                          controller: emailController,
                                          title: "Email",
                                          validation: validation.validateEmail,
                                          suffixIcon: Image.asset(
                                            App.editLogo,
                                            height: 10,
                                            width: 10,
                                          ),
                                        ),
                                        commonTextWithTextField(
                                          textInputType: TextInputType.phone,
                                          hintText: "Enter Mobile Number",
                                          controller: phoneController,
                                          title: "Phone Number",
                                          validation: validation.validatePhone,
                                          suffixIcon: Image.asset(
                                            App.editLogo,
                                            height: 10,
                                            width: 10,
                                          ),
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
                  margin: EdgeInsets.only(top: 30, bottom: 10),
                  width: 120.0,
                  height: 120.0,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.fill, image: AssetImage(App.userImage,)))),
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
              margin: EdgeInsets.only(top: 5),
              child: Text(
                "Saurabh Kumar",
                style: TextStyle(
                    fontSize: 18, fontFamily: App.font, color: white,fontWeight: FontWeight.bold),
              )),
        ],
      ),
    );
  }
}
