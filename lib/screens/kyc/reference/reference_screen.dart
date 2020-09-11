import 'package:flutter/material.dart';
import 'package:ollapro_partner/common/app.dart';
import 'package:ollapro_partner/common/header.dart';
import 'package:ollapro_partner/common/utils.dart';
import 'package:ollapro_partner/screens/kyc/reference/reference_view_model.dart';
import 'package:ollapro_partner/screens/kyc/upload_document/uploaddocument.dart';

class ReferenceScreen extends StatefulWidget {
  @override
  ReferenceScreenState createState() => ReferenceScreenState();
}

class ReferenceScreenState extends State<ReferenceScreen> {
  ReferenceViewModel model;
  TextEditingController nameController = TextEditingController();
  TextEditingController name1Controller = TextEditingController();
  TextEditingController placeController = TextEditingController();
  TextEditingController place1Controller = TextEditingController();
  TextEditingController phoneController = TextEditingController(text: "+91");
  TextEditingController phone1Controller = TextEditingController(text: "+91");

  @override
  Widget build(BuildContext context) {
    print("runtimeType -> " + runtimeType.toString());
    model ?? (model = ReferenceViewModel(this));

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            child: Container(
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  appBar(),
                  HeaderLine.headerLineComplete(context, 3, 3, 3, 3, 1, 2),
                  referenceDetailText(),
                  reference1Text(),
                  Container(
                    color: white,
                    child: Column(
                      children: [
                        nameText(),
                        nameField(),
                        placeText(),
                        placeField(),
                        phoneText(),
                        phoneField(),
                      ],
                    ),
                  ),
                  reference2Text(),
                  Container(
                    color: white,
                    child: Column(
                      children: [
                        name1Text(),
                        name1Field(),
                        place1Text(),
                        place1Field(),
                        phone1Text(),
                        phone1Field(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: bottomButton(),
      ),
    );
  }

  bottomButton() {
    return Container(
      width: Utils.getDeviceWidth(context),
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          backButton(),
          nextButton(),
        ],
      ),
    );
  }

  appBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 12, top: 10),
              child: InkWell(
                child: Image.asset(
                  App.backButtonLogo,
                  height: 50,
                  width: 50,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, top: 10),
              alignment: Alignment.center,
              child: Text(
                App.completeYourKyc,
                style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            )
          ],
        ),
        Container(
          margin: EdgeInsets.only(right: 15, top: 10),
          alignment: Alignment.center,
          child: Text(
            App.skip,
            style: TextStyle(
                color: primaryColor, fontWeight: FontWeight.bold, fontSize: 15),
          ),
        )
      ],
    );
  }

  referenceDetailText() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 15, top: 20),
      child: Text(
        App.referenceDetail,
        style: TextStyle(
            fontSize: 20,
            color: primaryColor,
            fontWeight: FontWeight.bold,
            fontFamily: App.font),
      ),
    );
  }
  reference1Text() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 15, top: 20,bottom: 5),
      child: Text(
        App.reference1,
        style: TextStyle(
            fontSize: 19,
            color: primaryColor,
            fontWeight: FontWeight.bold,
            fontFamily: App.font),
      ),
    );
  }
  reference2Text() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 15, top: 10,bottom: 10),
      child: Text(
        App.reference2,
        style: TextStyle(
            fontSize: 19,
            color: primaryColor,
            fontWeight: FontWeight.bold,
            fontFamily: App.font),
      ),
    );
  }
  nameText() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 15, top: 5),
      child: Text(
        App.name,
        style: TextStyle(
            fontSize: 16, color: secondaryColor, fontFamily: App.font),
      ),
    );
  }

  nameField() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 15, right: 15),
      child: TextFormField(
        style: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.bold,
            fontFamily: App.font),
        controller: nameController,
        decoration: InputDecoration(
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: secondaryColor,
            ),
          ),
          hintText: "Enter Name",
          hintStyle: TextStyle(
            color: grey,
            fontFamily: App.font,
          ),
        ),
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
      ),
    );
  }
  placeText() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 15, top: 20),
      child: Text(
        App.place,
        style: TextStyle(
            fontSize: 16, color: secondaryColor, fontFamily: App.font),
      ),
    );
  }

  placeField() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 15, right: 15),
      child: TextFormField(
        style: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.bold,
            fontFamily: App.font),
        controller: placeController,
        decoration: InputDecoration(
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: secondaryColor,
            ),
          ),
          hintText: "Enter place here",
          hintStyle: TextStyle(
            color: grey,
            fontFamily: App.font,
          ),
        ),
        keyboardType: TextInputType.text,
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
      margin: EdgeInsets.only(left: 15, right: 15,bottom: 15),
      child: TextFormField(
        controller: phoneController,
        style: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.bold,
            fontFamily: App.font),
        decoration: InputDecoration(
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: secondaryColor,
            ),
          ),
          hintText: "Enter Mobile Number",
          hintStyle: TextStyle(
            color: grey,
            fontFamily: App.font,
          ),
        ),
        keyboardType: TextInputType.phone,
        textInputAction: TextInputAction.next,
      ),
    );
  }
  name1Text() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 15, top: 5),
      child: Text(
        App.name,
        style: TextStyle(
            fontSize: 16, color: secondaryColor, fontFamily: App.font),
      ),
    );
  }

  name1Field() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 15, right: 15),
      child: TextFormField(
        style: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.bold,
            fontFamily: App.font),
        controller: name1Controller,
        decoration: InputDecoration(
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: secondaryColor,
            ),
          ),
          hintText: "Enter Name",
          hintStyle: TextStyle(
            color: grey,
            fontFamily: App.font,
          ),
        ),
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
      ),
    );
  }
  place1Text() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 15, top: 20),
      child: Text(
        App.place,
        style: TextStyle(
            fontSize: 16, color: secondaryColor, fontFamily: App.font),
      ),
    );
  }

  place1Field() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 15, right: 15),
      child: TextFormField(
        style: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.bold,
            fontFamily: App.font),
        controller: place1Controller,
        decoration: InputDecoration(
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: secondaryColor,
            ),
          ),
          hintText: "Enter place here",
          hintStyle: TextStyle(
            color: grey,
            fontFamily: App.font,
          ),
        ),
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
      ),
    );
  }
  phone1Text() {
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

  phone1Field() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 15, right: 15,bottom: 15),
      child: TextFormField(
        controller: phone1Controller,
        style: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.bold,
            fontFamily: App.font),
        decoration: InputDecoration(
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: secondaryColor,
            ),
          ),
          hintText: "Enter Mobile Number",
          hintStyle: TextStyle(
            color: grey,
            fontFamily: App.font,
          ),
        ),
        keyboardType: TextInputType.phone,
        textInputAction: TextInputAction.next,
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
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => UploadDocument()));
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
}
