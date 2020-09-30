import 'package:flutter/material.dart';
import 'package:ollapro_partner/common/app.dart';
import 'package:ollapro_partner/common/common_appbar.dart';
import 'package:ollapro_partner/common/common_button.dart';
import 'package:ollapro_partner/common/utils.dart';
import 'package:ollapro_partner/screens/dashboard/reward_basket/scratch/offer_detail/offer_details_view_model.dart';

class OfferDetailsScreen extends StatefulWidget {
  @override
  OfferDetailsScreenState createState() => OfferDetailsScreenState();
}

class OfferDetailsScreenState extends State<OfferDetailsScreen>
    with SingleTickerProviderStateMixin {
  OfferDetailScreenViewModel model;
  AnimationController animation;
  Animation<double> _fadeInFadeOut;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animation = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );
    _fadeInFadeOut = Tween<double>(begin: 0.0, end: 1).animate(animation);
    animation.forward();
    animation.addStatusListener((status) {});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("runtimeType -> " + runtimeType.toString());
    model ?? (model = OfferDetailScreenViewModel(this));
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: primaryColor,
          child: Stack(
            children: [
              appBarReward(context, App.offerDetailTitle),
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
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                          child: Image.asset(
                            App.laptopWinnerLogo,
                            height: Utils.getDeviceHeight(context) / 2.5,
                            fit: BoxFit.cover,
                            width: Utils.getDeviceWidth(context),
                          ),
                        ),
                        giftName(),
                        giftDivideLine(),
                        Container(
                          margin: EdgeInsets.only(left: 10, top: 15),
                          alignment: Alignment.topLeft,
                          child: Text(
                            App.offerDetailTitle,
                            style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                        giftDetails(),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(top: 10),
        child: commonButton(
          context,
          buttonName: App.claimNowButton,
        ),
      ),
    );
  }

  giftName() {
    return Container(
      margin: EdgeInsets.only(left: 10, top: 20),
      child: Row(
        children: [
          Image.asset(
            App.giftLogo,
            height: 80,
            width: 80,
          ),
          Container(
            margin: EdgeInsets.only(left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Lenovo Ideapad',
                  textAlign: TextAlign.left,
                  maxLines: 4,
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                      fontFamily: App.font),
                ),
                Container(
                  margin: EdgeInsets.only(top: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 30,
                        width: 30,
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            color: primaryColor, shape: BoxShape.circle),
                        child: Text(
                          "RP",
                          style: TextStyle(color: white, fontFamily: App.font),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 3),
                        child: Text(
                          '32000',
                          style: TextStyle(
                              fontSize: 20,
                              color: yellow,
                              fontFamily: App.font),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  giftDivideLine() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: 1,
      width: Utils.getDeviceWidth(context),
      color: secondaryColor,
    );
  }

  giftDetails() {
    return Container(
      margin: EdgeInsets.only(left: 10, top: 10),
      alignment: Alignment.topLeft,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 20,
                width: 20,
                child: Image.asset(App.dotLogo),
              ),
              SizedBox(
                width: 8,
              ),
              Flexible(
                child: Text(
                  "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups",
                  textAlign: TextAlign.left,
                  maxLines: 4,
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                      color: primaryColor, fontSize: 15, fontFamily: App.font),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 20,
                width: 20,
                child: Image.asset(App.dotLogo),
              ),
              SizedBox(
                width: 8,
              ),
              Flexible(
                child: Text(
                  "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups",
                  textAlign: TextAlign.left,
                  maxLines: 4,
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                      color: primaryColor, fontSize: 15, fontFamily: App.font),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 20,
                width: 20,
                child: Image.asset(App.dotLogo),
              ),
              SizedBox(
                width: 8,
              ),
              Flexible(
                child: Text(
                  "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups",
                  textAlign: TextAlign.left,
                  maxLines: 4,
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                      color: primaryColor, fontSize: 15, fontFamily: App.font),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
