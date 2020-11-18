import '../../Utils/Others/customLib.dart';

class DoctorsList extends StatelessWidget {
  static const route = '/doctors-list';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        title: Text("All Doctors"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: DataTable(
                // showCheckboxColumn: true,
                // columnSpacing: 3.0,
                horizontalMargin:5,
                // dataRowHeight: 50,
                // headingRowHeight: 80,
                columns: const <DataColumn>[
                  DataColumn(
                    label: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Doctor",
                        style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.w900,
                            color: Colors.grey),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Shift",
                        style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.w900,
                            color: Colors.grey),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Profile",
                        style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.w900,
                            color: Colors.grey),
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
                            "Dr Mobin Khan",
                            overflow: TextOverflow.visible,
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ),
                      DataCell(
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("7PM",
                              overflow: TextOverflow.visible,
                              style: TextStyle(
                                fontSize: 18.0,
                              )),
                        ),
                      ),
                      DataCell(
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                              onTap: () =>
                                  Navigator.pushNamed(context, "Test.route"),
                              child: Container(
                                  padding: const EdgeInsets.all(5),
                                  color: Colors.green,
                                  child: Text(
                                    "View",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ))),
                        ),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
