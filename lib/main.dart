import 'package:bafdo/pages/splash_Screen_page.dart';
import 'package:bafdo/provider/auth_provider.dart';
import 'package:bafdo/provider/public_provider.dart';
import 'package:bafdo/provider/sqlite_database_helper.dart';
import 'package:bafdo/provider/user_provider.dart';
import 'package:bafdo/variables/color_variable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarColor: BColors.appBgColor,
          statusBarIconBrightness: Brightness.dark ///StatusBar iconColor
      ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => PublicProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => DatabaseHelper()),
      ],
      child: MaterialApp(
        //locale: DevicePreview.locale(context), // Add the locale here
        //builder: DevicePreview.appBuilder,
        title: 'Bafdo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.pink,
            backgroundColor: Color(0xffEFF9F9),
            canvasColor: Colors.transparent),
        home: SplashScreenPage(),
      ),
    );
  }
}
