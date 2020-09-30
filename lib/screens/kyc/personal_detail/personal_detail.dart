
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ollapro_partner/common/app.dart';
import 'package:ollapro_partner/common/common_appbar.dart';
import 'package:ollapro_partner/common/common_button.dart';
import 'package:ollapro_partner/common/common_widgets.dart';
import 'package:ollapro_partner/common/header.dart';
import 'package:ollapro_partner/common/utils.dart';
import 'package:ollapro_partner/common/validation.dart';
import 'package:ollapro_partner/screens/kyc/contact_detail/contact_detail_screen.dart';
import 'package:ollapro_partner/screens/kyc/personal_detail/personal_detail_screen_view_model.dart';

class PersonalDetailScreen extends StatefulWidget {
  final bool editScreen;

  const PersonalDetailScreen({Key key, this.editScreen}) : super(key: key);

  @override
  PersonalDetailScreenState createState() => PersonalDetailScreenState();
}

class PersonalDetailScreenState extends State<PersonalDetailScreen>   {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController mNameController = TextEditingController();
  TextEditingController fatherNameController = TextEditingController();
  final FocusNode f1 = FocusNode();
  final FocusNode f2 = FocusNode();
  final FocusNode f3 = FocusNode();
  final FocusNode f4 = FocusNode();
  final FocusNode f5 = FocusNode();

  DateTime _dateTime;
  String pickedDate;
  String dateCheck = "Select Date";
  bool _autoValidate = false;
  Validation validation;
  String selectedTitle;
  String selectedGender;
  String selectedLanguage;

  PersonalDetailScreenViewModel model;


  @override
  Widget build(BuildContext context) {
    print("runtimeType -> " + runtimeType.toString());
    model ?? (model = PersonalDetailScreenViewModel(this));

    validation = Validation();
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.topLeft,
          child: Stack(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Form(
                  autovalidate: _autoValidate,
                  key: _formKey,
                  child: Container(
                    width: Utils.getDeviceWidth(context),
                    margin: EdgeInsets.only(top: 160),
                    //height: Utils.getDeviceHeight(context) / 1.8,
                    child: Column(
                      children: [
                        titleField(),
                        //firstName
                        commonTextField(
                            title: App.fName,
                            validation: validation.validateFirstName,
                            controller: fNameController,
                            focusNode: f1,
                            textInputAction: TextInputAction.next,
                            onFieldChanged: (String term){
                              App.fieldFocusChange(context, f1, f2);
                              return ;
                            },
                            hintText: "Enter First Name",
                            textInputType: TextInputType.text),
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
                                    focusNode: f2,
                                    textInputAction: TextInputAction.next,
                                    onFieldChanged: (String term){
                                      App.fieldFocusChange(context, f2, f3);
                                      return ;
                                    },
                                    hintText: "Enter Middle Name",
                                    textInputType: TextInputType.text),
                              ),
                              //lastname
                              Expanded(
                                flex: 1,
                                child: commonTextField(
                                    title: App.lName,
                                    validation: validation.validateLastName,
                                    focusNode: f3,
                                    onFieldChanged: (String term){
                                      App.fieldFocusChange(context, f3, f4);
                                      return ;
                                    },
                                    textInputAction: TextInputAction.next,
                                    controller: lNameController,
                                    hintText: "Enter last Name",
                                    textInputType: TextInputType.text),
                              ),
                            ],
                          ),
                        ),

                        //dob field
                        dobField(),

                        SizedBox(
                          height: 10,
                        ),
                        genderField(),
                        languageField(),
                        //fathers name
                        commonTextField(
                            title: App.fatherName,
                            validation: validation.validateFatherName,
                            controller: fatherNameController,
                            focusNode: f5,
                            textInputAction: TextInputAction.done,
                            hintText: "Enter father's Name",
                            textInputType: TextInputType.text),
                        SizedBox(
                          height: 20,
                        ),
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
                            builder: (context) => ContactDetailScreen())),
                    HeaderLine.headerLineComplete(context, 1, 2, 2, 2, 2, 2),
                    personalDetailText(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar:  // resend button
      commonButton(context,
          onPressed: _validateInputs,
          buttonName: App.nextButton),
    );
  }
  openDatePicker() {
    DateTime currentDate = DateTime.now();
    print(currentDate);
    showDatePicker(
        context: context,
        initialDate: _dateTime == null ? DateTime.now() : _dateTime,
        firstDate: DateTime(1950),
        lastDate: DateTime(2022))
        .then((getDate) {
      setState(() {
        if (getDate != null) {
          var formatter = DateFormat('dd-MM-yyyy');
          _dateTime = getDate;
          pickedDate = formatter.format(_dateTime);
          setState(() {
            dobController.text = pickedDate;
          });
        } else {
          print("Current date to before date not selected.");
        }
      });
    });
  }

  void _validateInputs() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => ContactDetailScreen()));
    } else {
      setState(() {
        _autoValidate = true;
        Utils.showToast("Please enter details");
      });
    }
  }


  personalDetailText() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 15, top: 20),
      child: Text(
        App.personalDetail,
        style: TextStyle(
            fontSize: 22,
            color: primaryColor,
            fontWeight: FontWeight.bold,
            fontFamily: App.font),
      ),
    );
  }

  titleField() {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(left: 15, top: 15),
          child: Text(
            App.title,
            style: TextStyle(
                fontSize: 17, color: secondaryColor, fontFamily: App.font),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15, right: 15),
          child: DropdownButtonFormField<String>(
            value: selectedTitle,
            hint: Text(
              'Select title',
            ),
            onChanged: (salutation) =>
                setState(() => selectedTitle = salutation),
            validator: (value) => value == null ? 'Select title here' : null,
            items: ['MR.', 'MS.'].map<DropdownMenuItem<String>>((String value) {
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

  dobField() {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(left: 15, top: 15, right: 115),
          child: Text(
            App.dob,
            style: TextStyle(
                fontSize: 17, color: secondaryColor, fontFamily: App.font),
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(left: 15, right: 15),
          child: TextFormField(
            controller: dobController,
            textInputAction: TextInputAction.next,
            focusNode: f4,
            onFieldSubmitted: (String term){
              App.fieldFocusChange(context, f4, f5);
            },
            validator: validation.validateDob,
            onTap: () {
              openDatePicker();
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            decoration: InputDecoration(
              hintText: "Select date",
              suffixIcon: GestureDetector(
                  onTap: () {
                    openDatePicker();
                  },
                  child: Image.asset(
                    App.calendarLogo,
                    height: 20,
                    width: 20,
                  )),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: secondaryColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  textFiledDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      contentPadding: EdgeInsets.only(right: 50, left: 20),
      suffixIcon: GestureDetector(
          onTap: () {
            openDatePicker();
          },
          child: Image.asset(
            App.calendarLogo,
            height: 20,
            width: 20,
          )),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: secondaryColor,
        ),
      ),
    );
  }


  genderField() {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(left: 15, top: 15),
          child: Text(
            App.gender,
            style: TextStyle(
                fontSize: 17, color: secondaryColor, fontFamily: App.font),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15, right: 15),
          child: DropdownButtonFormField<String>(
            value: selectedGender,
            hint: Text(
              'Select title',
            ),
            onChanged: (salutation) =>
                setState(() => selectedGender = salutation),
            validator: (value) => value == null ? 'Select gender here' : null,
            items: ['Male', 'Female']
                .map<DropdownMenuItem<String>>((String value) {
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

  languageField() {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(left: 15, top: 15),
          child: Text(
            App.language,
            style: TextStyle(
                fontSize: 17, color: secondaryColor, fontFamily: App.font),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15, right: 15),
          child: DropdownButtonFormField<String>(
            value: selectedLanguage,
            hint: Text(
              'Select title',
            ),
            onChanged: (salutation) =>
                setState(() => selectedLanguage = salutation),
            validator: (value) => value == null ? 'Select Language here' : null,
            items: ['1', '2', '3', '4']
                .map<DropdownMenuItem<String>>((String value) {
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
