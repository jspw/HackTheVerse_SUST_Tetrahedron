import '../../utils/customLib.dart';

class Patient extends StatelessWidget {
  static const route = "/patient";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Patients"),
      ),
      body: ListView(
        children: <Widget>[
          GridView.count(
            shrinkWrap: true,
            primary: false,
            padding: const EdgeInsets.all(10),
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            children: <Widget>[
              Card(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [Colors.blue, Colors.indigo])),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/doc.png"),
                              ),
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          Text(
                            "Kabir Sing",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Icon(
                            Icons.people_outline,
                            color: Colors.white,
                          ),
                          Text(
                            "56",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      Divider(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
