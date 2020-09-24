import 'package:flutter/material.dart';
import 'package:ollapro_partner/common/app.dart';
import 'package:ollapro_partner/common/common_button.dart';
import 'package:ollapro_partner/common/common_widgets.dart';
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
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SafeArea(
          child: Container(
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
        ),
        bottomNavigationBar: iconButton(context,
        buttonName: App.addPropertyButton,
        imageName:App.addButton,
        onPressed: (){
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddPropertyScreen()));
        }),
      ),
    );
  }
}
