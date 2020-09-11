import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ollapro_partner/common/app.dart';
import 'package:ollapro_partner/common/header.dart';
import 'package:ollapro_partner/common/utils.dart';
import 'package:ollapro_partner/screens/kyc/reference/reference_screen.dart';
import 'package:ollapro_partner/screens/kyc/upload_document/upload_document_view_model.dart';

class UploadDocument extends StatefulWidget {
  @override
  UploadDocumentState createState() => UploadDocumentState();
}

class UploadDocumentState extends State<UploadDocument> {
  UploadDocumentViewModel model;
  File image1;
  File image2;
  File image3;
  File image4;
  File image5;
  File image6;
  File image7;
  String file1="Select photo1";
  String file2="Select photo2";
  String file3="Select aadhar front";
  String file4="Select aadhar back";
  String file5="Select aadhar front";
  String file6="Select aadhar front";
  String file7="Select aadhar front";

  _getPhoto1() async {
    PickedFile pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        image1 = File(pickedFile.path);
        file1 = image1.path.split('/').last;
      });
    }
  }

  _getPhoto2() async {
    PickedFile pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        image2 = File(pickedFile.path);
        file2 = image2.path.split('/').last;
      });
    }
  }

  _getPhoto3() async {
    PickedFile pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        image3 = File(pickedFile.path);
        file3 = image3.path.split('/').last;
      });
    }
  }
  _getPhoto4() async {
    PickedFile pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        image4 = File(pickedFile.path);
        file4 = image4.path.split('/').last;
      });
    }
  }
  _getPhoto5() async {
    PickedFile pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        image5 = File(pickedFile.path);
        file5 = image5.path.split('/').last;
      });
    }
  }
  _getPhoto6() async {
    PickedFile pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        image6 = File(pickedFile.path);
        file6 = image6.path.split('/').last;
      });
    }
  }
  _getPhoto7() async {
    PickedFile pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        image7 = File(pickedFile.path);
        file7 = image7.path.split('/').last;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print("runtimeType -> " + runtimeType.toString());
    model ?? (model = UploadDocumentViewModel(this));

    return SafeArea(
      child: Scaffold(
        body: Form(
          child: Container(
            alignment: Alignment.topLeft,
            child: Column(
              children: [
                appBar(),
                HeaderLine.headerLineComplete(context, 3, 3, 3, 3, 3, 1),
                uploadDocumentText(),
                Container(
                  height: Utils.getDeviceHeight(context)/ 1.7,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      photo1Text(),
                      photo1Field(),
                      photo2Text(),
                      photo2Field(),
                      aadharFrontText(),
                      aadharFrontField(),
                      aadharBackText(),
                      aadharBackField(),
                      panText(),
                      panField(),
                      chequeText(),
                      chequeField(),
                      selfText(),
                      selfField(),
                    ],
                  ),
                )

              ],
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
      child: submitButton(),
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

  uploadDocumentText() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 15, top: 20),
      child: Text(
        App.uploadDocument,
        style: TextStyle(
            fontSize: 20,
            color: primaryColor,
            fontWeight: FontWeight.bold,
            fontFamily: App.font),
      ),
    );
  }

  photo1Text() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 15, top: 15, right: 15),
      child: Text(
        App.photo1,
        style: TextStyle(
            fontSize: 17, color: secondaryColor, fontFamily: App.font),
      ),
    );
  }

  photo1Field() {
    return Container(
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
          image1 != null
              ? Flexible(
                  child: Text(
                  file1,
                  maxLines: 2,
                  style: TextStyle(color: primaryColor, fontFamily: App.font),
                ))
              : Container(),
          Container(
            padding: EdgeInsets.only(left: 10),
            child: RaisedButton(
              onPressed: _getPhoto1,
              child: Text(App.chooseFile),
            ),
          ),
        ],
      ),
    );
  }

  photo2Text() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 15, top: 15, right: 15),
      child: Text(
        App.photo2,
        style: TextStyle(
            fontSize: 17, color: secondaryColor, fontFamily: App.font),
      ),
    );
  }

  photo2Field() {
    return Container(
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
          image2 != null
              ? Flexible(
                  child: Text(
                  file2,
                  maxLines: 2,
                  style: TextStyle(color: primaryColor, fontFamily: App.font),
                ))
              : Container(),
          Container(
            padding: EdgeInsets.only(left: 10),
            child: RaisedButton(
              onPressed: _getPhoto2,
              child: Text(App.chooseFile),
            ),
          ),
        ],
      ),
    );
  }

  aadharFrontText() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 15, top: 15, right: 15),
      child: Text(
        App.aadharFront,
        style: TextStyle(
            fontSize: 17, color: secondaryColor, fontFamily: App.font),
      ),
    );
  }

  aadharFrontField() {
    return Container(
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
          image3 != null
              ? Flexible(
              child: Text(
                file3,
                maxLines: 2,
                style: TextStyle(color: primaryColor, fontFamily: App.font),
              ))
              : Container(),
          Container(
            padding: EdgeInsets.only(left: 10),
            child: RaisedButton(
              onPressed: _getPhoto3,
              child: Text(App.chooseFile),
            ),
          ),
        ],
      ),
    );
  }
  aadharBackText() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 15, top: 15, right: 15),
      child: Text(
        App.aadharback,
        style: TextStyle(
            fontSize: 17, color: secondaryColor, fontFamily: App.font),
      ),
    );
  }

  aadharBackField() {
    return Container(
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
          image4 != null
              ? Flexible(
              child: Text(
                file4,
                maxLines: 2,
                style: TextStyle(color: primaryColor, fontFamily: App.font),
              ))
              : Container(),
          Container(
            padding: EdgeInsets.only(left: 10),
            child: RaisedButton(
              onPressed: _getPhoto3,
              child: Text(App.chooseFile),
            ),
          ),
        ],
      ),
    );
  }
  panText() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 15, top: 15, right: 15),
      child: Text(
        App.panCard,
        style: TextStyle(
            fontSize: 17, color: secondaryColor, fontFamily: App.font),
      ),
    );
  }

  panField() {
    return Container(
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
          image5 != null
              ? Flexible(
              child: Text(
                file5,
                maxLines: 2,
                style: TextStyle(color: primaryColor, fontFamily: App.font),
              ))
              : Container(),
          Container(
            padding: EdgeInsets.only(left: 10),
            child: RaisedButton(
              onPressed: _getPhoto3,
              child: Text(App.chooseFile),
            ),
          ),
        ],
      ),
    );
  }
  chequeText() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 15, top: 15, right: 15),
      child: Text(
        App.cancelledCheque,
        style: TextStyle(
            fontSize: 17, color: secondaryColor, fontFamily: App.font),
      ),
    );
  }

  chequeField() {
    return Container(
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
          image6 != null
              ? Flexible(
              child: Text(
                file6,
                maxLines: 2,
                style: TextStyle(color: primaryColor, fontFamily: App.font),
              ))
              : Container(),
          Container(
            padding: EdgeInsets.only(left: 10),
            child: RaisedButton(
              onPressed: _getPhoto3,
              child: Text(App.chooseFile),
            ),
          ),
        ],
      ),
    );
  }
  selfText() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 15, top: 15, right: 15),
      child: Text(
        App.selfAttested,
        style: TextStyle(
            fontSize: 17, color: secondaryColor, fontFamily: App.font),
      ),
    );
  }

  selfField() {
    return Container(
      padding: EdgeInsets.all(8.0),
      height: 55,
      margin: EdgeInsets.only(left: 15, right: 15,bottom: 20),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: secondaryColor),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          image7 != null
              ? Flexible(
              child: Text(
                file7,
                maxLines: 2,
                style: TextStyle(color: primaryColor, fontFamily: App.font),
              ))
              : Container(),
          Container(
            padding: EdgeInsets.only(left: 10),
            child: RaisedButton(
              onPressed: _getPhoto3,
              child: Text(App.chooseFile),
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
              borderRadius: BorderRadius.all(Radius.circular(30) //
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

  submitButton() {
    return Padding(
        padding: EdgeInsets.only(bottom: 20, top: 20),
        child: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ReferenceScreen()));
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
              App.submitButton,
              style:
                  TextStyle(color: white, fontFamily: App.font, fontSize: 20),
            ),
          ),
        ));
  }
}
