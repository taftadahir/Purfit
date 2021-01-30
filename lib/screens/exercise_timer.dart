import 'package:flutter/material.dart';
import 'package:purfit/utilities/utilities.dart' as utils;

class TimerExercise extends StatefulWidget {
  @override
  _TimerExerciseState createState() => _TimerExerciseState();
}

class _TimerExerciseState extends State<TimerExercise> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: utils.blackLight,
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          utils.getAppBar(
            true,
            'Exercise name',
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
                    utils.getNextExercise(context);
                  },
                  icon: Icon(
                    Icons.last_page_rounded,
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
                    'But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete and praising pain was born and I will give you a complete',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Montserrat',
                      color: utils.white,
                      height: 1.8,
                    ),
                    maxLines: 3,
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "Day 2",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                          color: utils.white,
                        ),
                      ),
                      Text(
                        'Echauffement',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                          color: utils.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  utils.getExerciseProc(false),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '00 : 30',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                          color: utils.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FlatButton(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: utils.white,
                          ),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        onPressed: () {},
                        child: Center(
                          child: Text(
                            'Restart',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Montserrat',
                              color: utils.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      FlatButton(
                        padding: EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 15,
                        ),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: utils.primary,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        onPressed: () {},
                        child: Center(
                          child: Text(
                            'Start',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Montserrat',
                              color: utils.primary,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      FlatButton(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: utils.white,
                          ),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        onPressed: () {},
                        child: Center(
                          child: Text(
                            'Skip',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Montserrat',
                              color: utils.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  utils.getFinishButton('Finish'),
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
