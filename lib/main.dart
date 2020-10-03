import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ollapro_partner/common/app.dart';
import 'package:ollapro_partner/screens/splash/splashscreen.dart';



void main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  // GoogleMap.init('AIzaSyBbRebrQXBFyRcSYWx2RfqEd769V6BlOgo');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     theme: ThemeData(primaryColor: primaryColor, accentColor:secondaryColor),
      debugShowCheckedModeBanner: false,
      title: 'OllaPro Partner',
      home: SplashScreen(),
    );
  }
}
