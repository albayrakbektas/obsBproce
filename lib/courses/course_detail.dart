import 'package:flutter/material.dart';
import '../menu_nav/example_menu.dart';
import 'course_detail_child_component.dart';

class CourseDetail extends StatelessWidget {
  Map<String, dynamic> _ders;
  CourseDetail(this._ders);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              child: ExampleStaggeredAnimations(
                myWidget: CourseDetailChildComponent(_ders),
                appBarTitle: '${_ders['dersAdi']}',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class myArray {}
