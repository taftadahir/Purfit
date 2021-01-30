import 'dart:math';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:purfit/screens/manage_plan.dart';
import 'package:purfit/utilities/utilities.dart' as utils;

class Analytic extends StatefulWidget {
  @override
  _AnalyticState createState() => _AnalyticState();
}

class _AnalyticState extends State<Analytic> {
  List<charts.Series> seriesList;
  static List<charts.Series<Sales, String>> _createRandomData() {
    final random = Random();
    final desktopSalesData = [
      Sales('2015', random.nextInt(100)),
      Sales('2016', random.nextInt(100)),
      Sales('2017', random.nextInt(100)),
      Sales('2018', random.nextInt(100)),
      Sales('2019', random.nextInt(100)),
      Sales('2020', random.nextInt(100)),
      Sales('2021', random.nextInt(100)),
    ];

    return [
      charts.Series(
        id: 'Sales',
        data: desktopSalesData,
        domainFn: (Sales sales, _) => sales.year,
        measureFn: (Sales sales, _) => sales.sales,
        fillColorFn: (Sales sales, _) => sales.sales < 60 ? charts.MaterialPalette.red.shadeDefault : charts.MaterialPalette.green.shadeDefault,
      )
    ];
  }

  @override
  void initState() {
    super.initState();
    seriesList = _createRandomData();
  }

  barChart() {
    return charts.BarChart(
      seriesList,
      animate: true,
      animationDuration: Duration(seconds: 2),
      vertical: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: utils.blackLight,
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          utils.getAppBar(
            true,
            'Analytics',
            Container(
              margin: EdgeInsets.only(
                top: 25.0,
                left: 10.0,
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.keyboard_backspace_rounded,
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ManagePlan(),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.refresh,
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
                  utils.getAnalyticHeader(3),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 20.0,
                    ),
                    decoration: BoxDecoration(
                      color: utils.black,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: CircularPercentIndicator(
                      animation: true,
                      circularStrokeCap: CircularStrokeCap.round,
                      animationDuration: 5000,
                      startAngle: 0,
                      backgroundColor: utils.grey.withOpacity(.4),
                      percent: .8,
                      radius: (MediaQuery.of(context).size.width - 100) / 2,
                      lineWidth: 10,
                      progressColor: utils.green,
                      curve: Curves.decelerate,
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  utils.getAnalyticHeader(2),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    height: 200.0,
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 20.0,
                    ),
                    decoration: BoxDecoration(
                      color: utils.black,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: barChart(),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  utils.getAnalyticHeader(1),
                  SizedBox(
                    height: 20.0,
                  ),
                  utils.getExerciseAnalytic('exerciseName', '2 : 30', '2 : 10', false),
                  SizedBox(
                    height: 20.0,
                  ),
                  utils.getExerciseAnalytic('exerciseName', '2 : 30', '2 : 10', false),
                  SizedBox(
                    height: 20.0,
                  ),
                  utils.getExerciseAnalytic('exerciseName', '2 : 30', '2 : 30', true),
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

class Sales {
  final String year;
  final int sales;
  Sales(this.year, this.sales);
}
