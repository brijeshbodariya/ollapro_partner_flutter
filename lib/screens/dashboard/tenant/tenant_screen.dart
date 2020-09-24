import 'package:flutter/material.dart';
import 'package:ollapro_partner/common/app.dart';
import 'package:ollapro_partner/common/common_button.dart';
import 'package:ollapro_partner/common/common_widgets.dart';
import 'package:ollapro_partner/common/utils.dart';
import 'package:ollapro_partner/model/newlandlord.dart';
import 'package:ollapro_partner/model/customPopUp.dart';
import 'package:ollapro_partner/screens/dashboard/tenant/tenant_screen_view_model.dart';
import 'add_tenant/add_tenant_screen.dart';

class TenantScreen extends StatefulWidget {
  @override
  TenantScreenState createState() => TenantScreenState();
}

class TenantScreenState extends State<TenantScreen> {
  TenantScreenViewModel model;
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
    if (choice == CustomPopUp.report) {
      print('Settings');
    } else if (choice == CustomPopUp.delete) {
      print('Subscribe');
    }
  }

  @override
  Widget build(BuildContext context) {
    print("runtimeType -> " + runtimeType.toString());
    model ?? (model = TenantScreenViewModel(this));
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: primaryColor,
          child: Stack(
            children: [
              appBarDash(context, App.tenantTitle),
              Container(
                height: Utils.getDeviceHeight(context),
                width: Utils.getDeviceWidth(context),
                margin: EdgeInsets.only(top: 60),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25)),
                    color: white),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      listTenant(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar:  iconButton(context,
          buttonName: App.addNewTenantButton,
          imageName:App.addButton,
          onPressed: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddTenantScreen()));
          }),
    );
  }


  listTenant() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25)),
          color: white),
      child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: list.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: grey1,
              ),
              margin: EdgeInsets.only(left: 10, right: 10, top: 10),
              height: 140,
              width: Utils.getDeviceWidth(context),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                        child: Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
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
                                    margin: EdgeInsets.only(left: 10),
                                    child: Image.asset(
                                      App.verifiedLogo,
                                      height: 20,
                                      width: 20,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 5),
                                    child: Text(
                                      "Verified",
                                      style: TextStyle(
                                          color: green,
                                          fontFamily: App.font,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 5.0),
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
                                margin: const EdgeInsets.only(top: 5.0),
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
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: PopupMenuButton<String>(
                          onSelected: choiceAction,
                          itemBuilder: (BuildContext context) {
                            return CustomPopUp.choices.map((String choice) {
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
                                color: secondaryColor,
                                fontFamily: App.font,
                                fontWeight: FontWeight.bold),
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
                                color: secondaryColor,
                                fontFamily: App.font,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
