import 'package:flutter/material.dart';
import 'package:medone/Patient/Widgets/doctorsList.dart';
import '../../Widgets/secondaryAppbar.dart';

class DoctorsSuggest extends StatelessWidget {
  static const route = "/doctors-suggest";

  List<Map<String, String>> doctors = [
    {
      "name": "Dr. Autul Rahman",
      "degree": "MBBS,DPM(Dublin),MRC(UK),FRCP(Edin)",
      "location": "Sylhet",
      "designation": "Psychiatrist",
      "hospital": "SUST Medical Collage Hospital",
    },
    {
      "name": "Dr. Kafi Ullah Dey",
      "degree": "MBBS, DPM(Hululu), MKR(Barlin), FRCP(Boom)",
      "location": "Dhaka",
      "designation": "Psychiatrist",
      "hospital": "BUET Medical Hospital Pvt Ltd",
    },
  ];

  

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final String symptom = routeArgs['symptom'];

    return Scaffold(
      appBar: PreferredSize(
        child: SecondaryAppBar(symptom, "এই বিষয়ে বিশেষজ্ঞ ডাক্তারদের লিস্ট"),
        preferredSize: Size(MediaQuery.of(context).size.width, 130),
      ),
      body: DoctorsList(doctors),
    );
  }
}
