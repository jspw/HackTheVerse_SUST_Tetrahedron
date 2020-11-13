import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';

class DashboardDoctor extends StatelessWidget {
  static const route = "/dashboard-doctor";

  List<double> patientCount = [10, 27, 13, 40, 52, 61, 47, 58];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        title: Text("Dr. Shifat"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(5),
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                border: Border(
              top: BorderSide(),
              bottom: BorderSide(),
              left: BorderSide(),
              right: BorderSide(),
            )),
            padding: const EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Name"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Designation"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Drgrees"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Address"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Phone Number"),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(" : "),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(" : "),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(" : "),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(" : "),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(" : "),
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Expanded(
                            child: Text(
                          "Dr. Mehedi Hasan sdfa Shifat",
                          overflow: TextOverflow.ellipsis,
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Gynocologist"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("MBBS,FPS,FDB,PHD"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Uganda,Africa"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("01714986887"),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          GridView.count(
            shrinkWrap: true,
            primary: false,
            padding: const EdgeInsets.all(10),
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            children: <Widget>[
              Card(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [Colors.blue, Colors.indigo])),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text("Todays Patients",
                          style: TextStyle(color: Colors.white)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Icon(
                            Icons.people_outline,
                            color: Colors.white,
                          ),
                          Text("56", style: TextStyle(color: Colors.white)),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Card(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [Colors.purple, Colors.pink])),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        "Completed Appointments",
                        style: TextStyle(color: Colors.white),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Icon(
                            Icons.calendar_today,
                            color: Colors.white,
                          ),
                          Text("456", style: TextStyle(color: Colors.white)),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            alignment: Alignment.topLeft,
            child: Text(
              "Patients Survey : ",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 24.0,
              ),
            ),
          ),
          Card(
              child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      Sparkline(
                        data: patientCount,
                        lineColor: Colors.green,
                        pointsMode: PointsMode.all,
                        pointColor: Colors.red,
                        pointSize: 4.0,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:
                              List.generate(patientCount.length, (int index) {
                            return Text(
                              patientCount[index].toString(),
                              style: TextStyle(fontSize: 12.0),
                            );
                          })),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Number of Patients"),
                      )
                    ],
                  )))
        ],
      ),
    );
  }
}
