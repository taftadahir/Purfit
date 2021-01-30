import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

// App colors
final Color primary = Color(0xFF457B9D);
final Color white = Color(0xFFDAE2E5);
final Color grey = Color(0xFF6B6F78);
final Color error = Color(0xFFE63946);
final Color green = Color(0xFF2A9D8F);
final Color black = Color(0xFF232431);
final Color blackLight = Color(0xFF2D3041);
final Color transparent = Colors.transparent;

// Create a material color
MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }

  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}

// Duration
final Duration splashDuration = Duration(seconds: 5);
final Duration animationDuration = Duration(milliseconds: 500);

// Radius
final Radius radiusAppBar = Radius.circular(20.0);
final Radius radiusZero = Radius.circular(0.0);
final Radius radiusFive = Radius.circular(5.0);

// App name
final String appName = 'Pur Fit';

// Author name
final String fullName = 'Taftadjani Dahirou';

// App bar
Widget getAppBar(bool isCollapsed, String title, Widget leading, List<Widget> actions) => SliverAppBar(
      floating: true,
      pinned: true,
      stretch: true,
      expandedHeight: 175.0,
      collapsedHeight: 80.0,
      shadowColor: transparent,
      backgroundColor: transparent,
      elevation: 2,
      flexibleSpace: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: blackLight,
              borderRadius: BorderRadius.only(
                topLeft: radiusAppBar,
                topRight: radiusAppBar,
              ),
            ),
          ),
          Opacity(
            opacity: .35,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    black,
                    primary,
                  ],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: radiusAppBar,
                  bottomRight: radiusAppBar,
                  topLeft: isCollapsed ? Radius.circular(0.0) : radiusAppBar,
                  topRight: isCollapsed ? Radius.circular(0.0) : radiusAppBar,
                ),
              ),
            ),
          ),
          FlexibleSpaceBar(
            title: Text(
              title,
              style: TextStyle(
                fontSize: 25.0,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            titlePadding: EdgeInsets.symmetric(vertical: 20.0),
          ),
        ],
      ),
      leading: leading,
      actions: actions,
    );

// Workout
Widget getWorkout(BuildContext context, Widget onTap) => GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => onTap,
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
        ),
        child: Container(
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: black,
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              right: 20.0,
              top: 18.0,
              bottom: 18.0,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Plan name',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Roboto',
                            color: white,
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          'But I mustmlvvccddsse explain to you how all this mistaken idea of denouncing pleasure mistaken idea of denouncing pleasure',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14.0,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                            height: 1.2,
                            color: grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  child: CircularPercentIndicator(
                    animation: true,
                    circularStrokeCap: CircularStrokeCap.round,
                    animationDuration: 5000,
                    startAngle: 0,
                    backgroundColor: Colors.transparent,
                    percent: .3,
                    radius: 78,
                    lineWidth: 5,
                    progressColor: primary,
                    curve: Curves.decelerate,
                    center: Text(
                      "20%",
                      style: TextStyle(
                        fontSize: 20,
                        color: white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

// Sidebar item
Widget getSideBarItem(BuildContext context, IconData iconData, String label, Widget onTapWidget) => GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => onTapWidget,
          ),
        );
      },
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              iconData,
              color: white,
            ),
            SizedBox(
              width: 30.0,
            ),
            Text(
              label,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500,
                fontSize: 16.0,
                color: white,
              ),
            ),
          ],
        ),
      ),
    );

// Get exercise in list
Widget getExercise(String label, bool forAllExercise, bool selected) => Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: black,
          borderRadius: BorderRadius.all(radiusFive),
          border: selected
              ? Border.all(
                  width: 1.0,
                  color: primary.withOpacity(.7),
                )
              : null,
        ),
        child: ListTile(
          title: Text(
            label,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
              color: white,
            ),
          ),
          trailing: forAllExercise
              ? IconButton(
                  icon: Icon(
                    Icons.favorite_border_rounded,
                    color: white,
                  ),
                  onPressed: () {},
                )
              : null,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 25.0,
            vertical: 0.0,
          ),
          onTap: () {},
        ),
      ),
    );

// Snackbar
showSnackBar(BuildContext context) {
  return showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) => Container(
      height: 180.0,
      decoration: BoxDecoration(
        color: black,
        borderRadius: BorderRadius.only(
          topLeft: radiusAppBar,
          topRight: radiusAppBar,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25.0,
            ),
            child: Text(
              'Filter',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 18.0,
                fontWeight: FontWeight.w700,
                color: white,
              ),
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton(
                child: Icon(
                  Icons.done_all,
                  color: white,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(radiusFive),
                  side: BorderSide(
                    color: white,
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(
                width: 20.0,
              ),
              FlatButton(
                child: Icon(
                  Icons.favorite_border_rounded,
                  color: white,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(radiusFive),
                  side: BorderSide(
                    color: white,
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(
                width: 20.0,
              ),
              FlatButton(
                child: Icon(
                  Icons.favorite_rounded,
                  color: primary,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(radiusFive),
                  side: BorderSide(
                    color: primary,
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

// Next exercise snackbar
getNextExercise(BuildContext context) {
  return showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) => Container(
      height: 100.0,
      decoration: BoxDecoration(
        color: black,
        borderRadius: BorderRadius.only(
          topLeft: radiusAppBar,
          topRight: radiusAppBar,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Exercise name',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                color: white,
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Text(
              '15',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
                color: white,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

// Get title field
Widget getTitle(String label) => Text(
      label,
      style: TextStyle(
        color: white,
        fontSize: 18.0,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w500,
      ),
    );

// Plan day
Widget getPlanDay(String label, bool selected) => Container(
      width: selected ? 60 : 50,
      height: selected ? 50 : 40,
      child: FlatButton(
        padding: null,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: selected ? 2.0 : 1.0,
            color: selected ? primary : white,
          ),
          borderRadius: BorderRadius.all(radiusFive),
        ),
        onPressed: () {},
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 20.0,
              color: selected ? primary : white,
            ),
          ),
        ),
      ),
    );

// Plan Header
Widget getPlanHeader(String label) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 18.0,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w500,
            color: white,
          ),
        ),
        IconButton(
          icon: Icon(
            Icons.clear_rounded,
            color: error,
          ),
          onPressed: () {},
        ),
      ],
    );

// Get pause plan
Widget getPausePlan() => buildPauseSlidable(
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(
              Icons.watch_later_outlined,
              color: white,
            ),
            onPressed: () {},
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: white,
              ),
              borderRadius: BorderRadius.all(
                radiusFive,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 6.0,
                horizontal: 20.0,
              ),
              child: Text(
                '2 : 30',
                style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                  color: white,
                ),
              ),
            ),
          ),
        ],
      ),
    );

// Get exercise plan
Widget getExercisePlan(BuildContext context, bool useRep, Widget chooseExercise) => buildSlidable(
      Container(
        decoration: BoxDecoration(
          color: black,
          borderRadius: BorderRadius.all(radiusFive),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FlatButton(
                child: Text(
                  'Exercise name',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    color: white,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => chooseExercise,
                    ),
                  );
                },
              ),
              useRep
                  ? Container(
                      width: 60.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: white,
                        ),
                        borderRadius: BorderRadius.all(
                          radiusFive,
                        ),
                      ),
                      child: Center(
                        child: TextField(
                          textAlign: TextAlign.center,
                          textAlignVertical: TextAlignVertical.center,
                          keyboardType: TextInputType.number,
                          maxLength: 3,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 10.0,
                              vertical: 0.0,
                            ),
                            counterText: '',
                            isDense: true,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                          ),
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Montserrat',
                            color: white,
                          ),
                        ),
                      ),
                    )
                  : Container(
                      width: 60.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: white,
                        ),
                        borderRadius: BorderRadius.all(radiusFive),
                      ),
                      child: Center(
                        child: InkWell(
                          child: Text(
                            '2 : 30',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500,
                              color: white,
                            ),
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );

// get Button for adding pause and exercise
Widget getActionsPlan() => Row(
      children: [
        Container(
          width: 60.0,
          height: 40.0,
          decoration: BoxDecoration(
            border: Border.all(
              color: white,
            ),
            borderRadius: BorderRadius.all(
              radiusFive,
            ),
          ),
          child: Center(
            child: InkWell(
              child: Icon(
                Icons.watch_later_outlined,
                color: white,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 25.0,
        ),
        Expanded(
          child: DottedBorder(
            color: white,
            borderType: BorderType.RRect,
            dashPattern: [6, 6, 6, 6],
            radius: radiusFive,
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
                      color: white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );

Slidable buildSlidable(Widget child) {
  return Slidable(
    actionPane: SlidableDrawerActionPane(),
    child: child,
    actionExtentRatio: .18,
    secondaryActions: [
      SlideAction(
        decoration: BoxDecoration(),
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(
              color: white,
            ),
            borderRadius: BorderRadius.all(radiusFive),
          ),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.watch_later_outlined,
              color: white,
            ),
          ),
        ),
      ),
      SlideAction(
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(
              color: error,
            ),
            borderRadius: BorderRadius.all(radiusFive),
          ),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.clear_rounded,
              color: error,
            ),
          ),
        ),
      ),
    ],
  );
}

Slidable buildPauseSlidable(Widget child) {
  return Slidable(
    actionPane: SlidableDrawerActionPane(),
    child: child,
    actionExtentRatio: .18,
    secondaryActions: [
      SlideAction(
        child: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            border: Border.all(
              color: error,
            ),
            borderRadius: BorderRadius.all(radiusFive),
          ),
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: Icon(
              Icons.clear_rounded,
              color: error,
            ),
          ),
        ),
      ),
    ],
  );
}

// Exercise container
Widget getExerciseProc(bool rep) => Container(
      height: 150.0,
      decoration: BoxDecoration(
        border: Border.all(
          width: 2.0,
          color: primary,
        ),
        borderRadius: BorderRadius.all(
          radiusAppBar,
        ),
      ),
      child: Center(
        child: Text(
          rep ? '30' : '00 : 33',
          style: TextStyle(
            fontSize: 62.0,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
            color: primary,
          ),
        ),
      ),
    );

// Finish button
Widget getFinishButton(String label) => FlatButton(
      color: primary,
      padding: EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 15,
      ),
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: primary,
        ),
        borderRadius: BorderRadius.all(radiusFive),
      ),
      onPressed: () {},
      child: Text(
        label,
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w500,
          fontFamily: 'Montserrat',
          color: white,
        ),
      ),
    );

// Analytic exercise
Widget getExerciseAnalytic(String exerciseName, String label1, String label2, bool succeed) => Container(
      decoration: BoxDecoration(
        color: black,
        borderRadius: BorderRadius.all(
          Radius.circular(5.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 15.0,
              ),
              child: Text(
                exerciseName,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  color: white,
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: white,
                    ),
                    borderRadius: BorderRadius.all(
                      radiusFive,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 1.0,
                    ),
                    child: Text(
                      label1,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        color: white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: succeed ? green : error,
                    ),
                    borderRadius: BorderRadius.all(
                      radiusFive,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 5.0,
                    ),
                    child: Text(
                      label2,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        color: succeed ? green : error,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );

// Analytic header
Widget getAnalyticHeader(int activeItem) => Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Today',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: white,
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(
                Icons.list,
                color: activeItem == 1 ? primary : white,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.bar_chart_rounded,
                color: activeItem == 2 ? primary : white,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.radio_button_off_rounded,
                color: activeItem == 3 ? primary : white,
              ),
              onPressed: () {},
            ),
          ],
        )
      ],
    );
