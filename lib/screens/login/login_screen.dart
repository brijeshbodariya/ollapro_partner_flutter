import 'package:flutter/material.dart';
import 'package:ollapro_partner/common/app.dart';
import 'package:ollapro_partner/common/utils.dart';
import 'package:ollapro_partner/screens/register/register_screen.dart';

import 'login_screen_view_model.dart';

class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController(text: "+91 ");
  TextEditingController passwordController = TextEditingController();
  LoginScreenViewModel model;
  bool _obscureText = true;

  void _loginPassword() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    /*  print("runtimeType -> " + runtimeType.toString());
    model ?? (model = LoginScreenViewModel(this));*/

    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: Utils.getDeviceHeight(context) / 1.3,
                      width: MediaQuery.of(context).size.width,
                      color: white,
                      child: Column(
                        children: [
                          Container(
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
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(left: 15, top: 5),
                            child: Text(
                              App.credentials,
                              style: TextStyle(
                                  fontSize: 18,
                                  color: secondaryColor,
                                  fontFamily: App.font),
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(left: 15, top: 45),
                            child: Text(
                              App.mobileNumber,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: secondaryColor,
                                  fontFamily: App.font),
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(left: 15, right: 15),
                            child: TextField(
                              controller: phoneController,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: secondaryColor)),
                                prefixIcon: Icon(
                                  Icons.phone_android,
                                  color: secondaryColor,
                                ),
                                hintText: "Enter Mobile Number",
                                hintStyle: TextStyle(
                                  color: secondaryColor,
                                  fontFamily: App.font,
                                ),
                              ),
                              keyboardType: TextInputType.phone,
                              textInputAction: TextInputAction.next,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(left: 15, top: 10),
                            child: Text(
                              App.password,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: secondaryColor,
                                  fontFamily: App.font),
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(left: 15, right: 15),
                            child: TextField(
                              controller: passwordController,
                              obscureText: _obscureText,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: secondaryColor)),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: secondaryColor,
                                ),
                                suffixIcon: Container(
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.remove_red_eye,
                                      color: secondaryColor,
                                    ),
                                    onPressed: _loginPassword,
                                  ),
                                ),
                                hintText: "Enter Password ",
                                hintStyle: TextStyle(
                                  color: secondaryColor,
                                  fontFamily: App.font,
                                ),
                              ),
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.done,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: 15, right: 15, top: 18, bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    App.rememberMe,
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: secondaryColor,
                                        fontFamily: App.font),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    App.forgotPassword,
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: secondaryColor,
                                        fontFamily: App.font),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20, right: 20),
                            height: 50,
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.all(Radius.circular(
                                      30) //         <--- border radius here
                                  ),
                            ),
                            width: Utils.getDeviceWidth(context),
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Text(
                                App.loginButton,
                                style: TextStyle(
                                    color: white,
                                    fontFamily: App.font,
                                    fontSize: 18),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
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
        child: Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          height: 50,
          width: Utils.getDeviceWidth(context),
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(
                30) //         <--- border radius here
            ),
          ),
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              App.loginToRegisterButton,
              style: TextStyle(
                  color: white, fontFamily: App.font, fontSize: 15),
            ),
          ),
        ));
  }
}
