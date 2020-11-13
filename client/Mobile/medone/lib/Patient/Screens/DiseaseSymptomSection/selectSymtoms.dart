import 'package:flutter/material.dart';
import 'package:medone/Patient/Screens/DiseaseSymptomSection/doctorsSuggest.dart';
import 'package:medone/Patient/Widgets/secondaryAppbar.dart';

class SelectSymtoms extends StatelessWidget {
  static const route = "/select-symptoms";

  List<String> symptoms = [
    "অকাল বীর্যপাত",
    "অণ্ডকোষে ব্যাথা",
    "অণ্ডকোষ ছোট",
    "অণ্ডকোষ একটা",
    "অনিয়মিত মাসিক",
    "বক্র লিঙ্গ",
    "মাসিকের রক্ত বেশি যায়",
  ];

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final String body_part = routeArgs['part'];

    return Scaffold(
      appBar: PreferredSize(
        child: SecondaryAppBar(
            "রোগলক্ষন | " + body_part, "রোগের উপশম নির্বাচন করুন"),
        preferredSize: Size(double.infinity, 130),
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: symptoms.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => Navigator.pushNamed(context, DoctorsSuggest.route,
              arguments: {"symptom": symptoms[index]}),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(symptoms[index]),
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}