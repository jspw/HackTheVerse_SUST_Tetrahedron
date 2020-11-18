import 'package:http/http.dart' as http;

import '../../Utils/Others/customLib.dart';

class LoadingPage extends StatefulWidget {
  static const route = "/loading";

  String username;
  String password;

  LoadingPage(this.username, this.password);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    // throw UnimplementedError();
    return LoadingPageState(username, password);
  }
}

class LoadingPageState extends State {
  final String apiUrl = ApiUrl.url;

  String username;
  String password;

  LoadingPageState(this.username, this.password);

  Future<Map<String, dynamic>> loginRequest(
      String username, String password) async {
    final http.Response response = await http.post(
      apiUrl + '/admin/login',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          <String, String>{"username": username, "password": password}),
    );

    // print(jsonDecode(response.body));
    return jsonDecode(response.body);
  }

  checkTokenAlreadySaved(String token) {}

  storeTokenLocally(String token) {}

  Future<void> getData(String username, String password) async {
    var info = await loginRequest(username, password);
    print(info);
    if (info["status"] == "success") {
      String token = info["jwt"]["token"];
      storeTokenLocally(token);
      if (info["data"]["user"]["role"] == "nurse" ||
          info["data"]["user"]["role"] == "doctor") {
        Navigator.pushNamed(context, HealthWorkerHome.route,
            arguments: {"userInfo": info["data"]["user"], "token": token});
      }
    } else {
      Navigator.pop(context, true);
      // invalidLoginMessage(context);

    }
  }

  void initState() {
    super.initState();
    getData(username, password);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: loading(),
      ),
    );
  }
}
