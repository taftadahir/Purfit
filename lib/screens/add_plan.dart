import 'package:flutter/material.dart';
import 'package:purfit/utilities/utilities.dart' as utils;

class AddPlan extends StatefulWidget {
  @override
  _AddPlanState createState() => _AddPlanState();
}

class _AddPlanState extends State<AddPlan> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: utils.blackLight,
      body: Form(
        key: _formKey,
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            utils.getAppBar(
              true,
              'Add plan',
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
                    right: 10.0,
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.done_outline_rounded,
                      color: utils.primary,
                    ),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        // Show modify plan screen(add exercises, etc)
                        /*Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PlanModifyScreen(),
                          ),
                        );*/
                      }
                    },
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
                    utils.getTitle('Name'),
                    SizedBox(
                      height: 18.0,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 10.0,
                          vertical: 15.0,
                        ),
                        isDense: true,
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                          borderSide: BorderSide(
                            width: 1.0,
                            color: utils.error.withOpacity(.5),
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            utils.radiusFive,
                          ),
                          borderSide: BorderSide(
                            width: 1.0,
                            color: utils.error.withOpacity(.5),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            utils.radiusFive,
                          ),
                          borderSide: BorderSide(
                            width: 1.0,
                            color: utils.white.withOpacity(.5),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            utils.radiusFive,
                          ),
                          borderSide: BorderSide(
                            width: 1.0,
                            color: utils.primary,
                          ),
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 16.0,
                        color: utils.white,
                      ),
                      validator: (value) {
                        if (value.isEmpty) return 'Name is required';
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    utils.getTitle('Description'),
                    SizedBox(
                      height: 18.0,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 10.0,
                          vertical: 15.0,
                        ),
                        isDense: true,
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            utils.radiusFive,
                          ),
                          borderSide: BorderSide(
                            width: 1.0,
                            color: utils.error.withOpacity(.5),
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            utils.radiusFive,
                          ),
                          borderSide: BorderSide(
                            width: 1.0,
                            color: utils.error.withOpacity(.5),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            utils.radiusFive,
                          ),
                          borderSide: BorderSide(
                            width: 1.0,
                            color: utils.white.withOpacity(.5),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            utils.radiusFive,
                          ),
                          borderSide: BorderSide(
                            width: 1.0,
                            color: utils.primary,
                          ),
                        ),
                      ),
                      maxLines: 5,
                      minLines: 2,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: utils.white,
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    utils.getTitle("Number of days"),
                    SizedBox(
                      height: 18.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FlatButton(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.0,
                            vertical: 18.0,
                          ),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: utils.white,
                            ),
                            borderRadius: BorderRadius.all(
                              utils.radiusFive,
                            ),
                          ),
                          child: Container(
                            width: 8,
                            height: 3,
                            color: utils.white,
                          ),
                          onPressed: () {},
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Container(
                          width: 90.0,
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            maxLength: 3,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 10.0,
                                vertical: 15.0,
                              ),
                              counterText: '',
                              isDense: true,
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  utils.radiusFive,
                                ),
                                borderSide: BorderSide(
                                  width: 1.0,
                                  color: utils.error.withOpacity(.5),
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  utils.radiusFive,
                                ),
                                borderSide: BorderSide(
                                  width: 1.0,
                                  color: utils.error.withOpacity(.5),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  utils.radiusFive,
                                ),
                                borderSide: BorderSide(
                                  width: 1.0,
                                  color: utils.white.withOpacity(.5),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  utils.radiusFive,
                                ),
                                borderSide: BorderSide(
                                  width: 1.0,
                                  color: utils.primary,
                                ),
                              ),
                            ),
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Montserrat',
                              color: utils.white,
                            ),
                            validator: (value) {
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        FlatButton(
                          padding: EdgeInsets.symmetric(
                            horizontal: 0.0,
                            vertical: 10.0,
                          ),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: utils.white,
                            ),
                            borderRadius: BorderRadius.all(utils.radiusFive),
                          ),
                          child: Icon(
                            Icons.add_rounded,
                            color: utils.white,
                            size: 24.0,
                          ),
                          onPressed: () {},
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
      ),
    );
  }
}
