import 'package:flutter/material.dart';
import 'package:ollapro_partner/common/app.dart';
import 'package:ollapro_partner/common/common_button.dart';
import 'package:ollapro_partner/common/common_widgets.dart';
import 'package:ollapro_partner/common/header.dart';
import 'package:ollapro_partner/common/state_city_json.dart';
import 'package:ollapro_partner/common/utils.dart';
import 'package:ollapro_partner/common/validation.dart';
import 'package:ollapro_partner/screens/kyc/contact_detail/contact_detail_screen_view_model.dart';
import 'package:ollapro_partner/screens/kyc/identify_detail/identify_detail_screen.dart';

class ContactDetailScreen extends StatefulWidget {
  @override
  ContactDetailScreenState createState() => ContactDetailScreenState();
}

class ContactDetailScreenState extends State<ContactDetailScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController(text: "+91");
  TextEditingController altPhoneController = TextEditingController(text: "+91");
  TextEditingController emailController = TextEditingController();
  TextEditingController add1Controller = TextEditingController();
  TextEditingController add2Controller = TextEditingController();
  TextEditingController add3Controller = TextEditingController();
  TextEditingController placeController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  ContactDetailScreenViewModel model;
  Repository repo = Repository();
  bool _autoValidate = false;
  Validation validation;
  List<String> _states = ["Choose a state"];
  List<String> _city = ["Choose a city"];
  String _selectedState = "Choose a state";
  String _selectedCity = "Choose a city";

  @override
  void initState() {
    _states = List.from(_states)..addAll(repo.getStates());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("runtimeType -> " + runtimeType.toString());
    model ?? (model = ContactDetailScreenViewModel(this));
    validation = Validation();
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.topLeft,
          child: Stack(
            children: [
              //phone
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Form(
                  key: _formKey,
                  autovalidate: _autoValidate,
                  child: Container(
                    // height: Utils.getDeviceHeight(context),
                    width: Utils.getDeviceWidth(context),
                    margin: EdgeInsets.only(top: 160),
                    child: Column(
                      children: [
                        commonTextField(
                            title: App.mobileNumber,
                            validation: validation.validatePhone,
                            controller: phoneController,
                            hintText: "Enter Phone NUmber",
                            textInputType: TextInputType.phone),
                        SizedBox(
                          height: 10,
                        ),
                        //alternate phone
                        commonTextField(
                            title: App.altMobileNumber,
                            validation: validation.validateAltPhone,
                            controller: altPhoneController,
                            hintText: "Enter Alternate Phone NUmber",
                            textInputType: TextInputType.phone),
                        SizedBox(
                          height: 10,
                        ),
                        //email
                        commonTextField(
                            title: App.emailAddress,
                            validation: validation.validateEmail,
                            controller: emailController,
                            hintText: "Enter Email",
                            textInputType: TextInputType.emailAddress),
                        SizedBox(
                          height: 10,
                        ),
                        //communication address
                        commonTextField(
                            title: App.communicationAddress,
                            controller: add1Controller,
                            validation: validation.validateAddress1Name,
                            hintText: "Enter Address 1",
                            textInputType: TextInputType.text),
                        add2Field(),
                        add3Field(),
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          width: Utils.getDeviceWidth(context),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              stateSelect(),
                              citySelect(),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          width: Utils.getDeviceWidth(context),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              //middle name
                              Expanded(
                                flex: 1,
                                child: commonTextField(
                                    title: App.exactPlace,
                                    validation: validation.validatePlace,
                                    controller: placeController,
                                    hintText: "Enter Exact place",
                                    textInputType: TextInputType.text),
                              ),
                              //lastname
                              Expanded(
                                flex: 1,
                                child: commonTextField(
                                    title: App.pinCode,
                                    validation: validation.validatePinCode,
                                    controller: pinCodeController,
                                    hintText: "Enter pincode",
                                    textInputType: TextInputType.phone),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 160,
                color: Colors.white,
                child: Column(
                  children: [
                    appBarKYC(
                        context,
                        MaterialPageRoute(
                            builder: (context) => IdentifyDetailScreen())),
                    HeaderLine.headerLineComplete(context, 3, 1, 2, 2, 2, 2),
                    contactDetailText(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
     bottomNavigationBar: commonRowButton(context,
      buttonName1: App.backButton,
     buttonName2: App.nextButton,
     onPressed:_validateInputs ),
    );
  }

  void _validateInputs() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => IdentifyDetailScreen()));
    } else {
      setState(() {
        _autoValidate = true;
        Utils.showToast("Please enter details");
      });
    }
  }

  contactDetailText() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 15, top: 20),
      child: Text(
        App.contactDetail,
        style: TextStyle(
            fontSize: 20,
            color: primaryColor,
            fontWeight: FontWeight.bold,
            fontFamily: App.font),
      ),
    );
  }

  add2Field() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 15, right: 15),
      child: TextFormField(
        style: TextStyle(color: primaryColor, fontFamily: App.font),
        controller: add2Controller,
        validator: validation.validateAddress2Name,
        decoration: InputDecoration(
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: secondaryColor,
            ),
          ),
          hintText: "Enter Address2",
          hintStyle: TextStyle(
            color: secondaryColor,
            fontFamily: App.font,
          ),
        ),
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
      ),
    );
  }

  add3Field() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 15, right: 15),
      child: TextFormField(
        style: TextStyle(color: primaryColor, fontFamily: App.font),
        controller: add3Controller,
        validator: validation.validateAddress3Name,
        decoration: InputDecoration(
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: secondaryColor,
            ),
          ),
          hintText: "Enter Address3",
          hintStyle: TextStyle(
            color: secondaryColor,
            fontFamily: App.font,
          ),
        ),
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
      ),
    );
  }
  stateSelect() {
    return Expanded(
      flex: 1,
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: 15, top: 15),
            child: Text(
              App.state,
              style: TextStyle(
                  fontSize: 17, color: secondaryColor, fontFamily: App.font),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: 15, right: 15),
            child: DropdownButton<String>(
              isExpanded: true,
              items: _states.map((String dropDownStringItem) {
                return DropdownMenuItem<String>(
                  value: dropDownStringItem,
                  child: Text(
                    dropDownStringItem,
                    style: TextStyle(color: primaryColor, fontFamily: App.font),
                  ),
                );
              }).toList(),
              onChanged: (value) => _onSelectedState(value),
              value: _selectedState,
            ),
          ),
          _selectedState != null
              ? Container()
              : Text(
                  'Select state',
                  style: TextStyle(color: red, fontFamily: App.font),
                )
        ],
      ),
    );
  }
  citySelect() {
    return Expanded(
      flex: 1,
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: 15, top: 15),
            child: Text(
              App.city,
              style: TextStyle(
                  fontSize: 17, color: secondaryColor, fontFamily: App.font),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: 15, right: 15),
            child: DropdownButton<String>(
              isExpanded: true,
              items: _city.map((String dropDownStringItem) {
                return DropdownMenuItem<String>(
                  value: dropDownStringItem,
                  child: Text(
                    dropDownStringItem,
                    style: TextStyle(color: primaryColor, fontFamily: App.font),
                  ),
                );
              }).toList(),
              // onChanged: (value) => print(value),
              onChanged: (value) => _onSelectedCity(value),
              value: _selectedCity,
            ),
          ),
          _selectedCity != null
              ? Container()
              : Text(
                  'Select city',
                  style: TextStyle(color: red, fontFamily: App.font),
                )
        ],
      ),
    );
  }
  void _onSelectedState(String value) {
    setState(() {
      _selectedCity = "Choose ..";
      _city = ["Choose .."];
      _selectedState = value;
      _city = List.from(_city)..addAll(repo.getLocalByState(value));
    });
  }

  void _onSelectedCity(String value) {
    setState(() => _selectedCity = value);
  }
}
