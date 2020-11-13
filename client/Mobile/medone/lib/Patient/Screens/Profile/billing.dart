import '../../../utils/customLib.dart';

class Billing extends StatelessWidget {
  static const route = "/billing";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double w = MediaQuery.of(context).size.width / 3 * 1.2;

    debugPrint(w.toString());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Billing",
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width / 3 * 1.2,
                  child: Text(
                    "Doctors' Name",
                    style:
                        TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  "Date",
                  style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Amount",
                  style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) => Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(8),
                    width: MediaQuery.of(context).size.width / 3 * 1.2,
                    child: Text(
                      "Dr Mehedi Hasan Shifat",
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("04/03/2016"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("\$35"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
