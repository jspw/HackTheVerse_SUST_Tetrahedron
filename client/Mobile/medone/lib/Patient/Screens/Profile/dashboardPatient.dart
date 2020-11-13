import 'package:flutter/material.dart';

class DashboardPatient extends StatefulWidget {
  static const route = "/dashboard-patient";
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    // throw UnimplementedError();
    return DashboardState();
  }
}

class DashboardState extends State {
  bool showPatientInfo = true;
  bool showPatientHealthInfo = true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome | Mh Shifat"),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                showPatientInfo = !showPatientInfo;
              });
            },
            child: sectionCard("Patient Information",showPatientInfo),
          ),
          showPatientInfo
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
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
                              child: Text("Age"),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Address"),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Date of Birth"),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Blood Group"),
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Mehedi Hasan Shifat"),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("23"),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Madina Market,Sylhet"),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("4th Nov,1997"),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("O (-)"),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              : Text(""),
          GestureDetector(
            onTap: () {
              setState(() {
                showPatientHealthInfo = !showPatientHealthInfo;
              });
            },
            child: sectionCard("Health Information",showPatientHealthInfo),
          ),
          showPatientHealthInfo
              ? GridView.count(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  primary: false,
                  padding: const EdgeInsets.all(20),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  children: <Widget>[
                    customBox("assets/images/cardiogram.png", "Heart Rate",
                        "600", "07% Less Then Last Month"),
                    customBox("assets/images/hearts.png", "Blood Pressure",
                        "110/70", "vlo nah bachbina beshidin"),
                    customBox("assets/images/blood.png", "Blood Count",
                        "9,456/mL", "22% Less Then Last Month"),
                    customBox("assets/images/glucose-meter.png",
                        "Glucose Level", "80-85", "12% Higher Then Last Month"),
                  ],
                )
              : Text(""),
        ],
      ),
    );
  }
}

Widget customBox(String img, String title, String amount, String comment) {
  return Card(
    child: Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.asset(img),
          Text(title),
          Text(amount),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(comment),
          )),
        ],
      ),
    ),
  );
}

Widget sectionCard(String title ,bool up ) {
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
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal),
          ),
          Icon(
           up? Icons.arrow_drop_up :  Icons.arrow_drop_down,
            size: 50,
            color: Colors.blue,
          )
        ],
      ),
    ),
  );
}
