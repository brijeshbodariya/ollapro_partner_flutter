import 'package:flutter/material.dart';
import 'package:ollapro_partner/common/app.dart';
import 'package:ollapro_partner/common/common_button.dart';
import 'package:ollapro_partner/common/utils.dart';
import 'package:ollapro_partner/screens/kyc/personal_detail/personal_detail.dart';
import 'package:otp_count_down/otp_count_down.dart';
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
  bool _autoValidate = false;
  TextEditingController controller = TextEditingController();
  OtpScreenViewModel model;
  OTPCountDown _otpCountDown; // create instance
  final int _otpTimeInMS = 500 * 2 * 60;  // time in milliseconds for count down
  String countdown;

  @override
  void dispose() {
    _otpCountDown.cancelTimer();
    super.dispose();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }


  @override
  Widget build(BuildContext context) {
    print("runtimeType -> " + runtimeType.toString());
    model ?? (model = OtpScreenViewModel(this));

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            autovalidate: _autoValidate,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                backButton(),
                verificationText(),
                verifyText(),
                otpTextField(),
                errorText(),
                SizedBox(height: 30,),

                // verify button
                commonButton(context,
                onPressed: _validateInputs,
                buttonName: App.verifyButton),
                otpTimer(),
                codeText(),
                SizedBox(height: 10,),
                // resend button
                commonButton(context,
                    onPressed: _validateInputs,
                    buttonName: App.resendCodeButton),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _validateInputs() {
    if (_formKey.currentState.validate() && otpdata != null) {
      _formKey.currentState.save();
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => PersonalDetailScreen()));
    } else {
      setState(() {
        _autoValidate = true;
        Utils.showToast("Please enter OTP");
      });
    }
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

  otpTextField() {
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

  errorText(){
    return Container(
      child: controller != null ? Container(): Text("Enter otp",style: TextStyle(color: red, fontFamily: App.font),),
    );
  }

  void startTimer() {
    _otpCountDown = OTPCountDown.startOTPTimer(
      timeInMS: _otpTimeInMS, // time in milliseconds
      currentCountDown: (String counter) {
        setState(() {
          countdown = counter;
        });
        print("Count down : $counter"); // shows current count down time
      },
      onFinish: () {
        print("Count down finished!"); // called when the count down finishes.
      },
    );
  }
  otpTimer() {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Text(
        countdown ?? "00:00",
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


}
