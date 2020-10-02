import 'package:flutter/material.dart';
import 'package:ollapro_partner/common/app.dart';
import 'package:ollapro_partner/common/common_appbar.dart';
import 'package:ollapro_partner/common/common_button.dart';
import 'package:ollapro_partner/common/utils.dart';
import 'package:ollapro_partner/common/validation.dart';
import 'chnage_password_screen_view_model.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  ChangePasswordScreenState createState() => ChangePasswordScreenState();
}

class ChangePasswordScreenState extends State<ChangePasswordScreen> {
  ChangePasswordScreenViewModel model;
  TextEditingController currentPassController = TextEditingController();
  TextEditingController newPassController = TextEditingController();
  TextEditingController reEnterPassController = TextEditingController();
  bool _autoValidate = false;
  Validation validation;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print("runtimeType -> " + runtimeType.toString());
    model ?? (model = ChangePasswordScreenViewModel(this));

    validation = Validation();
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: primaryColor,
          child: Stack(
            children: [
              appBarReward(context, App.changePasswordDrawer),
              Container(
                height: Utils.getDeviceHeight(context),
                width: Utils.getDeviceWidth(context),
                margin: EdgeInsets.only(top: 60),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25)),
                    color: white),
                child: Form(
                  key: _formKey,
                  autovalidate: _autoValidate,
                  child: Column(
                    children: [
                      currentPassword(),
                      newPassword(),
                      reEnterPassword(),

                      //submit button
                      commonButton(context,
                          buttonName: App.submitButton,
                          onPressed: _validateInputs)
                    ],
                  ),
                ),
              )
            ],
          ),
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

  currentPassword() {
    return Container(
      margin: EdgeInsets.only(top: 40, left: 15, right: 15, bottom: 15),
      child: TextFormField(
        style: TextStyle(
          color: primaryColor,
          fontFamily: App.font,
        ),
        validator: validation.validatePassword,
        controller: currentPassController,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
          errorStyle: TextStyle(color: red, fontFamily: App.font),
          hintStyle: TextStyle(color: secondaryColor, fontFamily: App.font),
          focusColor: grey,
          filled: true,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: BorderSide(color: grey)),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(
              color: red,
            ),
          ),
          focusedErrorBorder:
              OutlineInputBorder(borderSide: BorderSide(color: red)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(
              color: grey,
            ),
          ),
          hintText: 'Current Password',
        ),
        keyboardType: TextInputType.text,
      ),
    );
  }

  newPassword() {
    return Container(
      margin: EdgeInsets.only(top: 5, left: 15, right: 15, bottom: 15),
      child: TextFormField(
        style: TextStyle(
          color: primaryColor,
          fontFamily: App.font,
        ),
        controller: newPassController,
        validator: validation.validatePassword,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
            errorStyle: TextStyle(color: red, fontFamily: App.font),
            hintStyle: TextStyle(color: secondaryColor, fontFamily: App.font),
            focusColor: grey,
            filled: true,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide: BorderSide(color: grey)),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: BorderSide(
                color: red,
              ),
            ),
            focusedErrorBorder:
                OutlineInputBorder(borderSide: BorderSide(color: red)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: BorderSide(
                color: grey,
              ),
            ),
            hintText: 'New Password'),
        keyboardType: TextInputType.text,
      ),
    );
  }

  reEnterPassword() {
    return Container(
      margin: EdgeInsets.only(top: 5, left: 15, right: 15, bottom: 22),
      child: TextFormField(
        style: TextStyle(
          color: primaryColor,
          fontFamily: App.font,
        ),
        controller: reEnterPassController,
        validator: validation.validatePassword,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
          errorStyle: TextStyle(color: red, fontFamily: App.font),
          hintStyle: TextStyle(color: secondaryColor, fontFamily: App.font),
          focusColor: grey,
          filled: true,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: BorderSide(color: grey)),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(
              color: red,
            ),
          ),
          focusedErrorBorder:
              OutlineInputBorder(borderSide: BorderSide(color: red)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(
              color: grey,
            ),
          ),
          hintText: 'Confirm New Password',
        ),
        keyboardType: TextInputType.text,
      ),
    );
  }
}
