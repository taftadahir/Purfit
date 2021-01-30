import 'dart:async';

import 'package:flutter/material.dart';
import 'package:purfit/screens/home.dart';
import 'package:purfit/utilities/utilities.dart' as utils;
import 'package:shimmer/shimmer.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
      utils.splashDuration,
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => Home(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: utils.black,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  child: Text(
                    utils.fullName,
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      color: utils.grey,
                    ),
                  ),
                ),
              ),
            ),
            Shimmer.fromColors(
              highlightColor: utils.white.withOpacity(.5),
              baseColor: utils.primary,
              child: Container(
                child: Text(
                  utils.appName,
                  style: TextStyle(
                    fontSize: 60,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                    color: utils.primary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
