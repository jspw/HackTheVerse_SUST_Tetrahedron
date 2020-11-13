import 'package:flutter/material.dart';
import 'package:medone/Patient/Widgets/secondaryAppbar.dart';
import 'package:medone/Patient/Widgets/types.dart';

class AmbulanceServices extends StatelessWidget {
  
  static const route = "/ambulance-service-types";

  List<String> servicetypes = [
    "Standard (non Air-Conditioned)",
    "Air-Conditioned",
    "Intensive Care Unit (ICU)",
    "Freezer (for Transporting the Deceased)",
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      appBar: PreferredSize(
          child: SecondaryAppBar("Ambulance", "Types of ambulance services"),
          preferredSize: Size(MediaQuery.of(context).size.width, 130)),
      body: Types(servicetypes, "route"),
    );
  }
}
