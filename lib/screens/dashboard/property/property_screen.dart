import 'package:flutter/material.dart';
import 'package:ollapro_partner/common/app.dart';
import 'package:ollapro_partner/screens/dashboard/property/property_screen_view_model.dart';

class PropertyScreen extends StatefulWidget {
  @override
  PropertyScreenState createState() => PropertyScreenState();
}

class PropertyScreenState extends State<PropertyScreen> {

  PropertyScreenViewModel model;
  @override
  Widget build(BuildContext context) {
    print("runtimeType -> " + runtimeType.toString());
    model ?? (model = PropertyScreenViewModel(this));
    return Scaffold(
      appBar: AppBar(
        title: Text(
          App.property,
          style: TextStyle(color: white, fontFamily: App.font),
        ),
        leading: GestureDetector(
          onTap: (){
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
      body: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
