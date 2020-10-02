import 'package:flutter/material.dart';
import 'package:ollapro_partner/common/app.dart';
import 'package:ollapro_partner/common/common_appbar.dart';
import 'package:ollapro_partner/common/utils.dart';
import 'property_details_screen_view_model.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class PropertyDetailScreen extends StatefulWidget {
  @override
  PropertyDetailScreenState createState() => PropertyDetailScreenState();
}

class PropertyDetailScreenState extends State<PropertyDetailScreen> {
  PropertyDetailsScreenViewModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: primaryColor,
          child: Stack(
            children: [
              appBarReward(context, "Green Heights"),
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
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      imageProperty(),
                      details(),
                      Container(
                        margin: EdgeInsets.only(
                            top: 20, bottom: 10, left: 10, right: 10),
                        height: 1,
                        width: Utils.getDeviceWidth(context),
                        color: secondaryColor,
                      ),
                      description(),
                      Container(
                        margin: EdgeInsets.only(
                            top: 15, bottom: 10, left: 10, right: 10),
                        height: 1,
                        width: Utils.getDeviceWidth(context),
                        color: secondaryColor,
                      ),
                      location(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  imageProperty() {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      child: Image.asset(
        App.property1Logo,
        height: Utils.getDeviceHeight(context) / 3,
        fit: BoxFit.cover,
        width: Utils.getDeviceWidth(context),
      ),
    );
  }
  startRatingCountShow(double startRating) {
    return Container(
      color: whiteMain,
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,children: <Widget>[
        starRating(startRating),
        SizedBox(
          width: 10,
        ),
        Text(
          "(152)",
          style: TextStyle(
              fontSize: 18, fontFamily: App.font, color: primaryColor),
        )
      ]),
    );
  }
  starRating(item) {
    return Container(
      color: whiteMain,
      alignment: Alignment.centerLeft,
      child: SmoothStarRating(
        size: 25,
        rating: item,
        filledIconData: Icons.star,
        //halfFilledIconData: Icons.star_half,
        defaultIconData: Icons.star_border,
        color: yellow,
        //color: Colors.yellow,
        borderColor: yellow,
        starCount: 5,
        allowHalfRating: true,
        spacing: 1.0,
      ),
    );
  }
  details(){
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(top: 20, left: 10),
          child: Text(
            "Green Heights",
            style: TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontFamily: App.font),
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(left: 10, top: 5),
          child: startRatingCountShow(4),
        ),
        Container(
          margin: EdgeInsets.only(top: 8, left: 10),
          child: Row(
            children: [
              Image.asset(
                App.locationLogo,
                height: 20,
                width: 20,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "Vaishali Nagar, Jaipur",
                style: TextStyle(
                    color: secondaryColor,
                    fontFamily: App.font,
                    fontSize: 18),
              )
            ],
          ),
        ),
      ],
    );
  }
  description(){
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(top: 10, left: 10),
          child: Text(
            "Description",
            style: TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 17,
                fontFamily: App.font),
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(top: 10, left: 10,right: 10),
          child: Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
            style: TextStyle(
                color: secondaryColor,
                fontSize: 15,
                fontFamily: App.font),
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }
  location(){
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(top: 10, left: 10),
          child: Text(
            "Location",
            style: TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 17,
                fontFamily: App.font),
          ),
        ),
      ],
    );
  }
}
