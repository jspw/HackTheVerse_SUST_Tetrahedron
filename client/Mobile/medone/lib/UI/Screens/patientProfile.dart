import 'package:http/http.dart' as http;
import '../../Utils/Others/customLib.dart';

class PatientProfile extends StatefulWidget {
  static const route = "/profile-patient";

  String token;
  Map<String, dynamic> patientInfoPre;
  PatientProfile(this.token, this.patientInfoPre);

  @override
  State<StatefulWidget> createState() {
    return PatientProfilState(token, patientInfoPre);
  }
}

class PatientProfilState extends State {
  bool showPatientInfo = true;
  bool showPatientHealthInfo = true;

  final String token;
  Map<String, dynamic> patientInfoPre;

  PatientProfilState(this.token, this.patientInfoPre);

  String apiUrl = ApiUrl.url;

  Map<String, dynamic> patientInfo;

  List<double> temperatureValues = List<double>();
  List<double> pulseValues = List<double>();
  List<double> systolicValues = List<double>();
  List<double> diastolicValues = List<double>();
  List<double> oxyzenValues = List<double>();

  Future<Map<String, dynamic>> _getPatienInfo(
      String token, String patientID) async {
    http.Response response = await http.get(apiUrl + '/patients/' + patientID,
        headers: {"authorization": "Bearer $token"});
    var data = jsonDecode(response.body);

    print(data);

    if (data["status"] == "success") {
      return data["data"];
    }
    return null;
  }

  getData() async {
    var data = await _getPatienInfo(token, patientInfoPre["_id"]);
    setState(() {
      patientInfo = data;
    });

    List<double> temperatureValuesDemo = List<double>();
    List<double> pulseValuesDemo = List<double>();
    List<double> systolicValuesDemo = List<double>();
    List<double> diastolicValuesDemo = List<double>();
    List<double> oxyzenValuesDemo = List<double>();

    //temperature

    var temperature = await patientInfo["sensorData"][0]["value"];
    for (int i = 0; i < temperature.length; i++) {
      temperature[i] = temperature[i] + ".00000";
      temperature[i] = temperature[i].substring(0, 5);
      temperatureValuesDemo.add(double.parse(temperature[i]));
    }

    //pulse
    var pulse = await patientInfo["sensorData"][1]["value"];
    for (int i = 0; i < pulse.length; i++) {
      pulse[i] = pulse[i] + ".00000";
      pulse[i] = pulse[i].substring(0, 5);
      pulseValuesDemo.add(double.parse(pulse[i]));
    }

    //systolic
    var systolic = await patientInfo["sensorData"][2]["value"];
    for (int i = 0; i < systolic.length; i++) {
      systolic[i] = systolic[i] + ".00000";
      systolic[i] = systolic[i].substring(0, 5);
      systolicValuesDemo.add(double.parse(systolic[i]));
    }

    //diastolic
    var diastolic = await patientInfo["sensorData"][3]["value"];
    for (int i = 0; i < diastolic.length; i++) {
      diastolic[i] = diastolic[i] + ".00000";
      diastolic[i] = diastolic[i].substring(0, 5);
      diastolicValuesDemo.add(double.parse(diastolic[i]));
    }

    //oxyzen

    var oxyzen = await patientInfo["sensorData"][4]["value"];
    for (int i = 0; i < oxyzen.length; i++) {
      oxyzen[i] = oxyzen[i] + ".00000";
      oxyzen[i] = oxyzen[i].substring(0, 5);
      print(oxyzen[i]);
      oxyzenValuesDemo.add(double.parse(oxyzen[i]));
    }

    setState(() {
      //load data in real fields

      temperatureValues = [...temperatureValuesDemo];
      oxyzenValues = [...oxyzenValuesDemo];
      diastolicValues = [...diastolicValuesDemo];
      systolicValues = [...systolicValuesDemo];
      pulseValues = [...pulseValuesDemo];


      //clear olds  values

      temperatureValuesDemo.clear();
      pulseValuesDemo.clear();
      systolicValuesDemo.clear();
      diastolicValuesDemo.clear();
      oxyzenValuesDemo.clear();
    });

    // print(temperatureValues);
    // print(oxyzenValues);
    // print(diastolicValues);
    // print(systolicValues);
    // print(pulseValues);
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Patient | " + patientInfoPre["name"]),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.refresh,
                size: 30,
                color: Theme.of(context).accentColor,
              ),
              onPressed: () => getData())
        ],
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
                  height: 300.0,
                  width: 300.0,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(50),
                  child: Image.asset(
                    "assets/images/loading.gif",
                    // fit: BoxFit.fill,
                  ))
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
                          patientinfoTitle("Name"),
                          patientinfoTitle("age"),
                          patientinfoTitle("Blood Group"),
                          patientinfoTitle("Disease"),
                          patientinfoTitle("Ward No"),
                          patientinfoTitle("Bed No"),
                          patientinfoTitle("Assigned Doctor"),
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
                          patientinfoTitleValue(patientInfoPre["name"]),
                          patientinfoTitleValue(
                              patientInfoPre["age"].toString()),
                          patientinfoTitleValue("O (-) "),
                          patientinfoTitleValue(patientInfoPre["disease"]),
                          patientinfoTitleValue(patientInfoPre["ward"]["name"]),
                          patientinfoTitleValue(patientInfoPre["bed"]),
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
                  height: 300.0,
                  width: 300.0,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(50),
                  child: Image.asset(
                    "assets/images/loading.gif",
                    // fit: BoxFit.cover,
                  ))
            else
              ListView(
                padding: const EdgeInsets.all(20),
                shrinkWrap: true,
                physics: ScrollPhysics(),
                children: <Widget>[
                  GridView.count(
                    physics: ScrollPhysics(),
                    // padding: const EdgeInsets.all(20),
                    shrinkWrap: true,
                    primary: true,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                    childAspectRatio: 1.3,
                    children: <Widget>[
                      sensorDataShowCard(
                          "assets/images/thermometer.png",
                          "Temperature",
                          // patientInfo["sensorData"][0]["value"][0].toString(),
                          patientInfo["sensorData"][0]["value"][0]
                              .substring(0, 4),
                          "07% Less Then Last Month"),
                      sensorDataShowCard(
                          "assets/images/cardiogram.png",
                          "Pulse",
                          // patientInfo["sensorData"][0]["value"][0].toString(),
                          patientInfo["sensorData"][1]["value"][0]
                              .substring(0, 4),
                          "07% Less Then Last Month"),
                      sensorDataShowCard(
                          "assets/images/heart.png",
                          "Systolic",
                          patientInfo["sensorData"][2]["value"][0]
                              .substring(0, 4),
                          "vlo nah bachbina beshidin"),
                      sensorDataShowCard(
                          "assets/images/speedometer.png",
                          "Diastolic",
                          patientInfo["sensorData"][3]["value"][0]
                              .substring(0, 4),
                          "22% Less Then Last Month"),
                      sensorDataShowCard(
                          "assets/images/glucose-meter.png",
                          "Oxygen",
                          patientInfo["sensorData"][4]["value"][0]
                              .substring(0, 4),
                          "12% Higher Then Last Month"),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  if (oxyzenValues.length > 0 &&
                      temperatureValues.length > 0 &&
                      pulseValues.length > 0 &&
                      systolicValues.length > 0 &&
                      diastolicValues.length > 0)
                    ListView(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      children: <Widget>[
                        graphShow("Temperature Changes in Celcius : ",
                            temperatureValues),
                        graphShow("Pulse Rate Changes : ", pulseValues),
                        graphShow("Systolic Chnages: ", systolicValues),
                        graphShow("Diastolic Chnages: ", diastolicValues),
                        graphShow("Oxyzen amount Chnages : ", oxyzenValues),
                      ],
                    )
                ],
              ),
        ],
      ),
    );
  }
}
