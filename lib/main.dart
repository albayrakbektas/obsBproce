import 'package:flutter/material.dart';
import 'login/login.dart';

void main() {
  runApp(Obs());
}

class Obs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        home: Login());
  }
}
