import 'package:flutter/material.dart';
import 'package:ollapro_partner/common/app.dart';
import 'package:ollapro_partner/common/common_widgets.dart';
import 'package:ollapro_partner/common/header.dart';
import 'package:ollapro_partner/common/utils.dart';
import 'file:///D:/LiveProject/ollapro_partner_flutter/lib/common/repo.dart';
import 'package:ollapro_partner/screens/kyc/contact_detail/contact_detail_screen_view_model.dart';
import 'package:ollapro_partner/screens/kyc/identify_detail/identify_detail_screen.dart';

class ContactDetailScreen extends StatefulWidget {
  @override
  ContactDetailScreenState createState() => ContactDetailScreenState();
}

class ContactDetailScreenState extends State<ContactDetailScreen> {
  TextEditingController phoneController = TextEditingController(text: "+91 ");
  TextEditingController altPhoneController =
      TextEditingController(text: "+91 ");
  TextEditingController emailController = TextEditingController();
  TextEditingController add1Controller = TextEditingController();
  TextEditingController add2Controller = TextEditingController();
  TextEditingController add3Controller = TextEditingController();
  TextEditingController placeController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  ContactDetailScreenViewModel model;
  Repository repo = Repository();

  List<String> _states = ["Choose a state"];
  List<String> _city = ["Choose .."];
  String _selectedState = "Choose a state";
  String _selectedCity = "Choose ..";

  @override
  void initState() {
    _states = List.from(_states)..addAll(repo.getStates());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("runtimeType -> " + runtimeType.toString());
    model ?? (model = ContactDetailScreenViewModel(this));
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            child: Container(
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  appBarKYC(context,MaterialPageRoute(builder: (context)=> IdentifyDetailScreen())),
                  HeaderLine.headerLineComplete(context, 3, 1, 2, 2, 2, 2),
                  contactDetailText(),
                  SizedBox(
                    height: 10,
                  ),
                  //phone
                  commonTextField(
                      title: App.mobileNumber,
                      controller: phoneController,
                      hintText: "Enter Phone NUmber",
                      textInputType: TextInputType.phone),
                  SizedBox(
                    height: 10,
                  ),
                  //alternate phone
                  commonTextField(
                      title: App.altMobileNumber,
                      controller: altPhoneController,
                      hintText: "Enter Alternate Phone NUmber",
                      textInputType: TextInputType.phone),
                  SizedBox(
                    height: 10,
                  ),
                  //email
                  commonTextField(
                      title: App.emailAddress,
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
                              controller: placeController,
                              hintText: "Enter Exact place",
                              textInputType: TextInputType.text),
                        ),
                        //lastname
                        Expanded(
                          flex: 1,
                          child: commonTextField(
                              title: App.pinCode,
                              controller: pinCodeController,
                              hintText: "Enter pincode",
                              textInputType: TextInputType.text),
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: 20,)
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          width: Utils.getDeviceWidth(context),
          margin: EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              backButton(),
              nextButton(),
            ],
          ),
        ),
      ),
    );
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
        ],
      ),
    );
  }

  backButton() {
    return Padding(
        padding: EdgeInsets.only(bottom: 30, top: 30),
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            alignment: Alignment.center,
            height: 50,
            width: Utils.getDeviceWidth(context) / 2.5,
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.all(
                  Radius.circular(30) //         <--- border radius here
                  ),
            ),
            child: Text(
              App.backButton,
              style:
                  TextStyle(color: white, fontFamily: App.font, fontSize: 20),
            ),
          ),
        ));
  }

  nextButton() {
    return Padding(
        padding: EdgeInsets.only(bottom: 30, top: 30),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => IdentifyDetailScreen()));
          },
          child: Container(
            alignment: Alignment.center,
            height: 50,
            width: Utils.getDeviceWidth(context) / 2.5,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.all(
                  Radius.circular(30) //         <--- border radius here
                  ),
            ),
            child: Text(
              App.nextButton,
              style:
                  TextStyle(color: white, fontFamily: App.font, fontSize: 20),
            ),
          ),
        ));
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
