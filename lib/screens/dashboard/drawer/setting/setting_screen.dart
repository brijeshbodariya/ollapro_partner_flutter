import 'package:flutter/material.dart';
import 'package:ollapro_partner/common/app.dart';
import 'package:ollapro_partner/common/common_appbar.dart';
import 'package:ollapro_partner/common/common_button.dart';
import 'package:ollapro_partner/common/utils.dart';
import 'package:ollapro_partner/screens/dashboard/drawer/change_password/chnage_password_screen.dart';
import 'package:ollapro_partner/screens/dashboard/drawer/my_profile/edit_profile_screen/edit_profile.dart';

import 'setting_screen_view_model.dart';

class SettingScreen extends StatefulWidget {
  @override
  SettingScreenState createState() => SettingScreenState();
}

class SettingScreenState extends State<SettingScreen> {
  SettingScreenViewModel model;

  @override
  Widget build(BuildContext context) {
    print("runtimeType -> " + runtimeType.toString());
    model ?? (model = SettingScreenViewModel(this));
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: primaryColor,
          child: Stack(
            children: [
              appBarReward(context, App.settingDrawer),
              Container(
                height: Utils.getDeviceHeight(context),
                width: Utils.getDeviceWidth(context),
                margin: EdgeInsets.only(top: 60),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25)),
                    color: whiteMain),
                child: Column(
                  children: [

                    //edit profile
                  getButton(App.editProfile,onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> EditProfileScreen()));
                  }),
                    //change password
                    getButton(App.changePasswordDrawer,onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> ChangePasswordScreen()));
                    }),

                    //App version
                    getButton(App.appVersionDrawer),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}
