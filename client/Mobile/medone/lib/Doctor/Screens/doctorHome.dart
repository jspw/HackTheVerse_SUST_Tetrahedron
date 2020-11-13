import 'package:flutter/material.dart';
import 'package:medone/Doctor/Widgets/customDrawer.dart';

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Patient",
                    style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.grey),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Time",
                    style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.grey),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Action",
                    style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.grey),
                  ),
                ),
              ],
            ),
          if (showTodaysApointments) Divider(),
          if (showTodaysApointments)
            Column(
              children: List.generate(
                7,
                (int index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Rahim Ullah"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("7PM"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                            onTap: () => debugPrint("a"),
                            child: Container(
                                padding: const EdgeInsets.all(5),
                                color: Colors.red,
                                child: Text(
                                  "Cancel",
                                  style: TextStyle(color: Colors.white),
                                ))),
                      ),
                    ],
                  );
                },
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Patient",
                    style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.grey),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Date",
                    style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.grey),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Action",
                    style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.grey),
                  ),
                ),
              ],
            ),
          if (showUpcomingApointments) Divider(),
          if (showUpcomingApointments)
            Column(
              children: List.generate(
                7,
                (int index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Rahim Ullah"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("20/13/2089"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                            onTap: () => debugPrint("a"),
                            child: Container(
                                padding: const EdgeInsets.all(5),
                                color: Colors.red,
                                child: Text(
                                  "Cancel",
                                  style: TextStyle(color: Colors.white),
                                ))),
                      ),
                    ],
                  );
                },
              ),
            ),
        ],
      ),
      drawer: DrawerX(),
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
