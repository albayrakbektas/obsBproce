import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:obs_bproce/api/api_service.dart';

import '../globals.dart';
import 'course_detail.dart';

class SingleClassRows extends StatefulWidget {
  const SingleClassRows({Key? key}) : super(key: key);

  @override
  State<SingleClassRows> createState() => _SingleClassRowsState();
}

class _SingleClassRowsState extends State<SingleClassRows> {
  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;
  double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            if (isLoading = true)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: deviceHeight(context) * 0.05,
                  width: 150,
                  child: SpinKitWave(
                    color: Colors.blue,
                  ),
                ),
              ),
            Column(
              children: Student.dersler
                  .map(
                    (dersler) => Container(
                      margin: EdgeInsets.symmetric(
                        vertical: deviceHeight(context) * .005,
                        horizontal: deviceWidth(context) * .01,
                      ),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shadowColor:
                              MaterialStateProperty.all(Colors.blueGrey),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              side: BorderSide(color: Colors.blueGrey),
                            ),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            isLoading = true;
                          });
                          getCourseContent(Student.ogrenciNo, dersler['subeId'])
                              .then((value) {
                            setState(() {
                              CourseContent = value;
                              degerlendirmeListesi = value.degerlendirmeler;
                            });
                          }).then((value) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CourseDetail(
                                  Map<String, dynamic>.from(dersler),
                                ),
                              ),
                            );
                            setState(() {
                              isLoading = false;
                            });
                          });
                        },
                        child: SizedBox(
                          width: deviceWidth(context),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: deviceWidth(context) * .05,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8, 12, 8, 6),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      width: deviceWidth(context) * .5,
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          dersler['dersKodu'],
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: SizedBox(
                                        width: deviceWidth(context) * .6,
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            dersler['dersAdi'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: SizedBox(
                                        width: deviceWidth(context) * .5,
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            '${dersler['subeNo']}. Şube',
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          8.0, 6.0, 8.0, 12.0),
                                      child: SizedBox(
                                        width: deviceWidth(context) * .5,
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            dersler['ogretimUyesi'],
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Icon(
                                Icons.arrow_right,
                                size: 50,
                                color: Colors.black,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
