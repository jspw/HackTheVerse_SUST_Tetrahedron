import '../../Utils/Others/customLib.dart';

Widget sensorDataShowCard(
    String img, String title, String amount, String comment) {
  return Card(
    child: Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.asset(img),
          Text(title),
          Text(amount),
        ],
      ),
    ),
  );
}
