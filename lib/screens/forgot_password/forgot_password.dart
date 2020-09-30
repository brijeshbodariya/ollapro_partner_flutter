import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ollapro_partner/common/app.dart';
import 'package:ollapro_partner/common/common_button.dart';
import 'package:ollapro_partner/common/common_widgets.dart';
import 'package:ollapro_partner/common/utils.dart';
import 'package:ollapro_partner/common/validation.dart';

import 'forgot_password_view_model.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  ForgotPasswordScreenState createState() => ForgotPasswordScreenState();
}

class ForgotPasswordScreenState extends State<ForgotPasswordScreen> with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController(text: "+91 ");
  bool _autoValidate = false;
  Validation validation;
  ForgotPasswordViewModel model;

  @override
  Widget build(BuildContext context) {
    print("runtimeType -> " + runtimeType.toString());
    model ?? (model = ForgotPasswordViewModel(this));
    validation = Validation();
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                backButton(),
                forgotText(),
                SizedBox(
                  height: 20,
                ),
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
                SizedBox(
                  height: 20,
                ),
                commonButton(
                  context,
                  onPressed: _validateInputs,
                  buttonName: App.submitButton,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  backButton() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 15, top: 20),
      child: ClipOval(
        child: Material(
          color: grey, // button color
          child: InkWell(
            child: SizedBox(
                width: 40,
                height: 40,
                child: Icon(
                  Icons.arrow_back_ios,
                  color: primaryColor,
                )),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
  forgotText() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 15, top: 50),
      child: Text(
        App.forgotText,
        style: TextStyle(
            fontSize: 25,
            color: primaryColor,
            fontWeight: FontWeight.bold,
            fontFamily: App.font),
      ),
    );
  }
  void _validateInputs() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      Utils.showToast("Success");
    } else {
      setState(() {
        _autoValidate = true;
        Utils.showToast("Please enter details");
      });
    }
  }
}
