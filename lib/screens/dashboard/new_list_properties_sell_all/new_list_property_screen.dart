import 'package:flutter/material.dart';
import 'package:ollapro_partner/common/app.dart';
import 'package:ollapro_partner/common/common_appbar.dart';
import 'package:ollapro_partner/common/utils.dart';
import 'package:ollapro_partner/model/newPropertiesList.dart';
import 'package:ollapro_partner/screens/dashboard/property_detail/property_detail_screen.dart';

import 'new_list_propertty_screen_view_model.dart';

class NewListPropertyScreen extends StatefulWidget {
  @override
  NewListPropertyScreenState createState() => NewListPropertyScreenState();
}

class NewListPropertyScreenState extends State<NewListPropertyScreen>
    with SingleTickerProviderStateMixin {
  NewListPropertyScreenViewModel model;
  List<NewPropertyList> list = List();
  AnimationController animation;
  Animation<double> _fadeInFadeOut;

  @override
  void initState() {
    animation = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );
    _fadeInFadeOut = Tween<double>(begin: 0.0, end: 1).animate(animation);
    animation.forward();
    animation.addStatusListener((status) {});
    super.initState();
    super.initState();
    list.add(NewPropertyList(
        "Green Heights", App.property1Logo, "Jaipur", "Appartment"));
    list.add(NewPropertyList(
        "Green Heights", App.property1Logo, "Jaipur", "Duplex"));
    list.add(
        NewPropertyList("Green Heights", App.property1Logo, "Jaipur", "Villa"));
    list.add(NewPropertyList(
        "Green Heights", App.property1Logo, "Jaipur", "Appartment"));
  }

  @override
  Widget build(BuildContext context) {
    print("runtimeType -> " + runtimeType.toString());
    model ?? (model = NewListPropertyScreenViewModel(this));
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: primaryColor,
          child: Stack(
            children: [
              appBarReward(context, App.addNewPropertyTitle),
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
                  child: FadeTransition(
                    opacity: _fadeInFadeOut,
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> PropertyDetailScreen() ));
                            },
                            child: Container(
                              height: 200,
                              width: Utils.getDeviceWidth(context),
                              margin: EdgeInsets.only(
                                  top: 20, bottom: 10, left: 10, right: 10),
                              decoration: new BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: AssetImage(list[index].image),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              child: Container(
                                color: Colors.black.withOpacity(0.20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 10, bottom: 5),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            list[index].name,
                                            style: TextStyle(
                                                color: white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                                fontFamily: App.font),
                                          ),
                                          Text(
                                            list[index].name1,
                                            style: TextStyle(
                                                color: white,
                                                fontSize: 15,
                                                fontFamily: App.font),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 25,
                                      width: 80,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: yellow,
                                      ),
                                      margin:
                                          EdgeInsets.only(right: 10, bottom: 10),
                                      child: Text(
                                        list[index].buttonName,
                                        style: TextStyle(
                                            color: white,
                                            fontSize: 12,
                                            fontFamily: App.font),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
