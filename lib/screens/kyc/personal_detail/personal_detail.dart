import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ollapro_partner/common/app.dart';
import 'package:ollapro_partner/common/common_widgets.dart';
import 'package:ollapro_partner/common/dropdown.dart';
import 'package:ollapro_partner/common/header.dart';
import 'package:ollapro_partner/common/utils.dart';
import 'package:ollapro_partner/screens/kyc/contact_detail/contact_detail_screen.dart';

class PersonalDetailScreen extends StatefulWidget {
  final bool editScreen;

  const PersonalDetailScreen({Key key, this.editScreen}) : super(key: key);

  @override
  PersonalDetailScreenState createState() => PersonalDetailScreenState();
}

class PersonalDetailScreenState extends State<PersonalDetailScreen> {
  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController mNameController = TextEditingController();
  TextEditingController fatherNameController = TextEditingController();
  String titleActivity;
  String genderActivity;
  String languageActivity;
  DateTime _dateTime;
  String pickedDate;
  String dateFormatted;
  String dateCheck = "Select Date";
  String title, gender, language;

  @override
  void initState() {
    super.initState();
    titleActivity = '';
    title = '';
    genderActivity = '';
    gender = '';
    languageActivity = '';
    language = '';
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
            dateCheck = pickedDate;
          });
        } else {
          print("Current date to before date not selected.");
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            child: Container(
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  appBarKYC(context,MaterialPageRoute(builder: (context)=> ContactDetailScreen())),
                  HeaderLine.headerLineComplete(context, 1, 2, 2, 2, 2, 2),
                  personalDetailText(),
                  titleField(),
                  //firstName
                  commonTextField(
                      title: App.fName,
                      controller: fNameController,
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
                              controller: mNameController,
                              hintText: "Enter Middle Name",
                              textInputType: TextInputType.text),
                        ),
                        //lastname
                        Expanded(
                          flex: 1,
                          child: commonTextField(
                              title: App.lName,
                              controller: lNameController,
                              hintText: "Enter last Name",
                              textInputType: TextInputType.text),
                        ),
                      ],
                    ),
                  ),
                  dateField(),
                  SizedBox(
                    height: 10,
                  ),
                  genderField(),
                  languageField(),
                  //fathers name
                  commonTextField(
                      title: App.fatherName,
                      controller: fatherNameController,
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
        bottomNavigationBar: nextButton(),
      ),
    );
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
          child: DropDownFormField(
            hintText: 'Select title',
            value: titleActivity,
            onSaved: (value) {
              setState(() {
                titleActivity = value;
              });
            },
            onChanged: (value) {
              setState(() {
                titleActivity = value;
              });
            },
            dataSource: [
              {
                "display": "Mr.",
                "value": "Mr.",
              },
              {
                "display": "Mrs.",
                "value": "Mrs.",
              },
            ],
            textField: 'display',
            valueField: 'value',
          ),
        ),
        Container(
          //padding: EdgeInsets.all(16),
          child: Text(title),
        )
      ],
    );
  }
  dateField() {
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
          padding: EdgeInsets.all(8.0),
          height: 55,
          margin: EdgeInsets.only(left: 15, right: 15),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: secondaryColor),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  child: Text(
                dateCheck,
                style: TextStyle(color: primaryColor, fontFamily: App.font),
              )),
              GestureDetector(
                  onTap: () {
                    openDatePicker();
                  },
                  child: Image.asset(
                    App.calendarLogo,
                    height: 20,
                    width: 20,
                  )),
            ],
          ),
        ),
      ],
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
          child: DropDownFormField(
            hintText: 'Select gender',
            value: genderActivity,
            onSaved: (value) {
              setState(() {
                genderActivity = value;
              });
            },
            onChanged: (value) {
              setState(() {
                genderActivity = value;
              });
            },
            dataSource: [
              {
                "display": "Male",
                "value": "Male",
              },
              {
                "display": "Female",
                "value": "Female",
              },
            ],
            textField: 'display',
            valueField: 'value',
          ),
        ),
        Container(
          //padding: EdgeInsets.all(16),
          child: Text(gender),
        )
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
          child: DropDownFormField(
            hintText: 'Select Number of language known',
            value: languageActivity,
            onSaved: (value) {
              setState(() {
                languageActivity = value;
              });
            },
            onChanged: (value) {
              setState(() {
                languageActivity = value;
              });
            },
            dataSource: [
              {
                "display": "1",
                "value": "1",
              },
              {
                "display": "2",
                "value": "2",
              },
              {
                "display": "3",
                "value": "3",
              },
              {
                "display": "4",
                "value": "4",
              },
            ],
            textField: 'display',
            valueField: 'value',
          ),
        ),
        Container(
          //padding: EdgeInsets.all(16),
          child: Text(language),
        )
      ],
    );
  }
  nextButton() {
    return Padding(
        padding: EdgeInsets.only(bottom: 30, top: 30),
        child: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ContactDetailScreen()));
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
              App.nextButton,
              style:
                  TextStyle(color: white, fontFamily: App.font, fontSize: 20),
            ),
          ),
        ));
  }
}
