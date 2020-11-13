import 'package:flutter/material.dart';
import 'package:medone/Patient/Screens/Profile/prescriptionDetail.dart';

class Prescriptions extends StatelessWidget {
  static const route = "/prescriptions";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Prescriptions",
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: ListView.builder(
          itemCount: 8,
          itemBuilder: (BuildContext context, int index) => Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  child: Container(
                    padding: const EdgeInsets.only(left: 20, right: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("12/11/2010"),
                            IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                  size: 30,
                                ),
                                onPressed: null)
                          ],
                        ),
                        Text(
                          "Dr Mehedi Hasan Shifat",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.indigoAccent)),
                          child: Text(
                            "Fever",
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.indigo),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(""),
                            IconButton(
                                icon: Icon(
                                  Icons.remove_red_eye,
                                  color: Colors.green,
                                  size: 30,
                                ),
                                onPressed: () => Navigator.pushNamed(
                                    context, PrescriptionDetailView.route)),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )),
    );
  }
}
