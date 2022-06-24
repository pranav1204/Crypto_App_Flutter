import 'package:crypto_app_flutter/login_activity/screen.dart';
import 'package:crypto_app_flutter/data/theme_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  //nomics api key -> 8a1a91ee8c13a4d67af8cac88ba689a1ac124a96
  //messari api key -> ed37c3d9-43af-4528-85a9-1fe47c237ed6

  //http model -> https://data.messari.io/api/v2/assets?fields=id,slug,symbol,name,metrics/market_data&limit=500

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        defaultTransition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 500),
        debugShowCheckedModeBanner: false,
        title: 'Crypto App',
        home: const HomePage(),
        themeMode: ThemeMode.system,
        theme: Mythemes.lightModeTheme,
        darkTheme: Mythemes.darkModeTheme,
      );
    });
  }
}