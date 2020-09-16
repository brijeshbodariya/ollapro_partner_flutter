import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ollapro_partner/common/app.dart';
import 'package:ollapro_partner/common/common_widgets.dart';
import 'package:ollapro_partner/common/utils.dart';
import 'file:///D:/LiveProject/ollapro_partner_flutter/lib/common/repo.dart';
import 'add_property_screen_view_model.dart';

//model are name and image
class Model {
  String name;
  String image;

  Model(this.image, this.name);
}

class AddPropertyScreen extends StatefulWidget {
  @override
  AddPropertyScreenState createState() => AddPropertyScreenState();
}

class AddPropertyScreenState extends State<AddPropertyScreen> {
  List<Model> list = List();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController placeController = TextEditingController();
  TextEditingController landMarkController = TextEditingController();
  TextEditingController propertyController = TextEditingController();
  TextEditingController add1Controller = TextEditingController();
  TextEditingController add2Controller = TextEditingController();
  AddPropertyViewModel model;
  Repository repo = Repository();

  List<String> _states = ["Choose a state"];
  List<String> _city = ["Choose .."];
  String _selectedState = "Choose a state";
  String _selectedCity = "Choose ..";
  String _isSelected = '';
  int isSelectedCheck = 0;
  File image1;
  File image2;
  File image3;
  File image4;
  String file1="Select photo1";
  String file2="Select photo2";
  String file3="Select photo3";
  String file4="Select photo4";

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
  _getPhoto1() async {
    PickedFile pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        image1 = File(pickedFile.path);

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
  @override
  void initState() {
    _states = List.from(_states)..addAll(repo.getStates());
    setState(() {
      list.add(Model(App.checkedButtonLogo, App.residential));
      list.add(Model(App.checkedButtonLogo, App.commercial));
      list.add(Model(App.checkedButtonLogo, App.hostel));
      list.add(Model(App.checkedButtonLogo, App.booking));
      list.add(Model(App.checkedButtonLogo, App.other));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("runtimeType -> " + runtimeType.toString());
    model ?? (model = AddPropertyViewModel(this));

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
                      Container(
                        margin: EdgeInsets.only(left: 10, top: 15),
                        alignment: Alignment.topLeft,
                        child: Text(
                          App.location,
                          style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      //pincode
                      commonTextField(
                          title: App.pinCode,
                          controller: pincodeController,
                          hintText: "Enter Pincode",
                          textInputType: TextInputType.text),
                      SizedBox(
                        height: 10,
                      ),
                      stateSelect(),
                      citySelect(),
                      //place
                      commonTextField(
                          title: App.place,
                          controller: placeController,
                          hintText: "Enter Place here",
                          textInputType: TextInputType.text),
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
                      SizedBox(
                        height: 10,
                      ),
                      //landmark if any
                      commonTextField(
                          title: App.landmark,
                          controller: landMarkController,
                          hintText: "Enter Address 1",
                          textInputType: TextInputType.text),
                      SizedBox(height: 10),
                      Container(
                        margin: EdgeInsets.only(left: 10, top: 15),
                        alignment: Alignment.topLeft,
                        child: Text(
                          App.typeOfAcc,
                          style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(left: 15, top: 15),
                        child: Text(
                          App.selectType,
                          style: TextStyle(
                              fontSize: 16,
                              color: secondaryColor,
                              fontFamily: App.font),
                        ),
                      ),
                      //check box
                      ListView.builder(
                          itemCount: list.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return typeOfAcc(index);
                          }),
                      SizedBox(height: 10),
                      //property title
                      commonTextField(
                          title: App.propertyTitleText,
                          controller: propertyController,
                          hintText: "Enter Property",
                          textInputType: TextInputType.phone),
                      SizedBox(height: 10),
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(left: 15, top: 15),
                        child: Text(
                          App.uploadPicture,
                          style: TextStyle(
                              fontSize: 16,
                              color: secondaryColor,
                              fontFamily: App.font),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            image1 != null ? Container(
                              height: 70,
                              width: 70,
                              child: Image.file(image1),
                            ):Container(
                              height: 70,
                              width: 70,
                              child: InkWell(
                                  onTap: _getPhoto1,
                                  child: Image.asset(
                                    App.uploadLogo,
                                  )),
                            ),
                            image2 != null ? Container(
                              height: 70,
                              width: 70,
                              child: Image.file(image2),
                            ):Container(
                              height: 70,
                              width: 70,
                              child: InkWell(
                                  onTap: _getPhoto2,
                                  child: Image.asset(
                                    App.uploadLogo,
                                  )),
                            ),
                            image3 != null ?  Container(
                              height: 70,
                              width: 70,
                              child: Image.file(image3),
                            ): Container(
                              height: 70,
                              width: 70,
                              child: InkWell(
                                  onTap: _getPhoto3,
                                  child: Image.asset(
                                    App.uploadLogo,
                                  )),
                            ),
                            image4 != null?  Container(
                              height: 70,
                              width: 70,
                              child: Image.file(image4),
                            ): Container(
                              height: 70,
                              width: 70,
                              child: InkWell(
                                  onTap: _getPhoto4,
                                  child: Image.asset(
                                    App.uploadLogo,
                                  )),
                            ),
                          ],
                        ),
                      )
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
  stateSelect() {
    return Column(
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
    );
  }
  citySelect() {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(left: 15, top: 15),
          child: Text(
            App.district,
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
    );
  }
  Widget typeOfAcc(int index) {
    return InkResponse(
      onTap: () {
        isSelectedCheck = index;
        setState(() {});
      },
      child: Container(
        height: 30,
        padding: EdgeInsets.only(left: 10, right: 10),
        margin: EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Row(children: <Widget>[
          isSelectedCheck == index
              ? Image.asset(
                  list[index].image,
                  height: 20,
                  width: 20,
                  fit: BoxFit.fill,
                )
              : Container(
                  child: Image.asset(
                  App.unCheckedButtonLogo,
                  height: 20,
                  width: 20,
                )),
          SizedBox(width: 15),
          Text(list[index].name),
        ]),
      ),
    );
  }
}
