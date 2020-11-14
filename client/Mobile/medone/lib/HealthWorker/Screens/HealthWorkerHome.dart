import '../../utils/customLib.dart';

class HealthWorkerHome extends StatefulWidget {
  static const route = "/HealthWorker-home";

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    // throw UnimplementedError();
    return HealthWorkerHomeState();
  }
}

class HealthWorkerHomeState extends State {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.person,
            color: Theme.of(context).accentColor,
          ),
          onPressed: () => _scaffoldKey.currentState.openDrawer(),
        ),
        title: Text(
          "MedOne",
          style: Theme.of(context).textTheme.headline1,
        ),
        centerTitle: true,
        actions: <Widget>[
          GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, NotificationsToNurse.route),
            child: Stack(
              textDirection: TextDirection.rtl,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.notifications,
                    color: Theme.of(context).accentColor,
                    size: 40,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.blue),
                    child: Text("5",
                        style: TextStyle(color: Colors.white, fontSize: 15)),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        alignment: AlignmentDirectional.center,
        child: GridView.count(
          childAspectRatio: 1.2,
          children: <Widget>[
            featureOptions(context, "My Tasks", TaskWorkers.route,
                "assets/images/medical-record.png"),
            featureOptions(context, "Patient List", PatientsList.route,
                "assets/images/hospitalisation.png"),
            featureOptions(context, "Doctors", DoctorsList.route,
                "assets/images/doctor.png"),
            featureOptions(
                context, "Chat", "/all-doctors-list", "assets/images/chat.png"),
          ],
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: ScrollPhysics(),
        ),
      ),
      drawer: CustomDrawer("Amina Begum", "Nurse", "hash", "http"),
    );
  }
}

Widget featureOptions(
    BuildContext contex, String title, String route, String imgUrl) {
  return GestureDetector(
    onTap: () => Navigator.pushNamed(contex, route),
    child: Card(
      color: Colors.lightBlue[800],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            child: Image.asset(imgUrl),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w900),
            ),
          )
        ],
      ),
    ),
  );
}
