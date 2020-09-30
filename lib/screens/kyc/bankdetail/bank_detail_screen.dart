import 'package:flutter/material.dart';
import 'package:ollapro_partner/common/app.dart';
import 'package:ollapro_partner/common/common_appbar.dart';
import 'package:ollapro_partner/common/common_button.dart';
import 'package:ollapro_partner/common/common_widgets.dart';
import 'package:ollapro_partner/common/header.dart';
import 'package:ollapro_partner/common/utils.dart';
import 'package:ollapro_partner/common/validation.dart';
import 'package:ollapro_partner/screens/kyc/reference/reference_screen.dart';
import 'bank_detail_view_model.dart';

class BankDetailScreen extends StatefulWidget {
  @override
  BankDetailScreenState createState() => BankDetailScreenState();
}

class BankDetailScreenState extends State<BankDetailScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController bankNameController = TextEditingController();
  TextEditingController accountController = TextEditingController();
  TextEditingController account1Controller = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController ifscController = TextEditingController();
  BankDetailViewModel model;
  String selectedAccount;
  bool _autoValidate = false;
  Validation validation;
  final FocusNode f1 = FocusNode();
  final FocusNode f2 = FocusNode();
  final FocusNode f3 = FocusNode();
  final FocusNode f4 = FocusNode();
  final FocusNode f5 = FocusNode();




  @override
  Widget build(BuildContext context) {
    print("runtimeType -> " + runtimeType.toString());
    model ?? (model = BankDetailViewModel(this));
    validation = Validation();
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.topLeft,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  autovalidate: _autoValidate,
                  child: Container(
                    width: Utils.getDeviceWidth(context),
                    margin: EdgeInsets.only(top: 160),
                    child: Column(
                      children: [
                        //bank name
                        commonTextField(
                            title: App.bankName,
                            validation: validation.validateBankName,
                            controller: bankNameController,
                            hintText: "Enter Bank name",
                            focusNode: f1,
                            onFieldChanged: (String term){
                              App.fieldFocusChange(context, f1, f2);
                              return ;
                            },
                            textInputType: TextInputType.text
                        ),
                        SizedBox(height: 10),
                        //account number
                        commonTextField(
                            title: App.accountNumber,
                            validation: validation.validateAccount,
                            controller: accountController,
                            hintText: "Enter Account Number",
                            focusNode: f2,
                            onFieldChanged: (String term){
                              App.fieldFocusChange(context, f2, f3);
                              return ;
                            },
                            textInputType: TextInputType.phone
                        ),SizedBox(height: 10),
                        //account number
                        commonTextField(
                            title: App.account1Number,
                            validation: validation.validateReAccount,
                            controller: account1Controller,
                            hintText: "Re enter Account Number",
                            focusNode: f3,
                            onFieldChanged: (String term){
                              App.fieldFocusChange(context, f3, f4);
                              return ;
                            },
                            textInputType: TextInputType.phone
                        ),SizedBox(height: 10),
                        //account holder name
                        commonTextField(
                            title: App.nameOfHolder,
                            validation: validation.validateAccountHolderName,
                            controller: nameController,
                            hintText: "Account holder name",
                            focusNode: f4,
                            onFieldChanged: (String term){
                              App.fieldFocusChange(context, f4, f5);
                              return ;
                            },
                            textInputType: TextInputType.text
                        ),SizedBox(height: 10),
                        accountTypeField(),
                        //ifsc code
                        commonTextField(
                            title: App.ifscCode,
                            validation: validation.validateIFSC,
                            controller: ifscController,
                            hintText: "Enter IFSC code",
                            focusNode: f5,
                            textInputType: TextInputType.text
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
                    appBarKYC(context,MaterialPageRoute(builder: (context)=> ReferenceScreen())),
                    HeaderLine.headerLineComplete(context, 3, 3, 3, 1, 2, 2),
                    bankDetailText(),
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
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ReferenceScreen()));
    } else {
      setState(() {
        _autoValidate = true;
        Utils.showToast("Please enter details");
      });
    }
  }
  bankDetailText() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 15, top: 20),
      child: Text(
        App.bankDetail,
        style: TextStyle(
            fontSize: 20,
            color: primaryColor,
            fontWeight: FontWeight.bold,
            fontFamily: App.font),
      ),
    );
  }
  accountText() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 15, top: 20),
      child: Text(
        App.accountNumber,
        style: TextStyle(
            fontSize: 16, color: secondaryColor, fontFamily: App.font),
      ),
    );
  }
  accountTypeField() {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(left: 15, top: 15),
          child: Text(
            App.accountType,
            style: TextStyle(
                fontSize: 17, color: secondaryColor, fontFamily: App.font),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15, right: 15),
          child:DropdownButtonFormField<String>(
            value: selectedAccount,
            hint: Text(
              'Select title',
            ),
            onChanged: (salutation) =>
                setState(() => selectedAccount = salutation),
            validator: (value) => value == null ? 'Select Account type' : null,
            items:
            ['Current', 'Saving'].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

}
