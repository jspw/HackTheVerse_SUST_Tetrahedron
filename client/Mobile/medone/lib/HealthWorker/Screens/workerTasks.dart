import 'package:flutter/cupertino.dart';

import '../../utils/customLib.dart';

class TaskWorkers extends StatelessWidget {
  static const route = "/worker-tasks";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Todays' Assigned Tasks",
          style: TextStyle(
            fontSize: 22.0,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(5),
        children: <Widget>[
          DataTable(
            // showCheckboxColumn: true,
            // columnSpacing: 3.0,
            horizontalMargin: 2,
            // dataRowHeight: 50,
            // headingRowHeight: 80,
            columns: const <DataColumn>[
              DataColumn(
                label: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "TaskID",
                    style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              DataColumn(
                label: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Time",
                    style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              DataColumn(
                label: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Action",
                    style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
            rows: List<DataRow>.generate(
              5,
              (index) => DataRow(
                cells: [
                  DataCell(
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "#123",
                        overflow: TextOverflow.visible,
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  DataCell(
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "7:00 PM",
                        overflow: TextOverflow.visible,
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  DataCell(
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                          onTap: () => Navigator.pushNamed(
                              context, PatientProfile.route),
                          child: Container(
                              padding: const EdgeInsets.all(5),
                              color: Colors.green,
                              child: Text(
                                "Accepted",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ))),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
