import 'package:flutter/material.dart';
import 'package:ollapro_partner/common/app.dart';
import 'package:ollapro_partner/common/utils.dart';
import 'package:ollapro_partner/model/notification.dart';
import 'package:ollapro_partner/screens/dashboard/notification/notification_view_model.dart';

class NotificationScreen extends StatefulWidget {
  @override
  NotificationScreenState createState() => NotificationScreenState();
}

class NotificationScreenState extends State<NotificationScreen> {
  NotificationViewModel model;
  List<NotificationModel> list = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    list.add(NotificationModel(
        App.home1,
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
        "1 hour ago"));
    list.add(NotificationModel(
        App.home2,
        "Lorem Ipsum is simply dummy text of the printing and typesetting ",
        "3 hour ago"));
    list.add(NotificationModel(
        App.home1,
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
        "2 hour ago"));
    list.add(NotificationModel(
        App.home2,
        "Lorem Ipsum is simply dummy text of the printing and typesetting ",
        "4 hour ago"));
    list.add(NotificationModel(
        App.home1,
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
        "6 hour ago"));
    list.add(NotificationModel(
        App.home2,
        "Lorem Ipsum is simply dummy text of the printing and typesetting ",
        "5 hour ago"));
    list.add(NotificationModel(
        App.home1,
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
        "8 hour ago"));
    list.add(NotificationModel(
        App.home2,
        "Lorem Ipsum is simply dummy text of the printing and typesetting ",
        "7 hour ago"));
    list.add(NotificationModel(
        App.home1,
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
        "8 hour ago"));
    list.add(NotificationModel(
        App.home2,
        "Lorem Ipsum is simply dummy text of the printing and typesetting ",
        "7 hour ago"));
  }

  @override
  Widget build(BuildContext context) {
    print("runtimeType -> " + runtimeType.toString());
    model ?? (model = NotificationViewModel(this));
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: primaryColor,
          child: Stack(
            children: [
              appBarDash(),
              Container(
                  height: Utils.getDeviceHeight(context),
                  width: Utils.getDeviceWidth(context),
                  margin: EdgeInsets.only(top: 60),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25)),
                      color: whiteMain),
                  child: Container(
                    margin: EdgeInsets.only(top: 15),
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: list.length,
                      separatorBuilder: (context, index){
                        return Container(
                          height: 1,
                          margin: EdgeInsets.only(left: 10,right: 10,top: 5),
                          color: secondaryColor,
                          width: Utils.getDeviceWidth(context),
                        );
                      },
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(top: 10,bottom: 5,left: 10),
                          color: whiteMain,
                          child: Row(
                            children: [
                              Image.asset(
                                list[index].image,
                                height: 60,
                                width: 60,
                              ),
                              Container(
                                width: Utils.getDeviceWidth(context) - 100,
                                margin: EdgeInsets.only(left: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      list[index].text,
                                      style: TextStyle(
                                          fontFamily: App.font,
                                          fontSize: 15,
                                          color: primaryColor),
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      list[index].time,
                                      style: TextStyle(
                                          fontFamily: App.font,
                                          fontSize: 15,
                                          color: secondaryColor),
                                      textAlign: TextAlign.left,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  appBarDash() {
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
                  App.notificationTitle,
                  style: TextStyle(
                      color: white, fontFamily: App.font, fontSize: 20),
                ),
              ),
            ],
          ),
          Container(
              margin: EdgeInsets.only(right: 15),
              child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    App.clearAll,
                    style: TextStyle(
                        fontSize: 18, color: white, fontFamily: App.font),
                  ))),
        ],
      ),
    );
  }
}
