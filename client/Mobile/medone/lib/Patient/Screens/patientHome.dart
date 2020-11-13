import 'package:flutter/material.dart';
import 'package:medone/Patient/Widgets/ads.dart';
import 'package:medone/Patient/Widgets/drawer.dart';
import 'package:medone/Patient/Widgets/featureOptions.dart';

class PatientHome extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  static const route = "/patient-home";

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;

    var UserInfo = routeArgs['UserInfo'];

    print(UserInfo);

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
          "মেডি সেবা",
          style: Theme.of(context).textTheme.headline1,
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.speaker_notes,
                color: Theme.of(context).accentColor,
              ),
              onPressed: null),
          Stack(
            textDirection: TextDirection.rtl,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.notifications,
                  color: Theme.of(context).accentColor,
                  size: 40,
                ),
                onPressed: () => Navigator.pushNamed(context, "Cart.route"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.all(5),
                  // alignment: Alignment.topRight,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.blue),
                  child: Text("3",
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
              )
            ],
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            color: Theme.of(context).accentColor,
            child: Ads(),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: FeatureOptions(),
          ),
        ],
      ),
      drawer: DrawerX(UserInfo["name"],UserInfo["name"]),
    );
  }
}
