import 'package:flutter/material.dart';

class AboutUsChildComponent extends StatelessWidget {
  double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: deviceHeight(context) * .1,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Created',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'by',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Bektas Albayrak',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'and',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Volkan Oger',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
