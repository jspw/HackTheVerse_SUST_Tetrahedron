import '../../Utils/Others/customLib.dart';

class Login extends StatefulWidget {
  static const route = "/login";

  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State {
  TextEditingController _usernameController, _passwordController;
  bool _rembermeValue = true;

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
    print("Come here");
  }

  void navigateLoadingScreen(BuildContext context) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    if (await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => LoadingPage(
                  _usernameController.text,
                  _passwordController.text,
                )))) invalidLoginMessage(context);
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
                          return 'Please enter your Username';
                        }

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
                          return 'Please enter  your password';
                        }
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
                  if (_formKey.currentState.validate())
                    navigateLoadingScreen(context);

                  // if (_formKey.currentState.validate())
                  //   getData(_usernameController.text, _passwordController.text);
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
          SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }
}
