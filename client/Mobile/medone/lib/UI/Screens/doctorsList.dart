import 'package:http/http.dart' as http;
import '../../Utils/Others/customLib.dart';


class DoctorsList extends StatelessWidget {
  static const route = '/doctors-list';

  String apiUrl = ApiUrl.url;

  Future<List<dynamic>> _getPatientList(String token) async {
    print("Token : ");
    print(token);
    http.Response response = await http.get(apiUrl + '/users/doctors',
        headers: {"authorization": "Bearer $token"});
    var data = jsonDecode(response.body);
    print(data);
    if (data["status"] == "success") {
      return data["data"]["doctors"];
    }
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    print(routeArgs);
    String token = routeArgs['token'];

    return Scaffold(
      appBar: AppBar(
        title: Text("All Doctors"),
      ),
      body: FutureBuilder(
          future: _getPatientList(token),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            print("Snapshot.data");
            print(snapshot.data);

            if (snapshot.data == null)
              return Center(
                  child: loading()
              //     CircularProgressIndicator(
              //   backgroundColor: Colors.red,
              // )
              );

            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: DataTable(
                // showCheckboxColumn: true,
                // columnSpacing: 3.0,
                horizontalMargin: 1,
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
                        "Phone NO",
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
                        "Chat",
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
                            snapshot.data[index]["phone"],
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
                                context, ChatPage.route, 
                            //     arguments: {
                            //   "patient_id": snapshot.data[index]["_id"]
                            // }
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              color: Colors.green,
                              child: Text(
                                "Connect",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
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
