import '../../utils/customLib.dart';

class CustomDrawer extends StatelessWidget {
  String name, role, id, apiUrl;

  CustomDrawer(this.name, this.role, this.id, apiUrl);

  Widget OptionsBuilder(
      BuildContext context, String route, String option, Icon icon,
      [var x]) {
    return InkWell(
      onTap: () => x == null
          ? Navigator.pushNamed(context, route)
          : Navigator.pushNamed(context, route, arguments: [x]),
      hoverColor: Colors.grey,
      splashColor: Colors.blue,
      child: Card(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(15.0),
                  child: icon,
                ),
                SizedBox(
                  width: 20.0,
                ),
                Text(
                  option,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 20.0),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(
                Icons.navigate_next,
                color: Theme.of(context).accentColor,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget OptionsBuilder2(BuildContext context, String option, String route) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, route),
      hoverColor: Colors.grey,
      splashColor: Colors.blue,
      child: Container(
        // color: Colors.blue,
        height: 40.0,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(10.0),
        alignment: Alignment.topLeft,
        child: Text(
          option,
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Container(
              padding: const EdgeInsets.all(10.0),
              // height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.indigo[200],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 200.0,
                    height: 200.0,
                    decoration: new BoxDecoration(
                      boxShadow: [
                        BoxShadow(color: Colors.transparent, spreadRadius: 3),
                      ],
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        image: AssetImage('assets/images/$role' + '1.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        Text(
                          name,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0),
                        ),
                        Text("($role)"),
                      ],
                    ),
                  ),
                  // Divider(),
                ],
              ),
            ),
          ),

          GestureDetector(
            child: Container(
              margin: const EdgeInsets.all(40),
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.indigo),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Logout",
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0),
                ),
              ),
            ),
            onTap: () {
              // clearSession();

              //Navigator.popUntil(context, ModalRoute.withName('/'));
              Navigator.pop(context, true);
              Navigator.pop(context, true);

              Navigator.pushNamed(context, Login.route);
            },
          ),
          // Column(
          //   children: <Widget>[
          //     SizedBox(
          //       height: 20.0,
          //     ),
          //     OptionsBuilder2(context, "Settings", ""),
          //     OptionsBuilder2(context, "Terms & Conditions / Privacy", ""),
          //     OptionsBuilder2(context, "Log Out", Login.route),
          //   ],
          // ),
        ],
      ),
    );
  }
}
