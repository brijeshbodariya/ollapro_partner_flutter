import 'package:flutter/material.dart';
import 'package:ollapro_partner/common/app.dart';
import 'package:ollapro_partner/common/utils.dart';
import 'package:ollapro_partner/screens/kyc/personal_detail/personal_detail.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

import 'otp_screen_view_model.dart';

class OtpScreen extends StatefulWidget {
  @override
  OtpScreenState createState() => OtpScreenState();
}

class OtpScreenState extends State<OtpScreen> {
  String otpdata;
  String smsOTP;
  int pinLength = 6;
  bool hasError = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();
  OtpScreenViewModel model;
  @override
  Widget build(BuildContext context) {
    print("runtimeType -> " + runtimeType.toString());
    model ?? (model = OtpScreenViewModel(this));

    return SafeArea(
      child: Scaffold(

        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                backButton(),
                verificationText(),
                verifyText(),
                otpTextFeild(),
                verifyButton(),
                otpTimer(),
                codeText(),
                resendCodeButton(),
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
      margin: EdgeInsets.only(left: 12,top: 10),
      child: InkWell(
        child: Image.asset(App.backButtonLogo,height: 50,width: 50,),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  verificationText() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 15, top: 50),
      child: Text(
        App.verificationCodeText,
        style: TextStyle(
            fontSize: 25,
            color: primaryColor,
            fontWeight: FontWeight.bold,
            fontFamily: App.font),
      ),
    );
  }

  verifyText() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 15, top: 5),
      child: Text(
        App.verifyText,
        style: TextStyle(
            fontSize: 18, color: secondaryColor, fontFamily: App.font),
      ),
    );
  }

  otpTextFeild() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: PinCodeTextField(
        highlightColor: secondaryColor,
        defaultBorderColor: secondaryColor,
        hasTextBorderColor: secondaryColor,
        autofocus: false,
        hideCharacter: true,
        highlight: true,
        pinBoxHeight: 50,
        pinBoxWidth: 50,
        controller: controller,
        maxLength: pinLength,
        hasError: hasError,
        maskCharacter: '*',
        onTextChanged: (text) {
          if (text.length == 6) {
            otpdata = text;
            smsOTP = text;
          }
        },
        pinBoxRadius: 5,
        onDone: (text) {},
        wrapAlignment: WrapAlignment.start,
        pinBoxDecoration: ProvidedPinBoxDecoration.defaultPinBoxDecoration,
        pinTextStyle: TextStyle(fontSize: 25.0, color: primaryColor),
        pinTextAnimatedSwitcherTransition:
        ProvidedPinBoxTextAnimation.scalingTransition,
        pinTextAnimatedSwitcherDuration: const Duration(milliseconds: 300),
      ),
    );
  }

  verifyButton() {
    return  Padding(
        padding: EdgeInsets.only(bottom: 10,top: 30),
        child: InkWell(
          onTap: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PersonalDetailScreen()));
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
              App.verifyButton,
              style:
              TextStyle(color: white, fontFamily: App.font, fontSize: 20),
            ),
          ),
        ));
  }

  otpTimer() {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Text(
        "00:30",
        style: TextStyle(
            fontSize: 15,
            fontFamily: App.font,
            fontWeight: FontWeight.bold,
            color: red),
      ),
    );
  }
  codeText() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only( top: 50),
      child: Text(
        App.codeText,
        style: TextStyle(
            fontSize: 18, color: secondaryColor, fontFamily: App.font),
      ),
    );
  }
  resendCodeButton() {
    return Padding(
        padding: EdgeInsets.only(top: 10),
        child: InkWell(
          onTap: (){
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
              App.resendCodeButton,
              style:
              TextStyle(color: primaryColor, fontFamily: App.font, fontSize: 20),
            ),
          ),
        ));
  }

}
