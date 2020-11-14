import 'dart:ui';

import '../../utils/customLib.dart';

class PatientProfile extends StatefulWidget {
  static const route = "/profile-patient";
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    // throw UnimplementedError();
    return PatientProfilState();
  }
}

class PatientProfilState extends State {
  bool showPatientInfo = false;
  bool showPatientHealthInfo = true;

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

  Widget healthInfoCards(String title, bool up) {
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
              up ? Icons.arrow_drop_up : Icons.arrow_drop_down,
              size: 50,
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }

  Widget PatientinfoTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget clone() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(" : "),
    );
  }

  Widget PatientinfoTitleValue(String value) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        value,
        style: TextStyle(
          fontSize: 18.0,
          color: Colors.grey,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        title: Text("Patient | Mh Shifat"),
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
            child: healthInfoCards("Patient Information", showPatientInfo),
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
                            PatientinfoTitle("Name"),
                            PatientinfoTitle("Age"),
                            PatientinfoTitle("Address"),
                            PatientinfoTitle("Date of Birth"),
                            PatientinfoTitle("Blood Group"),
                            PatientinfoTitle("Disease"),
                            PatientinfoTitle("Ward No"),
                            PatientinfoTitle("Bed No"),
                            PatientinfoTitle("Assigned Doctor"),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            clone(),
                            clone(),
                            clone(),
                            clone(),
                            clone(),
                            clone(),
                            clone(),
                            clone(),
                            clone(),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            PatientinfoTitleValue("Mehedi Hasan Shifat"),
                            PatientinfoTitleValue("23"),
                            PatientinfoTitleValue("Madina Market,Sylhet"),
                            PatientinfoTitleValue("4th Nov,1997"),
                            PatientinfoTitleValue("O (-)"),
                            PatientinfoTitleValue("Fiver"),
                            PatientinfoTitleValue("102"),
                            PatientinfoTitleValue("07"),
                            GestureDetector(
                              onTap: () => Navigator.pushNamed(
                                  context, "/doctor-profile"),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Dr. Mobin Khan",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
                                ),
                              ),
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
            child: healthInfoCards(
                "Health Information (Live)", showPatientHealthInfo),
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
