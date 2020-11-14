import '../../utils/customLib.dart';

class PatientsList extends StatelessWidget {
  static const route = '/patients-list';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        title: Text("All Patients List"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: DataTable(
          // showCheckboxColumn: true,
          // columnSpacing: 3.0,
          horizontalMargin: 5,
          // dataRowHeight: 50,
          // headingRowHeight: 80,
          columns: const <DataColumn>[
            DataColumn(
              label: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Name",
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
                  "Bed No",
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
                  "Profile",
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
                      "Mobin Khan",
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
                      "04",
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
                        onTap: () =>
                            Navigator.pushNamed(context, PatientProfile.route),
                        child: Container(
                            padding: const EdgeInsets.all(5),
                            color: Colors.green,
                            child: Text(
                              "View",
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
      ),
    );
  }
}
