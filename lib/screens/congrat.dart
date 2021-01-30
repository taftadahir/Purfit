import 'package:flutter/material.dart';
import 'package:purfit/screens/home.dart';
import 'package:purfit/utilities/utilities.dart' as utils;

class Congrat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: utils.blackLight,
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          utils.getAppBar(
            true,
            'Congratulation',
            Container(
              margin: EdgeInsets.only(
                top: 25.0,
                left: 10.0,
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home(),
                    ),
                  );
                },
                icon: Icon(
                  Icons.home_rounded,
                  color: utils.white,
                ),
              ),
            ),
            [
              Container(
                margin: EdgeInsets.only(
                  top: 25.0,
                  right: 0.0,
                ),
                child: IconButton(
                  onPressed: () {
                    /*Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AnalyticScreen(),
                      ),
                    );*/
                  },
                  icon: Icon(
                    Icons.bar_chart_rounded,
                    color: utils.white,
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  SizedBox(
                    height: 50.0,
                  ),
                  Text(
                    'Good job',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Montserrat',
                      color: utils.white,
                      height: 1.8,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete and praising pain was born and I will give you a complete',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Montserrat',
                      color: utils.white,
                      height: 1.8,
                    ),
                    maxLines: 3,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Taftadjani Dahirou',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Montserrat',
                          color: utils.white,
                          height: 1.8,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 80.0,
                  ),
                  Text(
                    "Today's session",
                    style: TextStyle(
                      fontSize: 22.0,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      color: utils.white,
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  utils.getExerciseAnalytic('Exercise name 1', '2 : 30', '2 : 30', true),
                  SizedBox(
                    height: 30.0,
                  ),
                  utils.getExerciseAnalytic('Exercise name 2', '2 : 30', '1 : 30', false),
                ],
              ),
            ),
          ),
          SliverFillRemaining(),
        ],
      ),
    );
  }
}
