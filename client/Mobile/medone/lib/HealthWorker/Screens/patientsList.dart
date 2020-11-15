import 'dart:io';

import '../../utils/customLib.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PatientsList extends StatelessWidget {
  static const route = '/patients-list';

  String apiUrl = ApiUrl.url;

  Future<List<dynamic>> _getPatientList(String token) async {
    print("Token : ");
    print(token);
    final http.Response response = await http
        .get(apiUrl + '/patients', headers: {"authorization": "Bearer $token"});
    var data = jsonDecode(response.body);
    if (data["status"] == "success") {
      return data["data"]["patient"];
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();

    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    print(routeArgs);
    String token = routeArgs['token'];

    return Scaffold(
      appBar: AppBar(
        title: Text("All Patients List"),
      ),
      body: FutureBuilder(
          future: _getPatientList(token),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            print("Snapshot.data");
            print(snapshot.data);

            if (snapshot.data == null)
              return Center(
                  child: CircularProgressIndicator(
                backgroundColor: Colors.red,
              ));

            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: DataTable(
                // showCheckboxColumn: true,
                // columnSpacing: 3.0,
                horizontalMargin: 5,
                dataRowHeight: 60,
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
                        overflow: TextOverflow.clip,
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
                  snapshot.data.length,
                  (index) => DataRow(
                    cells: [
                      DataCell(
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            snapshot.data[index]["name"],
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
                            snapshot.data[index]["bed"],
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
                              onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => PatientProfile(
                                          token, snapshot.data[index]["_id"]),
                                    ),
                                  ),

                              // onTap: () => Navigator.pushNamed(
                              //         context, PatientProfile.route,
                              //         arguments: {
                              //           "token": token,
                              //           "patient_id": snapshot.data[index]
                              //               ["_id"]
                              //         }),
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
            );
          }),
    );
  }
}
