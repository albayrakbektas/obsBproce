import 'package:flutter/material.dart';

import 'class_list.dart';

class AnnouncementTable extends StatelessWidget {
  const AnnouncementTable({Key? key}) : super(key: key);

  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;
  double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SizedBox(
          width: deviceWidth(context),
          child: DataTable(
            headingRowHeight: deviceHeight(context) * .05,
            showBottomBorder: true,
            horizontalMargin: deviceWidth(context) * 0.01,
            columnSpacing: deviceWidth(context) * 0.01,
            sortColumnIndex: 2,
            sortAscending: true,
            columns: const [
              DataColumn(
                label: Text('Konu'),
              ),
              DataColumn(
                label: Text('Kimden'),
              ),
              DataColumn(
                label: Text('Tarih'),
              ),
            ],
            rows: announcements
                .map(
                  (announcement) => DataRow(
                    selected: announcement.unread,
                    cells: [
                      DataCell(
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: deviceWidth(context) * .5,
                            minWidth: deviceWidth(context) * .45,
                          ), //SET max width
                          child: Text(
                            announcement.konu,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      DataCell(
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: deviceWidth(context) * .25,
                            minWidth: deviceWidth(context) * .25,
                          ), //SET max width
                          child: Text(
                            announcement.gonderen,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      DataCell(
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: deviceWidth(context) * .20,
                            minWidth: deviceWidth(context) * .20,
                          ), //SET max width
                          child: Text(
                            announcement.tarih,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
