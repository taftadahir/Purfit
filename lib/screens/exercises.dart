import 'package:flutter/material.dart';
import 'package:purfit/utilities/utilities.dart' as utils;

class Exercises extends StatefulWidget {
  @override
  _ExercisesState createState() => _ExercisesState();
}

class _ExercisesState extends State<Exercises> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: utils.blackLight,
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          utils.getAppBar(
            true,
            'Exercises',
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
                  Icons.arrow_back_rounded,
                ),
              ),
            ),
            [
              Container(
                margin: EdgeInsets.only(
                  top: 25.0,
                  right: 10.0,
                ),
                child: IconButton(
                  icon: Icon(Icons.filter_list_rounded),
                  onPressed: () {
                    // Show a bottom container to filter the list
                    utils.showSnackBar(context);
                  },
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 60.0,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Column(
                children: [
                  utils.getExercise(
                    'Exercise name',
                    true,
                    false,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
              childCount: 20,
            ),
          ),
          SliverFillRemaining(),
        ],
      ),
    );
  }
}
