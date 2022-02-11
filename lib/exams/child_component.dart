import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:obs_bproce/api/api_service.dart';

import '../globals.dart';

class ExamInformationChildComponent extends StatefulWidget {
  @override
  State<ExamInformationChildComponent> createState() =>
      _ExamInformationChildComponentState();
}

class _ExamInformationChildComponentState
    extends State<ExamInformationChildComponent> {
  bool isSwitch = false;
  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

  double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  late Iterable<dynamic> ExamLList = ExamGList.map((e) => e).toList().reversed;
  List<dynamic> ExamG2List = [];
  late Iterable<dynamic> ExamL2List = ExamG2List.map((e) => e).toList();

  late DateTime now = DateTime.now();
  getExamDate() {
    if (!isSwitch) {
      ExamLList.forEach((e) {
        List<String> tarihList = e['tarihSaat'].split(' ');
        if (tarihList[0][2] != '/') {
          tarihList[0] = '0${tarihList[0]}';
        }
        String dateStart = tarihList[0].toString();
        DateFormat inputFormat = DateFormat('MM/dd/yyyy');
        DateTime input = inputFormat.parse(dateStart);
        if (now.add(Duration(days: -1)).isBefore(input)) {
          ExamG2List.add(e);
        }
      });
    } else {
      ExamL2List = ExamLList;
    }
  }

  @override
  void initState() {
    super.initState();
    getExamList(Student.ogrenciNo, Student.sifre, '38');
    isSwitch;
    getExamDate();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SizedBox(
          width: deviceWidth(context),
          child: Column(
            children: [
              DataTable(
                headingRowHeight: deviceHeight(context) * .05,
                showBottomBorder: true,
                horizontalMargin: deviceWidth(context) * 0.01,
                columnSpacing: deviceWidth(context) * 0.01,
                sortColumnIndex: 2,
                sortAscending: true,
                columns: const [
                  DataColumn(
                    label: Text(
                      'Ders',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Sinav',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Tarih',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Sinif',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
                rows: ExamL2List.map(
                  (exam) => DataRow(
                    cells: [
                      DataCell(
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: deviceWidth(context) * .33,
                            minWidth: deviceWidth(context) * .33,
                          ), //SET max width
                          child: Text(
                            exam['dersAdi'],
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      DataCell(
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: deviceWidth(context) * .13,
                            minWidth: deviceWidth(context) * .13,
                          ), //SET max width
                          child: Text(
                            exam['tur'],
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      DataCell(
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: deviceWidth(context) * .34,
                            minWidth: deviceWidth(context) * .34,
                          ), //SET max width
                          child: Text(
                            exam['tarihSaat'],
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      DataCell(
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: deviceWidth(context) * .2,
                            minWidth: deviceWidth(context) * .2,
                          ), //SET max width
                          child: Text(
                            exam['derslikler'],
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                ).toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Tüm Sınavları Göster'),
                  Switch(
                    value: isSwitch,
                    onChanged: (value) {
                      setState(
                        () {
                          isSwitch = value;
                          if (value == false) {
                            ExamL2List = ExamG2List.map((e) => e).toList();
                          } else {
                            getExamDate();
                          }
                        },
                      );
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
