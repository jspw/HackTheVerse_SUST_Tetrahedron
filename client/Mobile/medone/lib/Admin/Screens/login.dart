import 'dart:io';

import 'package:flutter/material.dart';
import 'package:medone/Admin/Widgets/customTextField.dart';
import 'package:medone/Doctor/Screens/doctorHome.dart';
import 'package:medone/Patient/Screens/patientHome.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

// khan@kh.an
// mypass1234
// Khan@khaaaa.an
// mypass12324

//patient
// mypass12a324
// as@khaaaaa.an

final String apiUrl = "https://cc0d906a8f3c.ngrok.io/";

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
  TextEditingController _emailController, _passwordController;
  bool _rembermeValue = false;

  final _formKey = GlobalKey<FormState>();

  bool invalidEmainOrPass = false;

  bool doctor = true;
  bool patient = false;
  bool pharmacist = false;

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  invalidLoginMessage(BuildContext context) {
    final snackBar = SnackBar(
      content: Container(
        alignment: Alignment.center,
        height: 50,
        child: Text(
          'Invalid email or password',
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
      String email, String password) async {
    final http.Response response = await http.post(
      apiUrl + 'users/login',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{"email": email, "password": password}),
    );

    // print(jsonDecode(response.body));
    return jsonDecode(response.body);
  }

  // Future<Map<String, dynamic>> UserInfo(var id, String token) async {
  //   final http.Response response = await http.get(
  //     apiUrl + 'users/' + id,
  //     headers: {
  //       "Accept": "application/json",
  //       "Content-type": "application/json",
  //       // "authorization": "$token"
  //       HttpHeaders.authorizationHeader: "Bearer $token",
  //       // "authorization": "Bearer $token"
  //     },
  //   );

  //   // print(token);
  //   return jsonDecode(response.body);
  // }

  checkTokenAlreadySaved(String token) {}

  storeTokenLocally(String token) {}

  Future<void> getData(String email, String password) async {
    print('Awaiting user ...');
    var info = await loginRequest(email, password);
    print(info);
    if (info["status"] == "success") {
      var id = info["data"]["user"]["_id"];
      String token = info["token"];
      storeTokenLocally(token);
      if (info["data"]["user"]["role"] == "doctor") {
        Navigator.pushNamed(context, DoctorHome.route,
            arguments: {"UserInfo": info["data"]["user"]});
      } else if (info["data"]["user"]["role"] == "patient") {
        Navigator.pushNamed(context, PatientHome.route,
            arguments: {"UserInfo": info["data"]["user"]});
      }
    } else {
      invalidLoginMessage(context);
      _emailController.clear();
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
                          return 'Please enter an Email address';
                        }
                        // else if (this.invalidEmainOrPass)
                        //   return "Email or Password invalid!";
                        return null;
                      },
                      controller: _emailController,
                      style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                        fontSize: 24.0,
                      ),
                      decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.email,
                          color: Colors.black,
                        ),
                        labelText: "Email",
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
                        //   return "Email or Password invalid!";
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

                  // print(_emailController.text);
                  // Navigator.pushNamed(context, "doctor-route");
                  // if (_emailController.text == "" ||
                  //     _passwordController.text == "") {
                  //   final snackBar = SnackBar(
                  //     content: Text(
                  //       'Invalid email or password',
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
                    getData(_emailController.text, _passwordController.text);
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
