import 'package:flutter/material.dart';
import 'package:medone/Doctor/Screens/test.dart';
import 'package:medone/Doctor/Widgets/customDrawer.dart';

final apiUrl = "https://cc0d906a8f3c.ngrok.io/";

class DoctorHome extends StatefulWidget {
  static const route = "/doctor-home";

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    // throw UnimplementedError();
    return DoctorHomeState();
  }
}

class DoctorHomeState extends State {
  bool showTodaysApointments = true;
  bool showUpcomingApointments = true;

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;

    var UserInfo = routeArgs['UserInfo'];

    print(UserInfo);

    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.person,
            color: Theme.of(context).accentColor,
          ),
          onPressed: () => _scaffoldKey.currentState.openDrawer(),
        ),
        title: Text(
          "মেডি সেবা",
          style: Theme.of(context).textTheme.headline1,
        ),
        centerTitle: true,
        actions: <Widget>[
          Stack(
            textDirection: TextDirection.rtl,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.notifications,
                  color: Theme.of(context).accentColor,
                  size: 40,
                ),
                onPressed: () => Navigator.pushNamed(context, "Cart.route"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.all(5),
                  // alignment: Alignment.topRight,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.blue),
                  child: Text("5",
                      style: TextStyle(color: Colors.white, fontSize: 14)),
                ),
              )
            ],
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: <Widget>[
          GestureDetector(
            onTap: () {
              setState(() {
                showTodaysApointments = !showTodaysApointments;
              });
            },
            child: sectionCard("Todays Appointments", showTodaysApointments),
          ),
          if (showTodaysApointments)
            DataTable(
              // showCheckboxColumn: true,
              columnSpacing: 1.0,
              horizontalMargin: 2,
              // dataRowHeight: 50,
              // headingRowHeight: 80,
              columns: const <DataColumn>[
                DataColumn(
                  label: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Patient",
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
                      "Time",
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
                      "Action",
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
                          "Rahim sa ssas Ullah",
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
                            overflow: TextOverflow.ellipsis,
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
                                Navigator.pushNamed(context, Test.route),
                            child: Container(
                                padding: const EdgeInsets.all(5),
                                color: Colors.red,
                                child: Text(
                                  "Cancel",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ))),
                      ),
                    )
                  ],
                ),
              ),
            ),
          GestureDetector(
            onTap: () {
              setState(() {
                showUpcomingApointments = !showUpcomingApointments;
              });
            },
            child:
                sectionCard("Upcoming Appointments", showUpcomingApointments),
          ),
          if (showUpcomingApointments)
            DataTable(
              // showCheckboxColumn: true,
              columnSpacing: 1.0,
              horizontalMargin: 2,
              // dataRowHeight: 50,
              // headingRowHeight: 80,
              columns: const <DataColumn>[
                DataColumn(
                  label: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Patient",
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
                      "Date",
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
                      "Action",
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
                          "Mr Kakku",
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
                        child: Text("20/12/2038",
                            overflow: TextOverflow.ellipsis,
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
                                Navigator.pushNamed(context, Test.route),
                            child: Container(
                                padding: const EdgeInsets.all(5),
                                color: Colors.red,
                                child: Text(
                                  "Cancel",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ))),
                      ),
                    )
                  ],
                ),
              ),
            ),
        ],
      ),
      drawer: DrawerX(UserInfo["name"],UserInfo["role"],UserInfo["id"],apiUrl),
    );
  }
}

Widget sectionCard(String title, bool up) {
  return Card(
    child: Container(
      height: 60,
      padding: const EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                fontSize: 26.0,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal),
          ),
          Icon(
            up ? Icons.arrow_drop_up : Icons.arrow_drop_down,
            size: 50,
            color: Colors.blue,
          )
        ],
      ),
    ),
  );
}
