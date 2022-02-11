import 'package:flutter/material.dart';

import '../menu_nav/example_menu.dart';
import 'change_password_form.dart';

class ChangePasswordPage extends StatelessWidget {
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
                myWidget: const ChangePassword(),
                appBarTitle: 'Şifre Değiştir',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
