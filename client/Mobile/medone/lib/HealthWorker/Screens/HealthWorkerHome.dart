import 'package:medone/HealthWorker/Screens/Socket/Chat/chatPage.dart';

import '../../utils/customLib.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_socket_io/flutter_socket_io.dart';
import 'package:flutter_socket_io/socket_io_manager.dart';

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

  String url = ApiUrl.url;

  //socket

  SocketIO socketIO;

  // lOCAL pUSH NOTIFICATION

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  AndroidInitializationSettings androidInitializationSettings;
  IOSInitializationSettings iosInitializationSettings;
  InitializationSettings initializationSettings;

  //socket

  List<String> messages;
  TextEditingController textController;
  ScrollController scrollController;

  @override
  void initState() {
    socketIO = SocketIOManager().createSocketIO(
      url,
      '/',
    );

    socketIO.init();

    socketIO.subscribe('receive_message', (jsonData) {
      //Convert the JSON data received into a Map
      Map<String, dynamic> data = json.decode(jsonData);
      print("Data From socket");
      print(data);
      // // this.setState(() => messages.add(data['message']));
      // scrollController.animateTo(
      //   scrollController.position.maxScrollExtent,
      //   duration: Duration(milliseconds: 600),
      //   curve: Curves.ease,
      // );
    });

    socketIO.subscribe("socket_info", _onSocketInfo);

    socketIO.connect();

    super.initState();
    // initializing();
  }

  _onSocketInfo(dynamic data) {
    print("Socket info: " + data);
  }

  _socketStatus(dynamic data) {
    print("Socket status: " + data);
  }

  // void initializing() async {
  //   androidInitializationSettings = AndroidInitializationSettings('app_icon');

  //   iosInitializationSettings = IOSInitializationSettings(
  //       onDidReceiveLocalNotification: onDidReceiveLocalNotification);

  //   initializationSettings = InitializationSettings(
  //       androidInitializationSettings, iosInitializationSettings);

  //   await flutterLocalNotificationsPlugin.initialize(initializationSettings,
  //       onSelectNotification: onSelectNotification);
  // }

  // void _showNotifications() async {
  //   await notification();
  // }

  // void _showNotificationsAfterSecond(int time) async {
  //   print("Time : $time");
  //   await notificationAfterSec(time.abs());
  // }

  // Future<void> notification() async {
  //   AndroidNotificationDetails androidNotificationDetails =
  //       AndroidNotificationDetails(
  //           'Channel ID', 'Channel title', 'channel body',
  //           priority: Priority.High,
  //           importance: Importance.Max,
  //           ticker: 'test');

  //   IOSNotificationDetails iosNotificationDetails = IOSNotificationDetails();

  //   NotificationDetails notificationDetails =
  //       NotificationDetails(androidNotificationDetails, iosNotificationDetails);
  //   await flutterLocalNotificationsPlugin.show(
  //       0, 'Hello there', 'You have Upcoming Contests', notificationDetails);
  // }

  // Future<void> notificationAfterSec(int time) async {
  //   var timeDelayed = DateTime.now().add(Duration(seconds: time));
  //   AndroidNotificationDetails androidNotificationDetails =
  //       AndroidNotificationDetails(
  //           'second channel ID', 'second Channel title', 'second channel body',
  //           priority: Priority.High,
  //           importance: Importance.Max,
  //           ticker: 'test');

  //   IOSNotificationDetails iosNotificationDetails = IOSNotificationDetails();

  //   NotificationDetails notificationDetails =
  //       NotificationDetails(androidNotificationDetails, iosNotificationDetails);
  //   await flutterLocalNotificationsPlugin.schedule(1, 'Hello Coder!',
  //       'Its Contest Time', timeDelayed, notificationDetails);
  // }

  // Future onSelectNotification(String payLoad) async {
  //   if (payLoad != null) {
  //     print("payLoad : $payLoad");
  //   }
  // }

  // Future onDidReceiveLocalNotification(
  //     int id, String title, String body, String payload) async {
  //   return CupertinoAlertDialog(
  //     title: Text(title),
  //     content: Text(body),
  //     actions: <Widget>[
  //       CupertinoDialogAction(
  //           isDefaultAction: true,
  //           onPressed: () {
  //             print("");
  //           },
  //           child: Text("Okay")),
  //     ],
  //   );
  // }

  Widget featureOptions(BuildContext contex, String title, String route,
      String imgUrl, String token) {
    return GestureDetector(
      onTap: () =>
          Navigator.pushNamed(contex, route, arguments: {"token": token}),
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

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;

    var UserInfo = routeArgs['UserInfo'];
    String token = routeArgs['token'];

    print('Token in Home');

    print(token);

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
            onTap: () {
              // _showNotificationsAfterSecond(DateTime.daysPerWeek);

              Navigator.pushNamed(context, NotificationsToNurse.route);
            },
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
                    child: Text("4",
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
            featureOptions(context, "Patient List", PatientsList.route,
                "assets/images/hospitalisation.png", token),
            featureOptions(context, "Nurses", NursesList.route,
                "assets/images/nurse.png", token),
            featureOptions(context, "Doctors", DoctorsList.route,
                "assets/images/doctor.png", token),
            featureOptions(context, "Chat", ChatPage.route,
                "assets/images/chat.png", token),
          ],
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: ScrollPhysics(),
        ),
      ),
      drawer: CustomDrawer(UserInfo["name"], UserInfo["role"], "hash", "http"),
    );
  }
}
