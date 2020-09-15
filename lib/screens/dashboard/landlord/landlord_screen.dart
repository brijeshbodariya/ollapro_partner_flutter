import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ollapro_partner/common/app.dart';
import 'package:ollapro_partner/common/utils.dart';
import 'package:ollapro_partner/model/customPopUp.dart';
import 'package:ollapro_partner/model/newlandlord.dart';
import 'package:ollapro_partner/screens/dashboard/landlord/addlandlord/addlandlord_screen.dart';

import 'landlord_screen_view_model.dart';

class LandLordScreen extends StatefulWidget {
  @override
  LandLordScreenState createState() => LandLordScreenState();
}

class LandLordScreenState extends State<LandLordScreen> {
  LandLordScreenViewModel model;

  List<NewLandLord> list = List();

  @override
  void initState() {
    // TODO: implement initState
    list.add(NewLandLord(App.tenantUSer, "Pawan Singh", "Civil Lines, Jaipur",
        "+91 1111111111"));
    list.add(NewLandLord(
        App.tenantUSer, "Vijay Sharma", "Sanganer, Jaipur", "+91 1111111111"));
    list.add(NewLandLord(
        App.tenantUSer, "Akash Singh", "Mansorovar, Jaipur", "+91 1111111111"));
    list.add(NewLandLord(App.tenantUSer, "Umesh Jain", "Pratap Nagar, Jaipur",
        "+91 1111111111"));
    super.initState();
  }

  void choiceAction(String choice) {
    if (choice == customPopUp.report) {
      print('Settings');
    } else if (choice == customPopUp.delete) {
      print('Subscribe');
    }
  }

  @override
  Widget build(BuildContext context) {
    print("runtimeType -> " + runtimeType.toString());
    model ?? (model = LandLordScreenViewModel(this));
    return Scaffold(
      appBar: AppBar(
        title: Text(
          App.landlord,
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
      body: SingleChildScrollView(
        child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: list.length,
            itemBuilder: (context, index) {
              return Container(
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(10),
                 color: grey1,
               ),

                margin: EdgeInsets.all(10),
                height: 140,
                width: Utils.getDeviceWidth(context),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                              height: 80,
                              width: 80,
                              margin: EdgeInsets.only(left: 10, top: 10),
                              decoration: new BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: white,
                                  image: new DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(list[index].image)))),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                list[index].name,
                                style: TextStyle(
                                    color: primaryColor,
                                    fontFamily: App.font,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top:5.0),
                                child: Text(
                                  list[index].category,
                                  style: TextStyle(
                                      color: secondaryColor,
                                      fontFamily: App.font,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top:5.0),
                                child: Text(
                                  list[index].phone,
                                  style: TextStyle(
                                      color: secondaryColor,
                                      fontFamily: App.font,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              )
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: PopupMenuButton<String>(
                            onSelected: choiceAction,
                            itemBuilder: (BuildContext context) {
                              return customPopUp.choices.map((String choice) {
                                return PopupMenuItem<String>(
                                  value: choice,
                                  child: Text(choice),
                                );
                              }).toList();
                            },
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      height: 1,
                      color: secondaryColor,
                      width: Utils.getDeviceWidth(context),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Text(
                              'Edit Profile',
                              style: TextStyle(
                                  color: secondaryColor, fontFamily: App.font,fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            height: 39,
                            width: 1,
                            color: secondaryColor,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              'View Profile',
                              style: TextStyle(
                                  color: secondaryColor, fontFamily: App.font,fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
      bottomNavigationBar: submitButton(),
    );
  }

  submitButton() {
    return Padding(
        padding: EdgeInsets.only(bottom: 10, top: 10),
        child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> AddLandLordScreen()));
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  App.addButton,
                  color: white,
                  height: 16,
                  width: 16,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  App.addNewLandLord,
                  style: TextStyle(
                      color: white, fontFamily: App.font, fontSize: 20),
                ),
              ],
            ),
          ),
        ));
  }
}
