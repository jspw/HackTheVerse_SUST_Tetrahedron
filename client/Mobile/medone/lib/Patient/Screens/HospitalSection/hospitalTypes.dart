import 'package:flutter/material.dart';
import 'package:medone/Patient/Widgets/secondaryAppbar.dart';
import 'package:medone/Patient/Widgets/types.dart';

class HospitalTypes extends StatelessWidget {
  static const route = "/hospital-types";

  @override
  List<String> hospitalCatagory = ["Private Hospital", "Governmental Hospital"];

  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      appBar: PreferredSize(
          child: SecondaryAppBar("Hospitals", "Select your Hospital Type"),
          preferredSize: Size(MediaQuery.of(context).size.width, 130)),
      body: Types(hospitalCatagory, "route"),
    );
  }
}
