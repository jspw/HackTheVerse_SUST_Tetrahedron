import 'package:flutter_sparkline/flutter_sparkline.dart';

import '../../utils/customLib.dart';
import 'package:http/http.dart' as http;

class PatientProfile extends StatefulWidget {
  static const route = "/profile-patient";

  String patientId, token;

  PatientProfile(this.patientId, this.token);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    // throw UnimplementedError();
    return PatientProfilState(patientId, token);
  }
}

class PatientProfilState extends State {
  bool showPatientInfo = false;
  bool showPatientHealthInfo = false;

  String patientId, token;

  PatientProfilState(this.patientId, this.token);

  String apiUrl = ApiUrl.url;

  Map<String, dynamic> patientInfo;

  List<double> temperatureValues;

  Future<Map<String, dynamic>> _getPatienInfo(
      String token, String patient_id) async {
    print("Token : ");
    print(token);
    http.Response response = await http.get(apiUrl + '/patients/' + patient_id,
        headers: {"authorization": "Bearer $token"});
    var data = jsonDecode(response.body);

    print("data : ");
    print(data);

    if (data["status"] == "success") {
      return data["data"];
    }
  }

  getData() async {
    var data = await _getPatienInfo(patientId, token);
    setState(() {
      patientInfo = data;
    });
    // var p = await patientInfo["sensorData"][1]["value"];

    // setState(() {
    //   for (int i=0;i<p.length;i++){
    //     // Double x =
    //     temperatureValues[i] = double.parse(p[i]);
    //   }
    // });

    // print(temperatureValues.runtimeType);
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  Widget customBox(String img, String title, String amount, String comment) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset(img),
            Text(title),
            Text(amount),
            // Expanded(
            //     child: Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Text(comment),
            // )),
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
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
          if (showPatientInfo)
            if (patientInfo == null)
              Container(
                  padding: const EdgeInsets.all(50),
                  child: Text("Loading Data......."))
            else
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(),
                      bottom: BorderSide(),
                      left: BorderSide(),
                      right: BorderSide(),
                    ),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          PatientinfoTitle("Name"),
                          PatientinfoTitle("age"),
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
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          PatientinfoTitleValue(patientInfo["patient"]["name"]),
                          PatientinfoTitleValue(
                              patientInfo["patient"]["age"].toString()),
                          PatientinfoTitleValue("O (-) "),
                          PatientinfoTitleValue(
                              patientInfo["patient"]["disease"]),
                          PatientinfoTitleValue(
                              patientInfo["patient"]["ward"]["name"]),
                          PatientinfoTitleValue(patientInfo["patient"]["bed"]),
                          GestureDetector(
                            onTap: () =>
                                Navigator.pushNamed(context, "/doctor-profile"),
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
              ),
          GestureDetector(
            onTap: () {
              setState(() {
                showPatientHealthInfo = !showPatientHealthInfo;
              });
            },
            child: healthInfoCards(
                "Health Information (Live)", showPatientHealthInfo),
          ),
          if (showPatientHealthInfo)
            if (patientInfo == null)
              Container(
                  padding: const EdgeInsets.all(50),
                  child: Text("Loading Data......."))
            else
              GridView.count(
                physics: ScrollPhysics(),
                shrinkWrap: true,
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: <Widget>[
                  customBox(
                      "assets/images/thermometer.png",
                      "Temperature",
                      // patientInfo["sensorData"][0]["value"][0].toString(),
                      patientInfo["sensorData"][0]["value"][0],
                      "07% Less Then Last Month"),
                  customBox(
                      "assets/images/cardiogram.png",
                      "Pulse",
                      // patientInfo["sensorData"][0]["value"][0].toString(),
                      patientInfo["sensorData"][1]["value"][0],
                      "07% Less Then Last Month"),
                  customBox(
                      "assets/images/heart.png",
                      "Systolic",
                      patientInfo["sensorData"][2]["value"][0],
                      "vlo nah bachbina beshidin"),
                  customBox(
                      "assets/images/speedometer.png",
                      "Diastolic",
                      patientInfo["sensorData"][3]["value"][0],
                      "22% Less Then Last Month"),
                  customBox(
                      "assets/images/glucose-meter.png",
                      "Oxygen",
                      patientInfo["sensorData"][4]["value"][0],
                      "12% Higher Then Last Month"),
                  // customBox(
                  //     "assets/images/oxygen.png",
                  //     "Oxygen",
                  //     patientInfo["sensorData"][3]["value"][0],
                  // "07% Less Then Last Month"),
                  // customBox("assets/images/hearts.png", "Blood Pressure",
                  //     "110/70", "vlo nah bachbina beshidin"),
                  // customBox("assets/images/blood.png", "Blood Count",
                  //     "9,456/mL", "22% Less Then Last Month"),
                  // customBox("assets/images/glucose-meter.png",
                  //     "Glucose Level", "80-85", "12% Higher Then Last Month"),
                ],
              ),
          // if (temperatureValues != null)
          //   Sparkline(
          //     data: temperatureValues,
          //     lineColor: Colors.green,
          //     pointsMode: PointsMode.all,
          //     pointColor: Colors.red,
          //     pointSize: 4.0,
          //   ),
        ],
      ),
    );
  }
}
