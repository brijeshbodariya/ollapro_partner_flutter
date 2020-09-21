import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ollapro_partner/common/app.dart';
import 'package:ollapro_partner/common/common_button.dart';
import 'package:ollapro_partner/common/common_widgets.dart';
import 'package:ollapro_partner/common/utils.dart';
import 'package:ollapro_partner/common/validation.dart';
import 'package:ollapro_partner/screens/login/login_screen.dart';
import 'package:ollapro_partner/screens/otp/otp_screen.dart';
import 'package:ollapro_partner/screens/register/register_screen_view_model.dart';

import '../../common/app.dart';

class RegisterScreen extends StatefulWidget {
  @override
  RegisterScreenState createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController(text: "+91");
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool _obscureText1 = true;
  bool _obscureText2 = true;
  RegisterScreenViewModel model;
  bool _autoValidate = false;
  Validation validation;

  void _reRegisterPassword() {
    setState(() {
      _obscureText2 = !_obscureText2;
    });
  }

  void _registerPassword() {
    setState(() {
      _obscureText1 = !_obscureText1;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("runtimeType -> " + runtimeType.toString());
    model ?? (model = RegisterScreenViewModel(this));
    validation = Validation();

    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          autovalidate: _autoValidate,
          child: ListView(
            children: [
              Container(
                color: white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    createAccountText(),
                    enterYourDetailtext(),
                    //firstName
                    SizedBox(
                      height: 30,
                    ),
                    commonTextField(
                        title: App.fullName,
                        validation: validation.validateFullName,
                        controller: fullNameController,
                        hintText: "Enter Full Name",
                        prefixIcon: Image.asset(
                          App.personLogo,
                          height: 20,
                          width: 20,
                        ),
                        textInputType: TextInputType.text),
                    //email
                    commonTextField(
                        title: App.emailAddress,
                        validation: validation.validateEmail,
                        controller: emailController,
                        hintText: "Enter Email",
                        prefixIcon: Image.asset(
                          App.emailLogo,
                          height: 20,
                          width: 20,
                        ),
                        textInputType: TextInputType.emailAddress),
                    //phone
                    commonTextField(
                        title: App.mobileNumber,
                        validation: validation.validatePhone,
                        controller: phoneController,
                        hintText: "Enter Phone NUmber",
                        prefixIcon: Image.asset(
                          App.mobileLogo,
                          height: 20,
                          width: 20,
                        ),
                        textInputType: TextInputType.phone),
                    //password
                    commonTextField(
                      title: App.password,
                      validation: validation.validatePassword,
                      controller: passwordController,
                      obscureText: _obscureText1,
                      hintText: "Enter Password",
                      prefixIcon: Image.asset(
                        App.passwordLogo,
                        height: 20,
                        width: 20,
                      ),
                      textInputType: TextInputType.text,
                      suffixIcon: Container(
                        child: GestureDetector(
                          onTap: _registerPassword,
                          child: Image.asset(
                            App.visibility,
                            height: 20,
                            width: 20,
                          ),
                        ),
                      ),
                    ),
                    //confirm password
                    commonTextField(
                      title: App.password,
                      validation: validation.validatePassword,
                      controller: confirmPasswordController,
                      obscureText: _obscureText2,
                      hintText: "Enter Confirm Password",
                      prefixIcon: Image.asset(
                        App.passwordLogo,
                        height: 20,
                        width: 20,
                      ),
                      textInputType: TextInputType.text,
                      suffixIcon: Container(
                        child: GestureDetector(
                          onTap: _reRegisterPassword,
                          child: Image.asset(
                            App.visibility,
                            height: 20,
                            width: 20,
                          ),
                        ),
                      ),
                    ),SizedBox(
                      height: 15,
                    ),
                   commonButton(context,
                   onPressed:_validateInputs,
                   buttonName: App.registerButton)
                   // registerButton(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomLogin(),
    );
  }

  void _validateInputs() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => OtpScreen()));
    } else {
      setState(() {
        _autoValidate = true;
        Utils.showToast("Please fill details");
      });
    }
  }

  bottomLogin() {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Already have account?",
            style: TextStyle(
                color: primaryColor, fontSize: 14, fontFamily: App.font),
          ),
          InkWell(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            },
            child: Container(
              child: Text(
                "Login Now",
                style: TextStyle(
                    color: primaryColor, fontSize: 17, fontFamily: App.font),
              ),
            ),
          )
        ],
      ),
    );
  }

  createAccountText() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 15, top: 50),
      child: Text(
        App.createYourAccount,
        style: TextStyle(
            fontSize: 25,
            color: primaryColor,
            fontWeight: FontWeight.bold,
            fontFamily: App.font),
      ),
    );
  }

  enterYourDetailtext() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 15, top: 5),
      child: Text(
        App.enterYourDetails,
        style: TextStyle(
            fontSize: 18, color: secondaryColor, fontFamily: App.font),
      ),
    );
  }

  registerButton() {
    return Padding(
        padding: EdgeInsets.only(bottom: 20, top: 30),
        child: InkWell(
          onTap: () {
            _validateInputs();
          },
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 20, right: 20),
            height: 50,
            width: Utils.getDeviceWidth(context),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.all(
                  Radius.circular(30) //         <--- border radius here
                  ),
            ),
            child: Text(
              App.registerButton,
              style:
                  TextStyle(color: white, fontFamily: App.font, fontSize: 20),
            ),
          ),
        ));
  }
}
