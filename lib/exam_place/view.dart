import 'package:flutter/material.dart';
import 'package:obs_bproce/menu_nav/example_menu.dart';

import 'child_component.dart';
import 'class.dart';
import 'null_child_component.dart';

class ExamPlaceView extends StatelessWidget {
  ExamPlaceView();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          Positioned(
            child: ExampleStaggeredAnimations(
              myWidget: isCurrentExamPlan()
                  ? ExamPlaceChildComponent()
                  : NullExamPlaceChildComponent(),
              appBarTitle: 'Sınav Yerim',
            ),
          ),
        ],
      ),
    ));
  }
}

// bool isNullFunc(_currentExam) {
//   if (_currentExam.floorPlan) {
//     return true;
//   }
// }
