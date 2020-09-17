import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ollapro_partner/common/app.dart';
import 'package:ollapro_partner/common/utils.dart';
import 'transfer_screen_view_model.dart';

class TransferScreen extends StatefulWidget {
  @override
  TransferScreenState createState() => TransferScreenState();
}

class TransferScreenState extends State<TransferScreen> {
  TransferScreenViewModel model;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print("runtimeType -> " + runtimeType.toString());
    model ?? (model = TransferScreenViewModel(this));
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: primaryColor,
          child: Stack(
            children: [
              appBar(),
              Container(
                  height: Utils.getDeviceHeight(context),
                  width: Utils.getDeviceWidth(context),
                  margin: EdgeInsets.only(top: 55),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25)),
                      color: white),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: 30, left: 15, right: 15, bottom: 15),
                        child: TextFormField(
                          style: TextStyle(
                            color: primaryColor,
                            fontFamily: App.font,
                          ),
                          textAlign: TextAlign.center,
                          controller: controller,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40)),
                              errorStyle:
                                  TextStyle(color: red, fontFamily: App.font),
                              hintStyle: TextStyle(
                                  color: secondaryColor, fontFamily: App.font),
                              focusColor: grey,
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(40),
                                  borderSide: BorderSide(color: grey)),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                                borderSide: BorderSide(
                                  color: red,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: red)),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                                borderSide: BorderSide(
                                  color: grey,
                                ),
                              ),
                              hintText: 'Enter Amount'),
                          keyboardType: TextInputType.phone,
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 60,
                        width: Utils.getDeviceWidth(context),
                        margin: EdgeInsets.only(left: 15, right: 15, top: 10),
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(40)),
                        child: Text(
                          App.debitAmount,
                          style: TextStyle(
                              color: white, fontFamily: App.font, fontSize: 20),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          margin: EdgeInsets.only(top:50,left: 10,right: 10),
                          child: Column(
                            children: [
                              Text(
                                "Note:",
                                style: TextStyle(color: primaryColor, fontSize: 15,fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups",
                                textAlign: TextAlign.center,

                                style: TextStyle(color: secondaryColor, fontSize: 15),
                              )
                            ],
                          ),
                        ),
                      ),

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

  appBar() {
    return Container(
      height: 50,
      margin: EdgeInsets.only(left: 10),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(
              App.arrowBack,
              color: white,
              height: 25,
              width: 25,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Text(
              App.transfer,
              style:
                  TextStyle(color: white, fontFamily: App.font, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
