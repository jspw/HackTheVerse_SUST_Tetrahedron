import 'package:flutter/material.dart';

class Types extends StatelessWidget {
  String route;
  List<String> types;

  Types(this.types,this.route);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return ListView.builder(
      physics: ScrollPhysics(),
      shrinkWrap: true,
      itemCount: types.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () => Navigator.pushNamed(context, route,
              arguments: {"part": types[index]}),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                types[index],
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
          ),
        );
      },
    );
  }
}
