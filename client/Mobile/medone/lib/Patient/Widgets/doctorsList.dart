import 'package:flutter/material.dart';
import 'package:medone/Patient/Screens/takeAppointment.dart';

class DoctorsList extends StatelessWidget {
  List<Map<String, String>> doctors;

  DoctorsList(this.doctors);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: doctors.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () => Navigator.pushNamed(context, TakeAppointment.route,
            arguments: {"doctorName": doctors[index]["name"]}),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      doctors[index]["name"],
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text(doctors[index]["degree"],
                        style: TextStyle(
                          fontSize: 18.0,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text(doctors[index]["location"],
                        style: TextStyle(
                          fontSize: 18.0,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text(doctors[index]["designation"],
                        style: TextStyle(fontSize: 18.0, color: Colors.blue)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text(doctors[index]["hospital"],
                        style: TextStyle(
                          fontSize: 18.0,
                        )),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
