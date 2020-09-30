import 'package:flutter/material.dart';
import 'package:ollapro_partner/common/app.dart';
import 'package:ollapro_partner/common/common_appbar.dart';
import 'package:ollapro_partner/common/utils.dart';
import 'package:ollapro_partner/model/grid_claim_reward.dart';
import 'package:ollapro_partner/screens/dashboard/reward_basket/scratch/offer_detail/offer_details.dart';
import 'package:ollapro_partner/screens/dashboard/reward_basket/scratch/scratch_screen_view_model.dart';

class ScratchScreen extends StatefulWidget {
  @override
  ScratchScreenState createState() => ScratchScreenState();
}

class ScratchScreenState extends State<ScratchScreen>
    with SingleTickerProviderStateMixin {
  ScratchScreenViewModel model;
  List<GridClaimReward> grid = List();
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 1200), vsync: this);
    _animation =
        CurvedAnimation(parent: _controller, curve: Curves.bounceInOut);

    _controller.forward();
    super.initState();
    grid.add(GridClaimReward(App.laptopLogo, "RP - 40000"));
    grid.add(GridClaimReward(App.phoneLogo, "RP - 36000"));
    grid.add(GridClaimReward(App.phoneLogo, "RP - 40000"));
    grid.add(GridClaimReward(App.laptopLogo, "RP - 24000"));
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("runtimeType -> " + runtimeType.toString());
    model ?? (model = ScratchScreenViewModel(this));

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: primaryColor,
          child: Stack(
            children: [
              appBarReward(context, App.claimRedeemTitle),
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
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: 15),
                        child: Text(
                          App.rewardCatalog,
                          style: TextStyle(
                              color: primaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: App.font),
                        ),
                      ),
                      ScaleTransition(
                        scale: _animation,
                        child: Container(
                          margin: EdgeInsets.only(top: 20, left: 10, right: 10),
                          child: GridView.count(
                            scrollDirection: Axis.vertical,
                            physics: NeverScrollableScrollPhysics(),
                            childAspectRatio: 9.5 / 10,
                            controller:
                                new ScrollController(keepScrollOffset: false),
                            crossAxisCount: 2,
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 10.0,
                            shrinkWrap: true,
                            children: List.generate(grid.length, (index) {
                              return InkWell(
                                onTap: () {
                                  getClickedReward(index);
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                          image: AssetImage(App.scratchLogo),
                                          fit: BoxFit.cover)),
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(top: 30),
                                        alignment: Alignment.center,
                                        child: Image.asset(
                                          grid[index].image,
                                          height: 100,
                                          width: 100,
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 10),
                                        alignment: Alignment.center,
                                        child: Text(
                                          grid[index].price,
                                          style: TextStyle(
                                              color: white, fontSize: 25),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
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

  getClickedReward(int index) {
    if (index == 0) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => OfferDetailsScreen()));
    } else if (index == 1) {
      Navigator.pop(context);
    } else if (index == 2) {
      Navigator.pop(context);
    } else if (index == 3) {
      Navigator.pop(context);
    }
  }
}
