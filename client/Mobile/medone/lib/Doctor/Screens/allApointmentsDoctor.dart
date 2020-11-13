import '../../utils/customLib.dart';


class AppointmentsDoctor extends StatelessWidget {
  static const route = '/appointments-doctors';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        title: Text("Previous Appointments"),
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
                    "Patient's Name",
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
                  "Prescription",
                  style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(),
            ListView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: 50,
              itemBuilder: (context, index) => Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(8),
                    width: MediaQuery.of(context).size.width / 3 * 1.1,
                    child: Text(
                      "Mia Khalifa",
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("04/03/2016"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () => Navigator.pushNamed(
                          context, PrescriptionDetailView.route),
                      child: Container(
                          padding: const EdgeInsets.all(5),
                          color: Colors.green,
                          child: Text(
                            "View",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
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
