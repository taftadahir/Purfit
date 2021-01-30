import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:purfit/screens/splash.dart';
import 'package:purfit/utilities/utilities.dart' as utils;

void main() => runApp(PurFit());

class PurFit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return MaterialApp(
      title: 'Pur Fit',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: utils.createMaterialColor(utils.white),
        backgroundColor: utils.createMaterialColor(utils.black),
        primaryColor: utils.createMaterialColor(utils.primary),
        accentColor: utils.createMaterialColor(utils.grey),
        errorColor: utils.createMaterialColor(utils.error),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Splash(),
    );
  }
}
