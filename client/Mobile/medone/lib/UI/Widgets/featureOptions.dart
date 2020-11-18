  import '../../Utils/Others/customLib.dart';
  
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