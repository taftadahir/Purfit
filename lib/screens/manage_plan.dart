import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:purfit/screens/choose_exercise.dart';
import 'package:purfit/screens/exercise_timer.dart';
import 'package:purfit/utilities/utilities.dart' as utils;

class ManagePlan extends StatefulWidget {
  @override
  _ManagePlanState createState() => _ManagePlanState();
}

class _ManagePlanState extends State<ManagePlan> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: utils.blackLight,
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          utils.getAppBar(
            true,
            'Plan name',
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
                  Icons.clear_rounded,
                  color: utils.error,
                ),
              ),
            ),
            [
              Container(
                margin: EdgeInsets.only(
                  top: 25.0,
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.done_outline_rounded,
                    color: utils.primary,
                  ),
                  onPressed: () {},
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 25.0,
                  right: 10.0,
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TimerExercise(),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.play_arrow_outlined,
                    color: utils.primary,
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
                    height: 30.0,
                  ),
                  SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        utils.getPlanDay('1', false),
                        SizedBox(
                          width: 10.0,
                        ),
                        utils.getPlanDay('2', false),
                        SizedBox(
                          width: 10.0,
                        ),
                        utils.getPlanDay('3', false),
                        SizedBox(
                          width: 10.0,
                        ),
                        utils.getPlanDay('4', false),
                        SizedBox(
                          width: 10.0,
                        ),
                        utils.getPlanDay('5', true),
                        SizedBox(
                          width: 10.0,
                        ),
                        utils.getPlanDay('6', false),
                        SizedBox(
                          width: 10.0,
                        ),
                        utils.getPlanDay('7', false),
                        SizedBox(
                          width: 10.0,
                        ),
                        utils.getPlanDay('8', false),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  utils.getPlanHeader(
                    'Echauffement',
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  utils.getExercisePlan(context, false, ChooseExercise()),
                  SizedBox(
                    height: 30.0,
                  ),
                  utils.getExercisePlan(context, true, ChooseExercise()),
                  SizedBox(
                    height: 10.0,
                  ),
                  utils.getPausePlan(),
                  SizedBox(
                    height: 30.0,
                  ),
                  utils.getActionsPlan(),
                  SizedBox(
                    height: 50.0,
                  ),
                  utils.getPlanHeader(
                    'Exercises',
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  utils.getExercisePlan(context, true, ChooseExercise()),
                  SizedBox(
                    height: 30.0,
                  ),
                  utils.getExercisePlan(context, false, ChooseExercise()),
                  SizedBox(
                    height: 10.0,
                  ),
                  utils.getPausePlan(),
                  SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 60.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: utils.white,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        child: Center(
                          child: InkWell(
                            child: Icon(
                              Icons.watch_later_outlined,
                              color: utils.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 25.0,
                      ),
                      Expanded(
                        child: DottedBorder(
                          color: utils.white,
                          borderType: BorderType.RRect,
                          dashPattern: [6, 6, 6, 6],
                          radius: Radius.circular(5.0),
                          padding: EdgeInsets.zero,
                          strokeCap: StrokeCap.round,
                          child: FlatButton(
                            onPressed: () {},
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10.0,
                              ),
                              child: Center(
                                child: Text(
                                  'Add exercise',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w400,
                                    color: utils.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
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
