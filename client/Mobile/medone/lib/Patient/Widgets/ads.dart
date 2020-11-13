import 'package:flutter/material.dart';

class Ads extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 230.0,
        child: ListView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          // shrinkWrap: true,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(10),
              height: 200,
              width: 350,
              child: Image.asset(
                "assets/images/ad1.png",
                fit: BoxFit.fill,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              height: 200,
              width: 350,
              child: Image.asset(
                "assets/images/ad1.png",
                fit: BoxFit.fill,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              height: 200,
              width: 350,
              child: Image.asset(
                "assets/images/ad1.png",
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
