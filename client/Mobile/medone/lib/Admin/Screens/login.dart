import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../utils/customLib.dart';

// khan@kh.an
// mypass1234
// Khan@khaaaa.an
// mypass12324

//patient
// mypass12a324
// as@khaaaaa.an

class Login extends StatefulWidget {
  static const route = "/login";

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    // throw UnimplementedError();
    return LoginState();
  }
}

class LoginState extends State {
  final String apiUrl = ApiUrl.url;
  TextEditingController _usernameController, _passwordController;
  bool _rembermeValue = false;

  final _formKey = GlobalKey<FormState>();

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  invalidLoginMessage(BuildContext context) {
    final snackBar = SnackBar(
      content: Container(
        alignment: Alignment.center,
        height: 50,
        child: Text(
          'Invalid username or password',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Colors.red,
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  Future<Map<String, dynamic>> loginRequest(
      String username, String password) async {
    final http.Response response = await http.post(
      apiUrl + 'admin/login',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{"username": username, "password": password}),
    );

    // print(jsonDecode(response.body));
    return jsonDecode(response.body);
  }

  checkTokenAlreadySaved(String token) {}

  storeTokenLocally(String token) {}

  Future<void> getData(String username, String password) async {
    print('Awaiting user ...');
    var info = await loginRequest(username, password);
    print(info);
    if (info["status"] == "success") {
      var id = info["data"]["user"]["_id"];
      String token = info["token"];
      storeTokenLocally(token);
      if (info["data"]["user"]["role"] == "doctor") {
        Navigator.pushNamed(context, DoctorHome.route,
            arguments: {"UserInfo": info["data"]["user"]});
      } else if (info["data"]["user"]["role"] == "nurse") {
        Navigator.pushNamed(context, HealthWorkerHome.route,
            arguments: {"UserInfo": info["data"]["user"]});
      }
    } else {
      invalidLoginMessage(context);
      _usernameController.clear();
      _passwordController.clear();
    }

    print("Shit");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: ListView(
        physics: ScrollPhysics(),
        children: [
          Container(
            height: 350,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              'assets/images/doc.png',
              fit: BoxFit.fill,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.center,
            child: Text(
              "Login",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 30.0,
              ),
            ),
          ),
          Form(
            key: _formKey,
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter an username address';
                        }
                        // else if (this.invalidEmainOrPass)
                        //   return "username or Password invalid!";
                        return null;
                      },
                      controller: _usernameController,
                      style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                        fontSize: 24.0,
                      ),
                      decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                        labelText: "username",
                        border: new OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                        hoverColor: Colors.indigo,
                        fillColor: Colors.blue,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter an your password';
                        }
                        //  else if (this.invalidEmainOrPass)
                        //   return "username or Password invalid!";
                        return null;
                      },
                      obscureText: true,
                      controller: _passwordController,
                      style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                        fontSize: 24.0,
                      ),
                      decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.security,
                          color: Colors.black,
                        ),
                        labelText: "Password",
                        border: new OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                        hoverColor: Colors.indigo,
                        fillColor: Colors.blue,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Checkbox(
                                checkColor: Colors.blue,
                                value: _rembermeValue,
                                onChanged: (_rememberValue) {
                                  setState(() {
                                    _rembermeValue = !_rembermeValue;
                                  });
                                }),
                            Text(
                              "Remember Me",
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.black),
                            )
                          ],
                        ),
                        FlatButton(
                          onPressed: null,
                          child: Text(
                            "Forget Password ?",
                            overflow: TextOverflow.ellipsis,
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.black),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              color: Colors.blue,
              child: FlatButton(
                onPressed: () {
                  // patient
                  //     ? Navigator.pushNamed(context, PatientHome.route)
                  //     : doctor
                  //         ? Navigator.pushNamed(context, "doctor-route")
                  //         : Navigator.pushNamed(context, "pharmacy-route");

                  // print(_usernameController.text);
                  // Navigator.pushNamed(context, "doctor-route");
                  // if (_usernameController.text == "" ||
                  //     _passwordController.text == "") {
                  //   final snackBar = SnackBar(
                  //     content: Text(
                  //       'Invalid username or password',
                  //       style: TextStyle(
                  //         color: Colors.white,
                  //       ),
                  //     ),
                  //     backgroundColor: Colors.red,
                  //   );
                  //   Scaffold.of(context).showSnackBar(snackBar);
                  //   print("Empty");
                  // } else
                  if (_formKey.currentState.validate())
                    getData(_usernameController.text, _passwordController.text);
                },
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "or ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500),
                ),
                GestureDetector(
                  child: Text(
                    " Signup ",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500),
                  ),
                  onTap: () => debugPrint("Signup"),
                ),
                Text(
                  "as Patient",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }
}
