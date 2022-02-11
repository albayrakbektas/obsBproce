import 'package:flutter/material.dart';
import 'package:obs_bproce/menu_nav/example_menu.dart';

import 'child_component.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              child: ExampleStaggeredAnimations(
                myWidget: ContactUsChildComponent(),
                appBarTitle: 'İletişim',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
