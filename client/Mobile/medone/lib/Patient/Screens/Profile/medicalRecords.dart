import 'package:flutter/material.dart';

class MedicalRecord extends StatelessWidget {
  static const route = "/medical-record";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Medical Record",
          style: Theme.of(context).textTheme.headline1,
        ),

        
      ),

      body: ListView(),
    );
  }
}
