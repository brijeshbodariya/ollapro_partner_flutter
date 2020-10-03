

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ollapro_partner/common/app.dart';
import 'package:ollapro_partner/common/common_appbar.dart';
import 'package:ollapro_partner/common/utils.dart';
import 'dart:async';
import 'property_details_screen_view_model.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class PropertyDetailScreen extends StatefulWidget {
  @override
  PropertyDetailScreenState createState() => PropertyDetailScreenState();
}

class PropertyDetailScreenState extends State<PropertyDetailScreen> {
  PropertyDetailsScreenViewModel model;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String _mapStyle;

  // GlobalKey<GoogleMapStateBase> _key = GlobalKey<GoogleMapStateBase>();

  BitmapDescriptor pinLocationIcon;
  Set<Marker> _markers = {};
  Completer<GoogleMapController> googleController = Completer();
  static LatLng _initialPosition;
  static LatLng _lastMapPosition = _initialPosition;
  static const LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    googleController.complete(controller);
  }


  @override
  void initState() {
    super.initState();
    setCustomMapPin();
  }


  void setCustomMapPin() async {
    Position position =
        await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    _initialPosition = LatLng(position.latitude, position.longitude);
    pinLocationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 5), App.pinLogo);
    print(_initialPosition);
  }

  _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  @override
  Widget build(BuildContext context) {
    print("runtimeType -> " + runtimeType.toString());
    model ?? (model = PropertyDetailsScreenViewModel(this));

    return Scaffold(
      key: _scaffoldKey,
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
                      locationTitle(),
                      _initialPosition == null
                          ? Container(
                              margin: EdgeInsets.only(
                                  left: 10, right: 10, top: 10, bottom: 20),
                              height: Utils.getDeviceHeight(context) / 3,
                              width: Utils.getDeviceWidth(context),
                              child: GoogleMap(
                                onMapCreated: _onMapCreated,
                                initialCameraPosition: CameraPosition(
                                  target: _center,
                                  zoom: 11.0,
                                ),
                              ),
                            )
                          : Container(
                              margin: EdgeInsets.only(
                                  left: 10, right: 10, top: 10, bottom: 20),
                              height: Utils.getDeviceHeight(context) / 3,
                              width: Utils.getDeviceWidth(context),
                              child: GoogleMap(
                                  myLocationEnabled: false,
                                  compassEnabled: true,
                                  markers: _markers,
                                onCameraMove: _onCameraMove,
                                  initialCameraPosition: CameraPosition(
                                    target: _initialPosition,
                                    zoom: 12,
                                  ),
                                  zoomGesturesEnabled: true,
                                onMapCreated: (GoogleMapController controller){
                                  googleController.complete(controller);
                                    setState(() {
                                      _markers.add(Marker(
                                        markerId: MarkerId('<MARKER_ID>'),
                                                position: _initialPosition,
                                                icon: pinLocationIcon
                                      ));
                                    });
                                },
                                  // onMapCreated:
                                  //     (GoogleMapController controller) {
                                  //   controller
                                  //       .setMapStyle(MapsGoogle.mapStyles);
                                  //   _controller.complete(controller);
                                  //   setState(() {
                                  //     _markers.add(Marker(
                                  //         markerId: MarkerId('<MARKER_ID>'),
                                  //         position: _initialPosition,
                                  //         icon: pinLocationIcon));
                                  //   });
                                  // })),
                              ))],
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
      child:
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
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

  details() {
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
                    color: secondaryColor, fontFamily: App.font, fontSize: 18),
              )
            ],
          ),
        ),
      ],
    );
  }

  description() {
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
          margin: EdgeInsets.only(top: 10, left: 10, right: 10),
          child: Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
            style: TextStyle(
                color: secondaryColor, fontSize: 15, fontFamily: App.font),
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }

  locationTitle() {
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

class MapsGoogle {
  static String mapStyles = [
    {
      "elementType": "geometry",
      "stylers": [
        {"color": "#f5f5f5"}
      ]
    },
    {
      "elementType": "labels.icon",
      "stylers": [
        {"visibility": "off"}
      ]
    },
    {
      "elementType": "labels.text.fill",
      "stylers": [
        {"color": "#616161"}
      ]
    },
    {
      "elementType": "labels.text.stroke",
      "stylers": [
        {"color": "#f5f5f5"}
      ]
    },
    {
      "featureType": "administrative.land_parcel",
      "elementType": "labels.text.fill",
      "stylers": [
        {"color": "#bdbdbd"}
      ]
    },
    {
      "featureType": "poi",
      "elementType": "geometry",
      "stylers": [
        {"color": "#eeeeee"}
      ]
    },
    {
      "featureType": "poi",
      "elementType": "labels.text.fill",
      "stylers": [
        {"color": "#757575"}
      ]
    },
    {
      "featureType": "poi.park",
      "elementType": "geometry",
      "stylers": [
        {"color": "#e5e5e5"}
      ]
    },
    {
      "featureType": "poi.park",
      "elementType": "labels.text.fill",
      "stylers": [
        {"color": "#9e9e9e"}
      ]
    },
    {
      "featureType": "road",
      "elementType": "geometry",
      "stylers": [
        {"color": "#ffffff"}
      ]
    },
    {
      "featureType": "road.arterial",
      "elementType": "labels.text.fill",
      "stylers": [
        {"color": "#757575"}
      ]
    },
    {
      "featureType": "road.highway",
      "elementType": "geometry",
      "stylers": [
        {"color": "#dadada"}
      ]
    },
    {
      "featureType": "road.highway",
      "elementType": "labels.text.fill",
      "stylers": [
        {"color": "#616161"}
      ]
    },
    {
      "featureType": "road.local",
      "elementType": "labels.text.fill",
      "stylers": [
        {"color": "#9e9e9e"}
      ]
    },
    {
      "featureType": "transit.line",
      "elementType": "geometry",
      "stylers": [
        {"color": "#e5e5e5"}
      ]
    },
    {
      "featureType": "transit.station",
      "elementType": "geometry",
      "stylers": [
        {"color": "#eeeeee"}
      ]
    },
    {
      "featureType": "water",
      "elementType": "geometry",
      "stylers": [
        {"color": "#c9c9c9"}
      ]
    },
    {
      "featureType": "water",
      "elementType": "labels.text.fill",
      "stylers": [
        {"color": "#9e9e9e"}
      ]
    }
  ] as String;
}
