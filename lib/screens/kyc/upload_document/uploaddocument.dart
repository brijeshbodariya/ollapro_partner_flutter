import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ollapro_partner/common/app.dart';
import 'package:ollapro_partner/common/common_button.dart';
import 'package:ollapro_partner/common/common_widgets.dart';
import 'package:ollapro_partner/common/header.dart';
import 'package:ollapro_partner/common/utils.dart';
import 'package:ollapro_partner/common/validation.dart';
import 'package:ollapro_partner/screens/dashboard/dashboard_screen.dart';
import 'package:ollapro_partner/screens/kyc/upload_document/upload_document_view_model.dart';

class UploadDocument extends StatefulWidget {
  @override
  UploadDocumentState createState() => UploadDocumentState();
}

class UploadDocumentState extends State<UploadDocument> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  UploadDocumentViewModel model;
  File image1;
  File image2;
  File image3;
  File image4;
  File image5;
  File image6;
  File image7;
  String file1 = "Select photo1";
  String file2 = "Select photo2";
  String file3 = "Select aadhar front";
  String file4 = "Select aadhar back";
  String file5 = "Select aadhar front";
  String file6 = "Select aadhar front";
  String file7 = "Select aadhar front";
  bool _autoValidate = false;
  Validation validation;


  @override
  Widget build(BuildContext context) {
    print("runtimeType -> " + runtimeType.toString());
    model ?? (model = UploadDocumentViewModel(this));
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

                        //photo 1
                        commonPhotoField(context,
                        title: App.photo1,
                        onPressed: _getPhoto1,
                        errorName: "Please select image",
                        fileName: file1 ,
                          imageName: image1
                        ),
                        //photo 2
                        commonPhotoField(context,
                            title: App.photo2,
                            onPressed: _getPhoto2,
                            errorName: "Please select image",
                            fileName: file2 ,
                            imageName: image2
                        ),
                        //aadhar front
                        commonPhotoField(context,
                            title: App.aadharFront,
                            onPressed: _getPhoto3,
                            errorName: "Please select aadhar front",
                            fileName: file3,
                            imageName: image3
                        ),
                        //aadhar back
                        commonPhotoField(context,
                            title: App.aadharback,
                            onPressed: _getPhoto4,
                            errorName: "Please select aadhar back",
                            fileName: file4,
                            imageName: image4
                        ),
                        //pan card
                        commonPhotoField(context,
                            title: App.panCard,
                            onPressed: _getPhoto5,
                            errorName: "Please select PAN card back",
                            fileName: file5,
                            imageName: image5
                        ),
                        //pan card
                        commonPhotoField(context,
                            title: App.cancelledCheque,
                            onPressed: _getPhoto6,
                            errorName: "Please select cancel check image",
                            fileName: file6,
                            imageName: image6
                        ),
                        //pan card
                        commonPhotoField(context,
                            title: App.selfAttested,
                            onPressed: _getPhoto7,
                            errorName: "Please select self attested",
                            fileName: file7,
                            imageName: image7
                        ),
                        SizedBox(height: 10,)
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
                            builder: (context) => DashBoardScreen())),
                    HeaderLine.headerLineComplete(context, 3, 3, 3, 3, 3, 1),
                    uploadDocumentText(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar:
      commonButton(context,
          onPressed: _validateInputs,
          buttonName: App.submitButton),
    );
  }
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
  void _validateInputs() {
    if (_formKey.currentState.validate() && image1 != null && image2 != null && image3 != null && image4 != null && image5 != null && image6 != null && image7 != null) {
      _formKey.currentState.save();
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => DashBoardScreen()));
    } else {
      setState(() {
        _autoValidate = true;
        Utils.showToast("Please select images");
      });
    }
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
}
