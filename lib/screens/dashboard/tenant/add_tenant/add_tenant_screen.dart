import 'package:flutter/material.dart';
import 'package:ollapro_partner/common/app.dart';
import 'package:ollapro_partner/common/common_widgets.dart';
import 'package:ollapro_partner/common/utils.dart';
import 'package:ollapro_partner/common/validation.dart';
import 'package:ollapro_partner/screens/dashboard/tenant/add_tenant/add_tenant_screen_view_model.dart';

class AddTenantScreen extends StatefulWidget {
  @override
  AddTenantScreenState createState() => AddTenantScreenState();
}

class AddTenantScreenState extends State<AddTenantScreen> {
  AddTenantScreenViewModel model;
  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController mNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController(text: "+91");
  TextEditingController aadharController = TextEditingController();
  TextEditingController add1Controller = TextEditingController();
  TextEditingController add2Controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  Validation validation;

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

  @override
  Widget build(BuildContext context) {
    print("runtimeType -> " + runtimeType.toString());
    model ?? (model = AddTenantScreenViewModel(this));
    validation = Validation();
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: primaryColor,
          child: Stack(
            children: [
              appBarDash(context, App.addTenantTitle),
              Container(
                height: Utils.getDeviceHeight(context),
                width: Utils.getDeviceWidth(context),
                margin: EdgeInsets.only(top: 55),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25)),
                    color: white),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    autovalidate: _autoValidate,
                    child: Column(
                      children: [
                        SizedBox(height: 10,),
                        //firstName
                        commonTextField(
                            title: App.fName,
                            validation: validation.validateFirstName,
                            controller: fNameController,
                            hintText: "Enter First Name",
                            textInputType: TextInputType.text),
                        SizedBox(height: 10,),
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
                                    title: App.mName,
                                    validation: validation.validateMiddleName,
                                    controller: mNameController,
                                    hintText: "Enter Middle Name",
                                    textInputType: TextInputType.text),
                              ),
                              //lastname
                              Expanded(
                                flex: 1,
                                child: commonTextField(
                                    title: App.lName,
                                    validation: validation.validateLastName,
                                    controller: lNameController,
                                    hintText: "Enter last Name",
                                    textInputType: TextInputType.text),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),
                        //email
                        commonTextField(
                            title: App.emailAddress,
                            validation: validation.validateEmail,
                            controller: emailController,
                            hintText: "Enter Email",
                            textInputType: TextInputType.emailAddress
                        ),
                        SizedBox(height: 10),
                        //phone number
                        commonTextField(
                            title: App.mobileNumber,
                            validation: validation.validatePhone,
                            controller: phoneController,
                            hintText: "Enter Phone NUmber",
                            textInputType: TextInputType.phone),
                        SizedBox(height: 10),
                        //aadhar card
                        commonTextField(
                            title: App.aadhar,
                            validation: validation.validateAadhar,
                            controller: aadharController,
                            hintText: "Enter Aadhar NUmber",
                            textInputType: TextInputType.phone
                        ),SizedBox(height: 10,),
                        // address
                        commonTextField(
                            title: App.communicationAddress,
                            controller: add1Controller,
                            validation: validation.validateAddress1Name,
                            hintText: "Enter Address 1",
                            textInputType: TextInputType.text),
                        add2Field(),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: submitButton(),
    );
  }
  submitButton() {
    return Padding(
        padding: EdgeInsets.only(bottom: 10, top: 10),
        child: InkWell(
          onTap: () {
            _validateInputs();
            /* Navigator.push(context, MaterialPageRoute(builder: (context)=> AddLandLordScreen()));*/
          },
          child: Container(
            margin: EdgeInsets.only(left: 10, right: 10),
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
              App.submitButton,
              style:
              TextStyle(color: white, fontFamily: App.font, fontSize: 20),
            ),
          ),
        ));
  }
  appBar() {
    return Container(
      margin: EdgeInsets.only(left: 10, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    App.arrowBack,
                    color: white,
                    height: 25,
                    width: 25,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(
                  App.addTenantTitle,
                  style: TextStyle(
                      color: white, fontFamily: App.font, fontSize: 20),
                ),
              ),
            ],
          ),
          Container(
              margin: EdgeInsets.only(right: 10),
              child: GestureDetector(
                onTap: () {},
                child: Image.asset(
                  App.notificationLogo,
                  height: 25,
                  width: 25,
                ),
              )),
        ],
      ),
    );
  }
  firstNameText() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 15, top: 20),
      child: Text(
        App.fName,
        style: TextStyle(
            fontSize: 17, color: secondaryColor, fontFamily: App.font),
      ),
    );
  }
  firstNameFeild() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 15, right: 15),
      child: TextFormField(
        controller: fNameController,
        decoration: InputDecoration(
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: secondaryColor,
            ),
          ),
          hintText: "Enter First Name here",
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
  middleName() {
    return Container(
      width: Utils.getDeviceWidth(context) / 2,
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: 15, top: 10),
            child: Text(
              App.mName,
              style: TextStyle(
                  fontSize: 17, color: secondaryColor, fontFamily: App.font),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: 15, right: 15),
            child: TextFormField(
              controller: mNameController,
              decoration: InputDecoration(
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: secondaryColor,
                  ),
                ),
                hintText: "Enter Middle Name here",
                hintStyle: TextStyle(
                  color: secondaryColor,
                  fontFamily: App.font,
                ),
              ),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
            ),
          ),
        ],
      ),
    );
  }
  lastName() {
    return Container(
      width: Utils.getDeviceWidth(context) / 2,
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: 15, top: 10),
            child: Text(
              App.lName,
              style: TextStyle(
                  fontSize: 17, color: secondaryColor, fontFamily: App.font),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: 15, right: 15),
            child: TextFormField(
              controller: lNameController,
              decoration: InputDecoration(
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: secondaryColor,
                  ),
                ),
                hintText: "Enter Last Name here",
                hintStyle: TextStyle(
                  color: secondaryColor,
                  fontFamily: App.font,
                ),
              ),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
            ),
          ),
        ],
      ),
    );
  }
  emailText() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 15, top: 15),
      child: Text(
        App.emailAddress,
        style: TextStyle(
            fontSize: 16, color: secondaryColor, fontFamily: App.font),
      ),
    );
  }
  emailField() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 15, right: 15),
      child: TextFormField(
        controller: emailController,
        decoration: InputDecoration(
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: secondaryColor,
            ),
          ),
          prefixIcon: Image.asset(
            App.emailLogo,
            height: 20,
            width: 20,
          ),
          hintText: "Enter Email address",
          hintStyle: TextStyle(
            color: secondaryColor,
            fontFamily: App.font,
          ),
        ),
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
      ),
    );
  }
  phoneText() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 15, top: 15),
      child: Text(
        App.mobileNumber,
        style: TextStyle(
            fontSize: 16, color: secondaryColor, fontFamily: App.font),
      ),
    );
  }
  phoneField() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 15, right: 15),
      child: TextFormField(
        controller: phoneController,
        decoration: InputDecoration(
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: secondaryColor,
            ),
          ),
          prefixIcon: Image.asset(
            App.mobileLogo,
            height: 20,
            width: 20,
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
  aadharText() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 15, top: 20),
      child: Text(
        App.aadhar,
        style: TextStyle(
            fontSize: 16, color: secondaryColor, fontFamily: App.font),
      ),
    );
  }
  aadharField() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 15, right: 15),
      child: TextFormField(
        style: TextStyle(color: primaryColor,fontFamily: App.font),
        controller: aadharController,
        decoration: InputDecoration(
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: secondaryColor,
            ),
          ),
          hintText: "Enter Aadhar Number",
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
  commText() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 15, top: 15),
      child: Text(
        App.address,
        style: TextStyle(
            fontSize: 16, color: secondaryColor, fontFamily: App.font),
      ),
    );
  }
  add1Field() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 15, right: 15),
      child: TextFormField(
        controller: add1Controller,
        style: TextStyle(color: primaryColor,fontFamily: App.font),
        decoration: InputDecoration(
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: secondaryColor,
            ),
          ),
          hintText: "Enter Address1",
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
  add2Field() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 15, right: 15,bottom: 10),
      child: TextFormField(
        style: TextStyle(color: primaryColor,fontFamily: App.font),
        controller: add2Controller,
        validator: validation.validateAddress1Name,
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
}
