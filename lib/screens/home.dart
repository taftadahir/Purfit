import 'package:flutter/material.dart';
import 'package:purfit/screens/add_plan.dart';
import 'package:purfit/screens/manage_plan.dart';
import 'package:purfit/screens/sidebar.dart' as screen;
import 'package:purfit/utilities/utilities.dart' as utils;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  bool isCollapsed = true;
  AnimationController _controller;
  Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: utils.animationDuration);
    _scaleAnimation = Tween<double>(begin: 1, end: .6).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: utils.primary,
      body: Stack(
        children: [
          screen.SideBar(),
          AnimatedPositioned(
            top: 0,
            bottom: 0,
            left: isCollapsed ? 0 : 0.65 * screenSize.width,
            right: isCollapsed ? 0 : -.4 * screenSize.width,
            duration: utils.animationDuration,
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: Material(
                color: utils.blackLight,
                animationDuration: utils.animationDuration,
                shadowColor: utils.black,
                borderRadius: BorderRadius.only(
                  bottomLeft: isCollapsed ? utils.radiusZero : utils.radiusAppBar,
                  topLeft: isCollapsed ? utils.radiusZero : utils.radiusAppBar,
                ),
                elevation: 5,
                child: CustomScrollView(
                  physics: BouncingScrollPhysics(),
                  slivers: [
                    utils.getAppBar(
                      isCollapsed,
                      utils.appName,
                      Container(
                        margin: EdgeInsets.only(
                          top: 25.0,
                          left: 10.0,
                        ),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              if (isCollapsed)
                                _controller.forward();
                              else
                                _controller.reverse();
                              isCollapsed = !isCollapsed;
                            });
                          },
                          icon: Icon(isCollapsed ? Icons.menu_rounded : Icons.arrow_back),
                        ),
                      ),
                      [
                        Container(
                          margin: EdgeInsets.only(
                            top: 25.0,
                            right: 10.0,
                          ),
                          child: IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              // Show add plan screen
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddPlan(),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 50.0,
                          bottom: 30.0,
                          left: 20.0,
                          right: 20.0,
                        ),
                        child: Text(
                          'Active workouts',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            color: utils.grey,
                          ),
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => Column(
                          children: [
                            utils.getWorkout(
                              context,
                              ManagePlan(),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                        childCount: 2,
                      ),
                    ),
                    SliverFillRemaining(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
