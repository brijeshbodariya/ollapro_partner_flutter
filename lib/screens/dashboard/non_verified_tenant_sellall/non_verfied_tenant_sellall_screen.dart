import 'package:flutter/material.dart';
import 'package:ollapro_partner/common/app.dart';
import 'package:ollapro_partner/common/common_appbar.dart';
import 'package:ollapro_partner/common/utils.dart';
import 'package:ollapro_partner/model/customPopUp.dart';
import 'package:ollapro_partner/model/nonVerifiedTenant.dart';

import 'non_verfied_tenant_sellall_screen_view_model.dart';

class NonVerifiedTenantSellAllScreen extends StatefulWidget {
  @override
  NonVerifiedTenantSellAllScreenState createState() =>
      NonVerifiedTenantSellAllScreenState();
}

class NonVerifiedTenantSellAllScreenState
    extends State<NonVerifiedTenantSellAllScreen>
    with SingleTickerProviderStateMixin {
  NonVerifiedSellAllViewModel model;
  AnimationController animation;
  Animation<double> _fadeInFadeOut;
  List<NonVerifiedTenant> list1 = List();

  @override
  void dispose() {
    // TODO: implement dispose
    animation.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    animation = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );
    _fadeInFadeOut = Tween<double>(begin: 0.0, end: 1).animate(animation);
    animation.forward();
    animation.addStatusListener((status) {});

    list1.add(NonVerifiedTenant(App.userImage, "Ankit"));
    list1.add(NonVerifiedTenant(App.userImage, "Hitesh"));
    list1.add(NonVerifiedTenant(App.userImage, "Meet"));
    list1.add(NonVerifiedTenant(App.userImage, "Jay"));
    list1.add(NonVerifiedTenant(App.userImage, "Vishal"));
    list1.add(NonVerifiedTenant(App.userImage, "Navneet"));
    list1.add(NonVerifiedTenant(App.userImage, "Kaushik"));
    list1.add(NonVerifiedTenant(App.userImage, "Brijesh"));
    list1.add(NonVerifiedTenant(App.userImage, "Parth"));
   // list1.add(NonVerifiedTenant(App.userImage, "Priyesh"));
  }

  @override
  Widget build(BuildContext context) {
    print("runtimeType -> " + runtimeType.toString());
    model ?? (model = NonVerifiedSellAllViewModel(this));
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: primaryColor,
          child: Stack(
            children: [
              appBarReward(context, App.nonVerifiedTenantTitle),
             gridViewNonVerifiedTenantData(),
            ],
          ),
        ),
      ),
    );
  }

  void choiceAction(String choice) {
    if (choice == CustomPopUp.report) {
      print('Settings');
    } else if (choice == CustomPopUp.delete) {
      print('Subscribe');
    }
  }

  gridViewNonVerifiedTenantData() {
    return  Container(
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
            child: GridView.count(
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              childAspectRatio: 1,
              controller:
              new ScrollController(keepScrollOffset: false),
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              shrinkWrap: true,
              children: List.generate(list1.length, (index) {
                return InkWell(
                    onTap: () {
                      // getClickedReward(index);
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                          top: 10, left: 10, right: 10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: PopupMenuButton<String>(
                              onSelected: choiceAction,
                              itemBuilder:
                                  (BuildContext context) {
                                return CustomPopUp.choices
                                    .map((String choice) {
                                  return PopupMenuItem<String>(
                                    value: choice,
                                    child: Text(choice),
                                  );
                                }).toList();
                              },
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(top: 20),
                                alignment: Alignment.center,
                                child: Image.asset(
                                  list1[index].image,
                                  height: 100,
                                  width: 100,
                                ),
                              ),

                              Container(
                                margin: EdgeInsets.only(top: 10),
                                alignment: Alignment.center,
                                child: Text(
                                  list1[index].name,
                                  style: TextStyle(
                                      color: primaryColor, fontSize: 25),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ));
              }),
            ),
          ),
        ));
  }
}
