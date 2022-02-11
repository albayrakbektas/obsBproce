import 'package:flutter/material.dart';
import 'login/login.dart';

void main() {
  runApp(Obs());
}

class Obs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // localizationsDelegates: [
        //   GlobalMaterialLocalizations.delegate,
        //   GlobalWidgetsLocalizations.delegate,
        //   GlobalCupertinoLocalizations.delegate,
        // ],
        // supportedLocales: [
        //   Locale('en', ''), // English, no country code
        //   Locale('tr', ''), // Turkish, no country code
        // ],
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        home: Login());
  }
}
