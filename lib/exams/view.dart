import 'package:flutter/material.dart';
import 'package:obs_bproce/menu_nav/example_menu.dart';

import 'child_component.dart';

class ExamInformationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              child: ExampleStaggeredAnimations(
                myWidget: ExamInformationChildComponent(),
                appBarTitle: 'Sınavlarım',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
