import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ollapro_partner/common/app.dart';
import 'package:ollapro_partner/common/common_widgets.dart';
import 'package:ollapro_partner/common/utils.dart';
import 'addlandlord_screen_view_model.dart';

class AddLandLordScreen extends StatefulWidget {
  @override
  AddLandLordScreenState createState() => AddLandLordScreenState();
}

class AddLandLordScreenState extends State<AddLandLordScreen> {
  AddLandLordScreenViewModel model;
  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController mNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController(text: "+91");
  TextEditingController aadharController = TextEditingController();
  TextEditingController add1Controller = TextEditingController();
  TextEditingController add2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print("runtimeType -> " + runtimeType.toString());
    model ?? (model = AddLandLordScreenViewModel(this));
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: primaryColor,
            child: Column(
              children: [
                appBarDash(context, App.addNewLandLordTitle),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25)),
                      color: white),
                  child: Column(
                    children: [
                      SizedBox(height: 10,),
                      //firstName
                      commonTextField(
                          title: App.fName,
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
                      SizedBox(height: 10,),
                      //email
                      commonTextField(
                          title: App.emailAddress,
                          controller: emailController,
                          hintText: "Enter Email",
                          textInputType: TextInputType.emailAddress
                      ),
                      SizedBox(height: 10),
                      //phone number
                      commonTextField(
                          title: App.mobileNumber,
                          controller: phoneController,
                          hintText: "Enter Phone NUmber",
                          textInputType: TextInputType.phone),
                      SizedBox(height: 10),
                      //aadhar card
                      commonTextField(
                          title: App.aadhar,
                          controller: aadharController,
                          hintText: "Enter Aadhar NUmber",
                          textInputType: TextInputType.phone
                      ),SizedBox(height: 10,),
                      // address
                      commonTextField(
                          title: App.communicationAddress,
                          controller: add1Controller,
                          hintText: "Enter Address 1",
                          textInputType: TextInputType.text),
                      add2Field(),
                    ],
                  ),
                )
              ],
            ),
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
  add2Field() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 15, right: 15, bottom: 10),
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
}
