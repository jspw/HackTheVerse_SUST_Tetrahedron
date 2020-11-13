import 'package:flutter/material.dart';

class PrescriptionDetailView extends StatelessWidget {
  static const route = "/prescription-view";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        title: Text("Prescription | Fever"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          padding: const EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            border: Border.all(
              width: 2.0,
              color: Colors.green,
            ),
          ),
          child: ListView(
            shrinkWrap: true,
            // scrollDirection: Axis.vertical,
            physics: ScrollPhysics(),
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                child: Text(
                  "SUST Medical College,Sylhet",
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  "(5th Floor,Rose Vila,Modina Market,Sylhet)",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "Dr. Mehedi Hasan Shifat",
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
              ),
              Text("MBBS,FTPS,DDL(Africa),DML(Uganda)"),
              Text("Psychiatrist"),
              Text("+8801714986887"),
              Divider(
                color: Colors.black,
                thickness: 2.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Patient Name : Mia Malkova"),
                  Text("Date : 20/12/20"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Date of Birth : 04/11/1998"),
                  Text("Age : 22"),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                  "Putki mara khaise bhai.\nEi halarput bachbe nah r ! \nShesh or jibon. Chude chatni, bekar khatni!"),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  "Medicindes : ",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w400
                  ),
                ),
                
              ),
              Row(
                children: <Widget>[],
              )
            ],
          ),
        ),
      ),
    );
  }
}
