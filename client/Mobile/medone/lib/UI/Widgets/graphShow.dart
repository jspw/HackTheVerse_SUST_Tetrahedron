import '../../Utils/Others/customLib.dart';

Widget graphShow(String title, List<double> sensorData) {
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            padding: const EdgeInsets.all(5),
            color: Colors.green,
            child: Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold),
            )),
        SizedBox(
          height: 20,
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(sensorData
                                .reduce((current, next) =>
                                    current > next ? current : next)
                                .toString()
                                .substring(0, 4)),
                            SizedBox(height: 70),
                            Text(sensorData
                                .reduce((current, next) =>
                                    current < next ? current : next)
                                .toString()
                                .substring(0, 4)),
                          ]),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      decoration: BoxDecoration(
                        border: Border(
                            left: BorderSide(
                              color: Colors.black,
                            ),
                            bottom: BorderSide(color: Colors.black)),
                      ),
                      child: Sparkline(
                        data: sensorData,
                        lineColor: Colors.red,
                        pointsMode: PointsMode.all,
                        // pointColor: Colors.indigo,
                        pointSize: 3.0,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Time in sec"),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
