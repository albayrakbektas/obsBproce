import 'package:flutter/material.dart';
import 'package:obs_bproce/menu_nav/example_menu.dart';

import 'announcement_table.dart';

class Announcement extends StatelessWidget {
  const Announcement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          Positioned(
            child: ExampleStaggeredAnimations(
              myWidget: const AnnouncementTable(),
              appBarTitle: 'Duyurular',
            ),
          ),
        ],
      ),
    ));
  }
}
