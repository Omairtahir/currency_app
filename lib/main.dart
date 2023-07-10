import 'package:admob/home.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';


void main() async {
  // Ensures that Flutter is initialized before running the app
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();

  // Runs the xau360 app
    runApp(xau360());
}

class xau360 extends StatelessWidget {
  const xau360({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Disables the debug banner in the app
      debugShowCheckedModeBanner: false,

      // Sets the title of the app
      title: 'XAu360',

      // Sets the home screen of the app to be SplashScreen
      home: HomeScreen(),
    );
  }
}

