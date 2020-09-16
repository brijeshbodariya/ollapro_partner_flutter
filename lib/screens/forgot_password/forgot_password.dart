import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ollapro_partner/common/app.dart';
import 'package:ollapro_partner/common/common_widgets.dart';
import 'package:ollapro_partner/common/utils.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  ForgotPasswordScreenState createState() => ForgotPasswordScreenState();
}

class ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController(text: "+91 ");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                backButton(),
                forgotText(),
                SizedBox(height: 20,),
                //phone
                commonTextField(
                    title: App.mobileNumber,
                    controller: phoneController,
                    hintText: "Enter Phone NUmber",
                    prefixIcon: Image.asset(
                      App.mobileLogo,
                      height: 20,
                      width: 20,
                    ),
                    textInputType: TextInputType.phone),
                submitButton(),
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
      margin: EdgeInsets.only(left: 15,top: 20),
      child: ClipOval(
        child: Material(
          color: grey, // button color
          child: InkWell(
            child: SizedBox(width: 40, height: 40, child: Icon(Icons.arrow_back_ios,color: primaryColor,)),
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

  mobileText() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 15, top: 5),
      child: Text(
        App.mobileText,
        style: TextStyle(
            fontSize: 18, color: secondaryColor, fontFamily: App.font),
      ),
    );
  }
  phoneField() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 15, right: 15,top: 45),
      child: TextFormField(
        style: TextStyle(fontWeight: FontWeight.bold,color: primaryColor),
        controller: phoneController ,
        decoration: InputDecoration(
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: secondaryColor,
            ),
          ),
          prefixIcon: Image.asset(
            App.mobileLogo,
            height: 25,
            width: 25,
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
    );
  }
  submitButton() {
    return Padding(
        padding: EdgeInsets.only(top:20,bottom: 15),
        child: InkWell(
          onTap: (){
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
              App.submitButton,
              style:
              TextStyle(color: white, fontFamily: App.font, fontSize: 15),
            ),
          ),
        ));
  }
}
