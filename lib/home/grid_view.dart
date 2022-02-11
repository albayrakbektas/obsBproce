import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'image_data.dart';

void main() {
  runApp(const Grid());
}

class Grid extends StatefulWidget {
  const Grid({Key? key}) : super(key: key);

  @override
  State<Grid> createState() => _GridState();
}

class _GridState extends State<Grid> {
  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;
  double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: deviceHeight(context) * .86,
      child: GridView.builder(
        itemCount: imageList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1.2,
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        itemBuilder: (context, index) => ImageCard(
          imageData: imageList[index],
        ),
      ),
    );
  }
}

class RandomColor {
  Random random = Random();
  Color getColor() {
    return Color.fromARGB(
      random.nextInt(255),
      random.nextInt(255),
      random.nextInt(255),
      random.nextInt(255),
    );
  }
}

class ImageCard extends StatelessWidget {
  ImageCard({Key? key, required this.imageData}) : super(key: key);
  final ImageData imageData;
  // final List<Color> colors = <Color>[
  //   Colors.blue,
  //   Colors.blueGrey,
  //   Colors.blueAccent,
  //   Colors.lightBlue,
  //   Colors.lightBlueAccent,
  //   Colors.green,
  // ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRect(
          child: ElevatedButton(
        style:
            ElevatedButton.styleFrom(primary: Color.fromRGBO(255, 255, 255, 1)
                // RandomColor().getColor(),
                ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => imageData.navigationLink,
            ),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 100,
              child: Image.asset(
                imageData.imagePath,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 28,
              child: Text(
                imageData.title,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlue),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
