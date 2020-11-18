  import '../../Utils/Others/customLib.dart';
  Widget healthInfoCards(String title, bool up) {
    return Card(
      child: Container(
        height: 60,
        padding: const EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal),
            ),
            Icon(
              up ? Icons.arrow_drop_up : Icons.arrow_drop_down,
              size: 50,
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }