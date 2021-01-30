import 'package:flutter/material.dart';
import 'package:purfit/screens/exercises.dart';
import 'package:purfit/utilities/utilities.dart' as utils;

class SideBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      color: utils.blackLight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: screenSize.height * .3,
            child: Stack(
              children: [
                Opacity(
                  opacity: .35,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [utils.black, utils.primary],
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: utils.radiusAppBar,
                        bottomRight: utils.radiusAppBar,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      bottom: 30.0,
                      left: 100.0,
                    ),
                    child: Text(
                      utils.appName,
                      style: TextStyle(
                        fontSize: 35.0,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        color: utils.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  utils.getSideBarItem(context, Icons.list, 'Exercises', Exercises()),
                  SizedBox(
                    height: 40.0,
                  ),
                  utils.getSideBarItem(context, Icons.dashboard_outlined, 'Workouts', Exercises()),
                  SizedBox(
                    height: 40.0,
                  ),
                  utils.getSideBarItem(context, Icons.restore, 'Restart progress', Exercises()),
                  SizedBox(
                    height: 40.0,
                  ),
                  utils.getSideBarItem(context, Icons.bar_chart_outlined, 'Analytics', Exercises()),
                ],
              ),
            ),
          ),
          Container(
            height: screenSize.height * .15,
            child: Center(
              child: Text(
                utils.fullName,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                  color: utils.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
