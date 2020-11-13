import '../../utils/customLib.dart';

class DoctorsList extends StatelessWidget {
  static const route = '/doctors-list';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        title: Text("All Doctors"),
      ),
      body: ListView(
        children: <Widget>[
          Text("data"),
        ],
      ),
    );
  }
}
