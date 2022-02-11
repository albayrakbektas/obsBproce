import 'package:flutter/material.dart';

import 'child_component.dart';
import 'null_child_component.dart';

class Gecici extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NullExamPlaceChildComponent()));
                },
                child: Text('page1'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ExamPlaceChildComponent()));
                },
                child: Text('page2'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('geri'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
