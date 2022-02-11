import 'package:flutter/material.dart';

class NullExamPlaceChildComponent extends StatefulWidget {
  NullExamPlaceChildComponent();
  @override
  State<NullExamPlaceChildComponent> createState() =>
      _NullExamPlaceChildComponentState();
}

class _NullExamPlaceChildComponentState
    extends State<NullExamPlaceChildComponent> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 200,
              ),
              Text(
                'Koltuk Bilgisi Henüz Açıklanmamıştır.',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sayfayı Yenile',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.refresh),
                    iconSize: 36,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
