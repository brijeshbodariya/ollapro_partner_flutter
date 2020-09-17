import 'package:flutter/material.dart';
import 'package:ollapro_partner/common/app.dart';
import 'package:ollapro_partner/common/common_widgets.dart';
import 'package:ollapro_partner/common/utils.dart';
import 'package:ollapro_partner/screens/dashboard/property/add_property/add_property_screen.dart';
import 'package:ollapro_partner/screens/dashboard/property/tab1/top_property_screen.dart';
import 'package:ollapro_partner/screens/dashboard/property/tab_property_screen_view_model.dart';


class TabProperty extends StatefulWidget {
  @override
  TabPropertyState createState() => TabPropertyState();
}

class TabPropertyState extends State<TabProperty> {
  TabPropertyScreenViewModel model;

  @override
  Widget build(BuildContext context) {
    print("runtimeType -> " + runtimeType.toString());
    model ?? (model = TabPropertyScreenViewModel(this));
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: Container(
            color: primaryColor,
            child: Column(
              children: [
                appBarDash(context, App.property),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25)),
                      color: white),
                  child: TabBar(
                    indicatorColor: yellow,
                    unselectedLabelColor: primaryColor,
                    tabs: [
                      Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("Top Property",
                              textAlign: TextAlign.center,
                              maxLines:2,style: TextStyle(color: primaryColor,fontSize: 17)),
                        ),
                      ),
                      Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("New Property",
                              textAlign: TextAlign.center,
                              maxLines:2,style: TextStyle(color: primaryColor,fontSize: 17)),
                        ),
                      ),
                      Tab(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("Near You",
                              textAlign: TextAlign.center,
                              maxLines:2,style: TextStyle(color: primaryColor,fontSize: 17)),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      TopPropertyScreen(),
                      TopPropertyScreen(),
                      TopPropertyScreen()
                    ],
                  ),
                )
              ],
            ),
          ),
          bottomNavigationBar: submitButton(),
        ),
      ),
    );
  }

  submitButton() {
    return Padding(
        padding: EdgeInsets.only(bottom: 10, top: 10),
        child: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddPropertyScreen()));
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
                  App.addPropertyButton,
                  style: TextStyle(
                      color: white, fontFamily: App.font, fontSize: 20),
                ),
              ],
            ),
          ),
        ));
  }
}
