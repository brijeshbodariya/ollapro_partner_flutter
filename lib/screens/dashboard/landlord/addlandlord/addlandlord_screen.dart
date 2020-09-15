import 'package:flutter/material.dart';
import 'package:ollapro_partner/common/app.dart';
import 'package:ollapro_partner/common/utils.dart';
import 'addlandlord_screen_view_model.dart';

class AddLandLordScreen extends StatefulWidget {
  @override
  AddLandLordScreenState createState() => AddLandLordScreenState();
}

class AddLandLordScreenState extends State<AddLandLordScreen> {
  AddLandLordScreenViewModel model ;

  @override
  Widget build(BuildContext context) {
    print("runtimeType -> " + runtimeType.toString());
    model ?? (model = AddLandLordScreenViewModel(this));
    return Scaffold(
      appBar: AppBar(
        title: Text(
          App.addNewLandLordText,
          style: TextStyle(color: white, fontFamily: App.font),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            App.arrowBack,
            color: white,
            height: 20,
            width: 20,
          ),
        ),
        actions: [

          Container(
              margin: EdgeInsets.only(right: 10),
              child: GestureDetector(
                onTap: () {},
                child: Image.asset(
                  App.notificationLogo,
                  height: 20,
                  width: 20,
                ),
              )),
        ],
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
              style: TextStyle(
                  color: white, fontFamily: App.font, fontSize: 20),
            ),
          ),
        ));
  }
}
