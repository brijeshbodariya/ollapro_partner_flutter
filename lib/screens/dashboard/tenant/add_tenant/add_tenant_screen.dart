import 'package:flutter/material.dart';
import 'package:ollapro_partner/common/app.dart';
import 'package:ollapro_partner/common/common_appbar.dart';
import 'package:ollapro_partner/common/common_button.dart';
import 'package:ollapro_partner/common/common_widgets.dart';
import 'package:ollapro_partner/common/utils.dart';
import 'package:ollapro_partner/common/validation.dart';
import 'package:ollapro_partner/screens/dashboard/tenant/add_tenant/add_tenant_screen_view_model.dart';

class AddTenantScreen extends StatefulWidget {
  @override
  AddTenantScreenState createState() => AddTenantScreenState();
}

class AddTenantScreenState extends State<AddTenantScreen>  with SingleTickerProviderStateMixin{
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
  AnimationController _controller;
  Animation<double> _animation;
  final FocusNode f1 = FocusNode();
  final FocusNode f2 = FocusNode();
  final FocusNode f3 = FocusNode();
  final FocusNode f4 = FocusNode();
  final FocusNode f5 = FocusNode();
  final FocusNode f6 = FocusNode();
  final FocusNode f7 = FocusNode();
  final FocusNode f8 = FocusNode();
  @override
  void initState() {
    _controller = AnimationController(
        duration: const Duration(milliseconds: 1500), vsync: this, value: 0.1);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.bounceInOut);

    _controller.forward();
    super.initState();
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
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
                margin: EdgeInsets.only(top: 60),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25)),
                    color: white),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    autovalidate: _autoValidate,
                    child: ScaleTransition(
                      scale: _animation,
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          //firstName
                          commonTextField(
                              title: App.fName,
                              validation: validation.validateFirstName,
                              controller: fNameController,
                              hintText: "Enter First Name",
                              focusNode: f1,
                              textInputAction: TextInputAction.next,
                              onFieldChanged: (String term){
                                App.fieldFocusChange(context, f1, f2);
                                return ;
                              },
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
                                      focusNode: f2,
                                      textInputAction: TextInputAction.next,
                                      onFieldChanged: (String term){
                                        App.fieldFocusChange(context, f2, f3);
                                        return ;
                                      },
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
                                      textInputAction: TextInputAction.next,
                                      focusNode: f3,
                                      onFieldChanged: (String term){
                                        App.fieldFocusChange(context, f3, f4);
                                        return ;
                                      },
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
                              textInputAction: TextInputAction.next,
                              focusNode: f4,
                              onFieldChanged: (String term){
                                App.fieldFocusChange(context, f4, f5);
                                return ;
                              },
                              textInputType: TextInputType.emailAddress
                          ),
                          SizedBox(height: 10),
                          //phone number
                          commonTextField(
                              title: App.mobileNumber,
                              validation: validation.validatePhone,
                              controller: phoneController,
                              hintText: "Enter Phone Number",
                              textInputAction: TextInputAction.next,
                              focusNode: f5,
                              onFieldChanged: (String term){
                                App.fieldFocusChange(context, f5, f6);
                                return ;
                              },
                              textInputType: TextInputType.phone),
                          SizedBox(height: 10),
                          //aadhar card
                          commonTextField(
                              title: App.aadhar,
                              validation: validation.validateAadhar,
                              controller: aadharController,
                              hintText: "Enter Aadhar Number",
                              textInputAction: TextInputAction.next,
                              focusNode: f6,
                              onFieldChanged: (String term){
                                App.fieldFocusChange(context, f6, f7);
                                return ;
                              },
                              textInputType: TextInputType.phone
                          ),SizedBox(height: 10,),
                          // address
                          commonTextField(
                              title: App.communicationAddress,
                              controller: add1Controller,
                              validation: validation.validateAddress1Name,
                              hintText: "Enter Address 1",
                              focusNode: f7,
                              textInputAction: TextInputAction.next,
                              onFieldChanged: (String term){
                                App.fieldFocusChange(context, f7, f8);
                                return ;
                              },
                              textInputType: TextInputType.text),
                          add2Field(),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(top: 10),
        child: commonButton(context,
          onPressed: _validateInputs,
          buttonName: App.submitButton,
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
        focusNode: f8,
        textInputAction: TextInputAction.done,
      ),
    );
  }
}
