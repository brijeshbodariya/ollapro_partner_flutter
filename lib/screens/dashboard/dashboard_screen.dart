import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ollapro_partner/common/app.dart';
import 'package:ollapro_partner/common/utils.dart';
import 'package:ollapro_partner/model/newPropertiesList.dart';
import 'package:ollapro_partner/model/nonVerifiedTenant.dart';
import 'package:ollapro_partner/screens/dashboard/dashboard_screen_view_model.dart';
import 'package:ollapro_partner/screens/dashboard/drawer/change_password/chnage_password_screen.dart';
import 'package:ollapro_partner/screens/dashboard/drawer/help_support/help_support_screen.dart';
import 'package:ollapro_partner/screens/dashboard/drawer/refer_earn/refer_earn_screen.dart';
import 'package:ollapro_partner/screens/dashboard/drawer/setting/setting_screen.dart';
import 'package:ollapro_partner/screens/dashboard/landlord/landlord_screen.dart';
import 'package:ollapro_partner/screens/dashboard/new_list_properties_sell_all/new_list_property_screen.dart';
import 'package:ollapro_partner/screens/dashboard/notification/notification_screen.dart';
import 'package:ollapro_partner/screens/dashboard/property/tab_property_screen.dart';
import 'package:ollapro_partner/screens/dashboard/property_detail/property_detail_screen.dart';
import 'package:ollapro_partner/screens/dashboard/reward_basket/reward_basket_screen.dart';
import 'package:ollapro_partner/screens/dashboard/tenant/tenant_screen.dart';
import 'drawer/my_profile/my_profile_screen.dart';
import 'non_verified_tenant_sellall/non_verfied_tenant_sellall_screen.dart';

class DashBoardScreen extends StatefulWidget {
  @override
  DashBoardScreenState createState() => DashBoardScreenState();
}

class DashBoardScreenState extends State<DashBoardScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  DashBoardScreenViewModel model;
  List<NewPropertyList> list = List();
  List<NonVerifiedTenant> list1 = List();

  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    // TODO: implement initState
    _controller = AnimationController(
        duration: const Duration(milliseconds: 3000),
        vsync: this,
        value: 0,
        lowerBound: 0,
        upperBound: 1);
    _animation =
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn);

    _controller.forward();

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
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("runtimeType -> " + runtimeType.toString());
    model ?? (model = DashBoardScreenViewModel(this));

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          App.dashBoardTitle,
          style: TextStyle(color: white, fontFamily: App.font),
        ),
        leading: Container(
          child: InkWell(
            onTap: () {
              _scaffoldKey.currentState.openDrawer();
            },
            child: Image.asset(
              App.menuDrawerLogo,
              color: white,
            ),
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 15),
            child: InkWell(
              onTap: () {},
              child: Image.asset(
                App.shareLogo,
                height: 20,
                width: 20,
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.only(right: 15),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NotificationScreen()));
                },
                child: Image.asset(
                  App.notificationLogo,
                  height: 20,
                  width: 20,
                ),
              )),
        ],
      ),
      drawer: Drawer(
        child: getDrawer(),
      ),
      body: WillPopScope(
        onWillPop: () async {
          final value = await showDialog<bool>(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text('Are you sure you want to exit?'),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('No', style: TextStyle(fontFamily: App.font)),
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
          child: FadeTransition(
            opacity: _animation,
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
                          height: 180,
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
                          width: MediaQuery.of(context).size.width,
                          color: grey1,
                          child: Column(
                            children: [
                              propertyColumn(),
                              SizedBox(
                                height: 6,
                              ),
                              listProperty(),
                              SizedBox(
                                height: 6,
                              ),
                              newListProperty(),
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
                      padding: EdgeInsets.only(top: 120),
                      child: userImage(),
                    )
                    // userImage()
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  getDrawer() {
    return ListView(
      children: [
        Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: new BoxDecoration(
                  image: new DecorationImage(
                image: new AssetImage(App.bgDrawerLogo),
                fit: BoxFit.fill,
              )),
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 20),
                      width: 100.0,
                      height: 100.0,
                      decoration: new BoxDecoration(
                          border: Border.all(color: yellow, width: 3),
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(App.userImage)))),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                      'Saurabh Kumar',
                      style: TextStyle(
                          fontFamily: App.font,
                          fontSize: 17,
                          color: white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5, bottom: 15),
                    child: Text(
                      'saurabhkumar@gmail.com',
                      style: TextStyle(
                          fontFamily: App.font, fontSize: 15, color: white),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        ListTile(
          title: Text(
            App.dashboardDrawer,
            style: TextStyle(
              fontFamily: App.font,
              fontSize: 16,
            ),
          ),
          leading: Image.asset(
            App.dashboardDrawerLogo,
            height: 20,
            width: 20,
          ),
          trailing: Wrap(
            spacing: 12, // space between two icons
            children: <Widget>[
              Image.asset(
                App.rightSideArrowLogo,
                height: 15,
                width: 15,
              ),
            ],
          ),
          onTap: () {
            /* Navigator.push(context, MaterialPageRoute(
                builder: (context)=> ProfileScreen()
            ));*/
          },
        ),
        Container(
          color: grey,
          height: 1,
          margin: EdgeInsets.only(left: 70, right: 20),
        ),
        ListTile(
          title: Text(
            App.myProfileDrawer,
            style: TextStyle(
              fontFamily: App.font,
              fontSize: 16,
            ),
          ),
          leading: Image.asset(
            App.profileDrawerLogo,
            height: 20,
            width: 20,
          ),
          trailing: Wrap(
            spacing: 12, // space between two icons
            children: <Widget>[
              Image.asset(
                App.rightSideArrowLogo,
                height: 15,
                width: 15,
              ),
            ],
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MyProfileScreen()));
          },
        ),
        Container(
          color: grey,
          height: 1,
          margin: EdgeInsets.only(left: 70, right: 20),
        ),
        ListTile(
          title: Text(
            App.aboutDrawer,
            style: TextStyle(fontFamily: App.font, fontSize: 16),
          ),
          leading: Image.asset(
            App.aboutDrawerLogo,
            height: 20,
            width: 20,
          ),
          trailing: Wrap(
            spacing: 12, // space between two icons
            children: <Widget>[
              Image.asset(
                App.rightSideArrowLogo,
                height: 15,
                width: 15,
              ),
            ],
          ),
          onTap: () {
            // Navigator.push(context, MaterialPageRoute(
            //     builder: (context)=> KycScreen()
            // ));
          },
        ),
        Container(
          color: grey,
          height: 1,
          margin: EdgeInsets.only(left: 70, right: 20),
        ),
        ListTile(
          title: Text(
            App.referDrawer,
            style: TextStyle(fontFamily: App.font, fontSize: 16),
          ),
          leading: Image.asset(
            App.referDrawerLogo,
            height: 20,
            width: 20,
          ),
          trailing: Wrap(
            spacing: 12, // space between two icons
            children: <Widget>[
              Image.asset(
                App.rightSideArrowLogo,
                height: 15,
                width: 15,
              ),
            ],
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ReferEarnScreen()));
          },
        ),
        Container(
          color: grey,
          height: 1,
          margin: EdgeInsets.only(left: 70, right: 20),
        ),
        ListTile(
          title: Text(
            App.settingDrawer,
            style: TextStyle(fontFamily: App.font, fontSize: 16),
          ),
          leading: Image.asset(
            App.settingDrawerLogo,
            height: 20,
            width: 20,
          ),
          trailing: Wrap(
            spacing: 12, // space between two icons
            children: <Widget>[
              Image.asset(
                App.rightSideArrowLogo,
                height: 15,
                width: 15,
              ),
            ],
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SettingScreen()));
          },
        ),
        Container(
          color: grey,
          height: 1,
          margin: EdgeInsets.only(left: 70, right: 20),
        ),
        ListTile(
          title: Text(
            App.shareDrawer,
            style: TextStyle(fontFamily: App.font, fontSize: 16),
          ),
          leading: Image.asset(
            App.shareAppDrawerLogo,
            height: 20,
            width: 20,
          ),
          trailing: Wrap(
            spacing: 12, // space between two icons
            children: <Widget>[
              Image.asset(
                App.rightSideArrowLogo,
                height: 15,
                width: 15,
              ),
            ],
          ),
          onTap: () {
            // showAlertDialog(context);
          },
        ),
        Container(
          color: grey,
          height: 1,
          margin: EdgeInsets.only(left: 70, right: 20),
        ),
        ListTile(
          title: Text(
            App.helpDrawer,
            style: TextStyle(fontFamily: App.font, fontSize: 16),
          ),
          leading: Image.asset(
            App.supportDrawerLogo,
            height: 20,
            width: 20,
          ),
          trailing: Wrap(
            spacing: 12, // space between two icons
            children: <Widget>[
              Image.asset(
                App.rightSideArrowLogo,
                height: 15,
                width: 15,
              ),
            ],
          ),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
                builder: (context)=> HelpSupportScreen()
            ));
          },
        ),
        Container(
          color: grey,
          height: 1,
          margin: EdgeInsets.only(left: 70, right: 20),
        ),
        ListTile(
          title: Text(
            App.logoutDrawer,
            style: TextStyle(fontFamily: App.font, fontSize: 16),
          ),
          leading: Image.asset(
            App.logoutDrawerLogo,
            height: 20,
            width: 20,
          ),
          trailing: Wrap(
            spacing: 12, // space between two icons
            children: <Widget>[
              Image.asset(
                App.rightSideArrowLogo,
                height: 15,
                width: 15,
              ),
            ],
          ),
          onTap: () {
            // showAlertDialog(context);
          },
        ),
      ],
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
  listProperty() {
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
                        fontSize: 13,
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
              margin: EdgeInsets.only(top: 20, bottom: 20),
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
              margin: EdgeInsets.only(top: 20, bottom: 20),
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
              margin: EdgeInsets.only(top: 20, bottom: 20, right: 10),
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
  newListProperty() {
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
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      NewListPropertyScreen()));
                        },
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
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> PropertyDetailScreen()));
                    },
                    child: Container(
                      width: Utils.getDeviceWidth(context) / 1.25,
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
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      NonVerifiedTenantSellAllScreen()));
                        },
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
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => RewardBasketScreen()));
      },
      child: Image.asset(
        App.bannerDashLogo,
        height: 150,
        width: Utils.getDeviceWidth(context),
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
