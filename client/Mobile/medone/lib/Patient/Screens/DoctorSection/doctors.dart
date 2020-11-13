import 'package:flutter/material.dart';
import 'package:medone/Patient/Widgets/doctorsList.dart';
import 'package:medone/Patient/Widgets/secondaryAppbar.dart';

class Doctors extends StatelessWidget {

  static const route = "/doctors";

    List<Map<String, String>> doctors = [
    {
      "name": "Dr. Autul Rahman",
      "degree": "MBBS,DPM(Dublin),MRC(UK),FRCP(Edin)",
      "location": "Sylhet",
      "designation": "Psychiatrist",
      "hospital": "SUST Medical Collage Hospital",
    },
    {
      "name": "Dr. Majah Islam Kafi",
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

    final String specialist = routeArgs['part'];
    
    return Scaffold(
      appBar: PreferredSize(
          child: SecondaryAppBar(specialist+"s", specialist + "s NearBy You"),
          preferredSize: Size(MediaQuery.of(context).size.width, 130)),

      body: DoctorsList(doctors),
    );
  }
}
