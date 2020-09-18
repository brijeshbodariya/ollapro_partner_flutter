import 'package:flutter/material.dart';
import 'package:ollapro_partner/common/app.dart';
import 'package:ollapro_partner/common/common_widgets.dart';
import 'package:ollapro_partner/common/general_text_feild.dart';
import 'package:ollapro_partner/common/utils.dart';
import 'package:ollapro_partner/common/validation.dart';
import 'package:ollapro_partner/screens/dashboard/dashboard_screen.dart';
import 'package:ollapro_partner/screens/forgot_password/forgot_password.dart';
import 'package:ollapro_partner/screens/register/register_screen.dart';

import 'login_screen_view_model.dart';

class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController(text: "+91");
  TextEditingController passwordController = TextEditingController();
  LoginScreenViewModel model;
  bool _obscureText = true;
  bool checkBox = false;
  bool _autoValidate = false;
  Validation validation;

  void _loginPassword() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("runtimeType -> " + runtimeType.toString());
    model ?? (model = LoginScreenViewModel(this));

    validation = Validation();
    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: [
            Container(
              height: Utils.getDeviceHeight(context),
              width: Utils.getDeviceWidth(context),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(App.loginBg),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                children: [
                  partnerLogintext(),
                  credentialsText(),
                  SizedBox(
                    height: 30,
                  ),
                  //phone
                  commonTextField(
                      validation: validation.validatePhone,
                      title: App.mobileNumber,
                      controller: phoneController,
                      hintText: "Enter Phone NUmber",
                      prefixIcon: Image.asset(
                        App.mobileLogo,
                        height: 20,
                        width: 20,
                      ),
                      textInputType: TextInputType.phone),
                  SizedBox(
                    height: 20,
                  ),
                  //password
                  commonTextField(
                    title: App.password,
                    validation: validation.validatePassword,
                    controller: passwordController,
                    obscureText: _obscureText,
                    hintText: "Enter Password",
                    prefixIcon: Image.asset(
                      App.passwordLogo,
                      height: 20,
                      width: 20,
                    ),
                    textInputType: TextInputType.text,
                    suffixIcon: Container(
                      child: GestureDetector(
                        onTap: _loginPassword,
                        child: Image.asset(
                          App.visibility,
                          height: 20,
                          width: 20,
                        ),
                      ),
                    ),
                  ),
                  rememberPassword(),
                  loginButton(),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: bottomRegister(),
    );
  }

  bottomRegister() {
    return Padding(
        padding: EdgeInsets.only(bottom: 15),
        child: InkWell(
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => RegisterScreen()));
          },
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 20, right: 20),
            height: 50,
            width: Utils.getDeviceWidth(context),
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.all(
                  Radius.circular(30) //         <--- border radius here
                  ),
            ),
            child: Text(
              App.loginToRegisterButton,
              style: TextStyle(
                  color: primaryColor, fontFamily: App.font, fontSize: 15),
            ),
          ),
        ));
  }

  partnerLogintext() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 15, top: 50),
      child: Text(
        App.partnerLogin,
        style: TextStyle(
            fontSize: 25,
            color: primaryColor,
            fontWeight: FontWeight.bold,
            fontFamily: App.font),
      ),
    );
  }

  credentialsText() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 15, top: 5),
      child: Text(
        App.credentials,
        style: TextStyle(
            fontSize: 18, color: secondaryColor, fontFamily: App.font),
      ),
    );
  }

  rememberPassword() {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15, top: 18, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Checkbox(
                onChanged: (bool value) {
                  setState(() {
                    checkBox = !checkBox;
                  });
                  print(checkBox);
                },
                value: checkBox,
              ),
              Text(
                "Remember Me",
                style: TextStyle(color: secondaryColor, fontSize: 16),
              ),
            ],
          ),
          Container(
            alignment: Alignment.topLeft,
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ForgotPasswordScreen()));
              },
              child: Text(
                App.forgotPassword,
                style: TextStyle(
                    fontSize: 16, color: secondaryColor, fontFamily: App.font),
              ),
            ),
          ),
        ],
      ),
    );
  }

  loginButton() {
    return Padding(
        padding: EdgeInsets.only(bottom: 15),
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
              App.loginButton,
              style:
                  TextStyle(color: white, fontFamily: App.font, fontSize: 15),
            ),
          ),
        ));
  }

  void _validateInputs() {
    if (phoneController.text.isEmpty || passwordController.text.isEmpty) {
      Utils.showToast("Enter Details");
    } else {
      if (_formKey.currentState.validate()) {
        _formKey.currentState.save();
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => DashBoardScreen()));
      } else {
        setState(() {
          _autoValidate = true;
          Utils.showToast("Enter Details properly");
        });
      }
    }
  }

  clear() {
    phoneController.clear();
  }
}
