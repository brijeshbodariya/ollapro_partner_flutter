import 'package:flutter/material.dart';
import 'package:ollapro_partner/common/app.dart';
import 'package:ollapro_partner/common/utils.dart';
import 'package:ollapro_partner/screens/dashboard/landlord/landlord_edit/landlord_edit_screen.dart';
import 'landlord_view_profile_screen_view_model.dart';


class LandLordViewProfileScreen extends StatefulWidget {
  @override
  LandLordViewProfileScreenState createState() => LandLordViewProfileScreenState();
}

class LandLordViewProfileScreenState extends State<LandLordViewProfileScreen> {
  LandLordViewProfileScreenViewModel model;

  @override
  Widget build(BuildContext context) {
    print("runtimeType -> " + runtimeType.toString());
    model ?? (model = LandLordViewProfileScreenViewModel(this));
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: primaryColor,
          child: Stack(
            children: [
              appBarProfile(),
              Container(
                height: Utils.getDeviceHeight(context),
                width: Utils.getDeviceWidth(context),
                margin: EdgeInsets.only(top: 60),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25)),
                    color: whiteMain),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25)),
                          color: whiteMain,
                        ),
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            dashBoard(),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      fullNameDisplay(),
                      SizedBox(
                        height: 10,
                      ),
                      emailDisplay(),
                      SizedBox(
                        height: 10,
                      ),
                      mobileDisplay(),
                      SizedBox(
                        height: 10,
                      ),
                      aadharDisplay(),
                      SizedBox(
                        height: 10,
                      ),
                      locationDisplay()
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  dashBoard() {
    return Container(
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.only(top: 20, bottom: 10),
              width: 120.0,
              height: 120.0,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        App.userImage,
                      )))),
          Container(
              margin: EdgeInsets.only(top: 5, bottom: 10),
              child: Text(
                "Saurabh Kumar",
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: App.font,
                    color: primaryColor,
                    fontWeight: FontWeight.bold),
              )),
        ],
      ),
    );
  }

  fullNameDisplay() {
    return Container(
      width: Utils.getDeviceWidth(context),
      color: white,
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(left: 10, top: 10, bottom: 5),
            child: Text(
              App.fullName,
              style: TextStyle(
                  color: primaryColor, fontFamily: App.font, fontSize: 15),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(left: 10, bottom: 10, top: 5),
            child: Row(
              children: [
                Image.asset(
                  App.personLogo,
                  color: primaryColor,
                  height: 20,
                  width: 20,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Saurabh Kumar",
                  style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  emailDisplay() {
    return Container(
      width: Utils.getDeviceWidth(context),
      color: white,
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(left: 10, top: 10, bottom: 5),
            child: Text(
              App.emailAddress,
              style: TextStyle(
                  color: primaryColor, fontFamily: App.font, fontSize: 15),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(left: 10, bottom: 10, top: 5),
            child: Row(
              children: [
                Image.asset(
                  App.emailLogo,
                  color: primaryColor,
                  height: 20,
                  width: 20,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "saurabhkumar@gmail.com",
                  style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  mobileDisplay() {
    return Container(
      width: Utils.getDeviceWidth(context),
      color: white,
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(left: 10, top: 10, bottom: 5),
            child: Text(
              App.mobileNumber,
              style: TextStyle(
                  color: primaryColor, fontFamily: App.font, fontSize: 15),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(left: 10, bottom: 10, top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      App.mobileLogo,
                      color: primaryColor,
                      height: 20,
                      width: 20,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "+91 9876543210",
                      style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Image.asset(
                        App.verifiedLogo,
                        height: 20,
                        width: 20,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5, right: 10),
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
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  aadharDisplay() {
    return Container(
      width: Utils.getDeviceWidth(context),
      color: white,
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(left: 10, top: 10, bottom: 5),
            child: Text(
              App.aadhar,
              style: TextStyle(
                  color: primaryColor, fontFamily: App.font, fontSize: 15),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(left: 10, bottom: 10, top: 5),
            child: Row(
              children: [
                Image.asset(
                  App.idLogo,
                  color: primaryColor,
                  height: 20,
                  width: 20,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "1234 5678 9012 3456",
                  style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  locationDisplay() {
    return Container(
      width: Utils.getDeviceWidth(context),
      color: white,
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(left: 10, top: 10, bottom: 5),
            child: Text(
              App.location,
              style: TextStyle(
                  color: primaryColor, fontFamily: App.font, fontSize: 15),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(left: 10, bottom: 10, top: 5),
            child: Row(
              children: [
                Image.asset(
                  App.locationLogo,
                  color: primaryColor,
                  height: 20,
                  width: 20,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "B Block ,Vaishali Nagar ,Jaipur",
                  style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  appBarProfile() {
    return Container(
      margin: EdgeInsets.only(left: 10, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
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
              SizedBox(
                width: 10,
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(
                  "User Name",
                  style: TextStyle(
                      color: white, fontFamily: App.font, fontSize: 20),
                ),
              ),
            ],
          ),
          Container(
              margin: EdgeInsets.only(right: 15),
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LandLordEditScreen()));
                  },
                  child: Text(
                    App.editProfile,
                    style: TextStyle(
                        fontSize: 18, color: white, fontFamily: App.font),
                  ))),
        ],
      ),
    );
  }
}
