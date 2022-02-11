import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:obs_bproce/exams/class_and_list.dart';

import 'class.dart';

class ExamPlaceChildComponent extends StatelessWidget {
  late ExamInformation exam;
  CurrentExam currentExam = CurrentExam();
  ExamPlaceChildComponent();
  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;
  double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: deviceWidth(context),
                    height: deviceHeight(context) * .1,
                    child: Text(
                      'Sınıf: ${examInformationList[0].classroom}',
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: deviceWidth(context),
                    height: deviceHeight(context) * .1,
                    child: Text(
                      'Koltuk: ${currentExam.floorPlan}',
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: deviceWidth(context),
                    height: deviceHeight(context) * .6,
                    child: Image.asset(
                      'assets/images/floor_plan.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
