import 'package:flutter/material.dart';
import 'file:///D:/LiveProject/ollapro_partner/lib/screens/login/login_screen.dart';
import 'package:ollapro_partner/common/app.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     theme: ThemeData(primaryColor: primaryColor, accentColor:secondaryColor),
      debugShowCheckedModeBanner: false,
      title: 'OllaPro Partner',
      home: LoginScreen(),
    );
  }
}
