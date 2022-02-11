import 'package:flutter/material.dart';
import 'grid_view.dart';
import 'header.dart';

void main() {
  runApp(const Home());
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;
  double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: deviceHeight(context) * 2, //Try another size
            child: Column(
              children: [
                Header(),
                Grid(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
