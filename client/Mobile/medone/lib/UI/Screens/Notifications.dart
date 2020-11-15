import 'dart:ui';

import 'package:medone/utils/customLib.dart';

class NotificationsToNurse extends StatelessWidget {
  static const route = "/nurse-notifications";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          "Notifications | Emergency Alert",
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.w800),
        ),
      ),
      body: ListView(
        children: [
          // Container(
          //   padding: const EdgeInsets.all(20),
          //   color: Colors.red,
          //   alignment: Alignment.center,
          //   child: Text(
          //     "Emergency Patient Check",
          //     style: TextStyle(color: Colors.white, fontSize: 22),
          //   ),
          // ),
          Container(
            child: Card(
              child: DataTable(
                // columnSpacing: 0.5,
                columns: const <DataColumn>[
                  DataColumn(
                      label: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      "Bed No",
                      style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  )),
                  DataColumn(
                      label: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      "P. Name",
                      style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                  )),
                  DataColumn(
                      label: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      "Action",
                      style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                  )),
                ],
                rows: List<DataRow>.generate(
                  4,
                  (index) => DataRow(
                    cells: [
                      DataCell(
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            "04",
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      DataCell(
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            "Alu Mia sasd",
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      DataCell(
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, PatientProfile.route),
                            child: Container(
                                padding: const EdgeInsets.all(5),
                                color: Colors.green,
                                child: Text(
                                  "Accept",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
