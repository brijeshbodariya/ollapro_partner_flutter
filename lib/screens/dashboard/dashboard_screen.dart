import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ollapro_partner/common/app.dart';
import 'package:ollapro_partner/common/utils.dart';
import 'package:ollapro_partner/model/newPropertiesList.dart';
import 'package:ollapro_partner/model/nonVerifiedTenant.dart';
import 'package:ollapro_partner/screens/dashboard/dashboard_screen_view_model.dart';
import 'package:ollapro_partner/screens/dashboard/landlord/landlord_screen.dart';
import 'package:ollapro_partner/screens/dashboard/property/tab_property_screen.dart';
import 'package:ollapro_partner/screens/dashboard/reward_basket/reward_basket_screen.dart';
import 'package:ollapro_partner/screens/dashboard/tenant/tenant_screen.dart';

class DashBoardScreen extends StatefulWidget {
  @override
  DashBoardScreenState createState() => DashBoardScreenState();
}

class DashBoardScreenState extends State<DashBoardScreen> {
  DashBoardScreenViewModel model;
  List<NewPropertyList> list = List();
  List<NonVerifiedTenant> list1 = List();

  @override
  void initState() {
    // TODO: implement initState

    //new properties list
    list.add(NewPropertyList(
        "Green Heights", App.property1Logo, "Jaipur", "Appartment"));
    list.add(NewPropertyList(
        "Green Heights", App.property1Logo, "Jaipur", "Appartment"));
    list.add(NewPropertyList(
        "Green Heights", App.property1Logo, "Jaipur", "Appartment"));
    list.add(NewPropertyList(
        "Green Heights", App.property1Logo, "Jaipur", "Appartment"));

    //non verified tenant
    list1.add(NonVerifiedTenant(App.userImage, "Ankit"));
    list1.add(NonVerifiedTenant(App.userImage, "Hitesh"));
    list1.add(NonVerifiedTenant(App.userImage, "Vijay"));
    list1.add(NonVerifiedTenant(App.userImage, "Vijay"));
    list1.add(NonVerifiedTenant(App.userImage, "Vijay"));
    list1.add(NonVerifiedTenant(App.userImage, "Vijay"));
    list1.add(NonVerifiedTenant(App.userImage, "Vijay"));
    list1.add(NonVerifiedTenant(App.userImage, "Vijay"));
    list1.add(NonVerifiedTenant(App.userImage, "Vijay"));
    list1.add(NonVerifiedTenant(App.userImage, "Vijay"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("runtimeType -> " + runtimeType.toString());
    model ?? (model = DashBoardScreenViewModel(this));
    return Scaffold(
      appBar: AppBar(
        title: Text(
          App.dashBoardTitle,
          style: TextStyle(color: white, fontFamily: App.font),
        ),
        leading: Container(
          child: Image.asset(
            App.menuDrawerLogo,
            color: white,
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 13),
            child: GestureDetector(
              onTap: () {},
              child: Image.asset(
                App.shareLogo,
                height: 20,
                width: 20,
              ),
            ),
          ),
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
      drawer: Drawer(),
      body: WillPopScope(
        onWillPop: () async {
          final value = await showDialog<bool>(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text('Are you sure you want to exit?'),
                  actions: <Widget>[
                    FlatButton(
                      child:
                          Text('No', style: TextStyle(fontFamily: App.font)),
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                    ),
                    FlatButton(
                      child: Text(
                        'Yes, exit',
                        style: TextStyle(fontFamily: App.font),
                      ),
                      onPressed: () {
                        SystemNavigator.pop();
                      },
                    ),
                  ],
                );
              });

          return value == true;
        },
        child: SafeArea(
          child: ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Column(
                    children: [
                      Container(
                        height: Utils.getDeviceHeight(context) / 4,
                        child: Stack(
                          children: [
                            Image.asset(
                              App.dashBoardBg,
                              fit: BoxFit.fitWidth,
                              width: MediaQuery.of(context).size.width,
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              alignment: Alignment.center,
                              child: Text(
                                "Saurabh Kumar",
                                style: TextStyle(
                                    color: white,
                                    fontFamily: App.font,
                                    fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // height: Utils.getDeviceHeight(context),
                        width: MediaQuery.of(context).size.width,
                        color: grey1,
                        child: Column(
                          children: [
                            propertyColumn(),
                            SizedBox(
                              height: 6,
                            ),
                            listProperySelectColumn(),
                            SizedBox(
                              height: 6,
                            ),
                            listPropertyColumn(),
                            SizedBox(
                              height: 6,
                            ),
                            nonVerifiedTenantColumn(),
                            SizedBox(
                              height: 6,
                            ),
                            rewardBasketImage(),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 100), child: userImage())
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  userImage() {
    return Container(
        alignment: Alignment.center,
        height: 100,
        width: 100,
        decoration: new BoxDecoration(
            shape: BoxShape.circle,
            image: new DecorationImage(
                fit: BoxFit.fill, image: AssetImage(App.userImage))));
  }

  propertyColumn() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20)),
          color: white),
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.only(top: 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 12, left: 10),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "10+",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: App.font,
                          color: primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    child: Text(
                      "PROPERTIES",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: App.font,
                          color: secondaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 30.0,
              width: 1.0,
              color: grey,
              margin: const EdgeInsets.only(left: 10.0, right: 10.0),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 12),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "15+",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: App.font,
                          color: primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    child: Text(
                      "LANDLORDS",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: App.font,
                          color: secondaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 30.0,
              width: 1.0,
              color: grey,
              margin: const EdgeInsets.only(left: 10.0, right: 10.0),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 12, right: 10),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "30+",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: App.font,
                          color: primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    child: Text(
                      "TENANTS",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: App.font,
                          color: secondaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  listProperySelectColumn() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TabProperty()));
            },
            child: Container(
              margin: EdgeInsets.only(top: 20, bottom: 20, left: 10),
              child: Column(
                children: [
                  Container(
                      alignment: Alignment.center,
                      height: 80,
                      width: 80,
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(App.propertyLogo)))),
                  Text(
                    App.property,
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: App.font,
                        color: primaryColor),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LandLordScreen()));
            },
            child: Container(
              margin: EdgeInsets.only(top: 20, bottom: 20, left: 10),
              child: Column(
                children: [
                  Container(
                      alignment: Alignment.center,
                      height: 80,
                      width: 80,
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(App.landLordDashLogo)))),
                  Text(
                    App.landlordTitle,
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: App.font,
                        color: primaryColor),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TenantScreen()));
            },
            child: Container(
              margin: EdgeInsets.only(top: 20, bottom: 20, left: 10),
              child: Column(
                children: [
                  Container(
                      alignment: Alignment.center,
                      height: 80,
                      width: 80,
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(App.tenantLogo)))),
                  Text(
                    App.tenantTitle,
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: App.font,
                        color: primaryColor),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RewardBasketScreen()));
            },
            child: Container(
              margin: EdgeInsets.only(top: 20, bottom: 20, left: 10),
              child: Column(
                children: [
                  Container(
                      alignment: Alignment.center,
                      height: 80,
                      width: 80,
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(App.rewardBasketLogo)))),
                  Text(
                    App.rewardBasket,
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: App.font,
                        color: primaryColor),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  listPropertyColumn() {
    return Container(
      height: 240,
      width: Utils.getDeviceWidth(context),
      color: white,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  App.newListProperty,
                  style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      fontFamily: App.font),
                ),
                Row(
                  children: [
                    InkWell(
                        onTap: () {},
                        child: Text(
                          App.seeAll,
                          style: TextStyle(
                              color: yellow,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              fontFamily: App.font),
                        )),
                    Image.asset(App.leftArrowLogo),
                  ],
                )
              ],
            ),
          ),
          Container(
            height: 200,
            width: Utils.getDeviceWidth(context),
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: Utils.getDeviceWidth(context) / 1.5,
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
                            margin: EdgeInsets.only(left: 10, bottom: 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                            width: 70,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: yellow,
                            ),
                            margin: EdgeInsets.only(right: 10, bottom: 10),
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
                  );
                }),
          ),
        ],
      ),
    );
  }

  nonVerifiedTenantColumn() {
    return Container(
      color: white,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  App.nonVerifiedTenantText,
                  style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      fontFamily: App.font),
                ),
                Row(
                  children: [
                    InkWell(
                        onTap: () {},
                        child: Text(
                          App.seeAll,
                          style: TextStyle(
                              color: yellow,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              fontFamily: App.font),
                        )),
                    Image.asset(App.leftArrowLogo),
                  ],
                )
              ],
            ),
          ),
          Container(
            height: 80,
            margin: EdgeInsets.only(top: 10),
            width: Utils.getDeviceWidth(context),
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: list1.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                          alignment: Alignment.center,
                          height: 60,
                          width: 60,
                          decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(list1[index].image)))),
                      Container(
                        child: Text(list1[index].name,
                            style: TextStyle(
                                color: primaryColor,
                                fontFamily: App.font,
                                fontSize: 10)),
                      )
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }

  rewardBasketImage() {
    return Container(
      child: Image.asset(
        App.bannerDashLogo,
        height: 150,
        width: Utils.getDeviceWidth(context),
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
