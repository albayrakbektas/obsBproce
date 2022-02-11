import 'package:flutter/material.dart';
import 'package:obs_bproce/courses/single_class_row_s.dart';

import '../menu_nav/example_menu.dart';

class MyCourses extends StatefulWidget {
  const MyCourses({Key? key}) : super(key: key);

  @override
  State<MyCourses> createState() => _MyCoursesState();
}

class _MyCoursesState extends State<MyCourses> {
  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;
  double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              child: ExampleStaggeredAnimations(
                myWidget: SingleClassRows(),
                appBarTitle: 'Derslerim',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
