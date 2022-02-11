import 'package:flutter/material.dart';
import 'package:obs_bproce/menu_nav/example_menu.dart';

import 'about_us_child_component.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              child: ExampleStaggeredAnimations(
                myWidget: AboutUsChildComponent(),
                appBarTitle: 'Hakkımızda',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
