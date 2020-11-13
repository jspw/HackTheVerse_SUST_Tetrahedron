import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  static const route = '/test';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(),
      body: ListView()
    );
  }
}

Widget createTable() {
  List<TableRow> rows = [];
  for (int i = 0; i < 100; ++i) {
    rows.add(TableRow(children: [
      Text("number " + i.toString()),
      Text("squared " + (i * i).toString()),
    ]));
  }
  return Table(children: rows);
}
