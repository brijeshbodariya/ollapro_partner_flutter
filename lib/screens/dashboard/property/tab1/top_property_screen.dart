import 'package:flutter/material.dart';
import 'package:ollapro_partner/common/app.dart';
import 'package:ollapro_partner/common/utils.dart';
import 'package:ollapro_partner/model/newPropertiesList.dart';
import 'package:ollapro_partner/screens/dashboard/property/tab1/top_property_screen_view_model.dart';

class TopPropertyScreen extends StatefulWidget {
  @override
  TopPropertyScreenState createState() => TopPropertyScreenState();
}

class TopPropertyScreenState extends State<TopPropertyScreen> {
  TopPropertyScreenViewModel model;
  List<NewPropertyList> list = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    list.add(NewPropertyList(
        "Green Heights", App.property1Logo, "Jaipur", "Appartment"));
    list.add(NewPropertyList(
        "Green Heights", App.property1Logo, "Jaipur", "Duplex"));
    list.add(NewPropertyList(
        "Green Heights", App.property1Logo, "Jaipur", "Villa"));
    list.add(NewPropertyList(
        "Green Heights", App.property1Logo, "Jaipur", "Appartment"));
  }
  @override
  Widget build(BuildContext context) {
    print("runtimeType -> " + runtimeType.toString());
    model ?? (model = TopPropertyScreenViewModel(this));
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: list.length,
              itemBuilder: (context, index) {
                return Container(
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
                          width: 80,
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
      ),
    );
  }
}
