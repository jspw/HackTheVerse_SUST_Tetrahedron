
import '../../utils/customLib.dart';

class FeatureOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return GridView.count(
      shrinkWrap: true,
      primary: false,
      padding: const EdgeInsets.all(10),
      crossAxisSpacing: 5,
      mainAxisSpacing: 5,
      crossAxisCount: 3,
      childAspectRatio: 0.8,
      children: <Widget>[
        options("assets/images/medical-record.png", "রোগলক্ষন", context,
            SymtomsFindingSelectPart.route),
        options(
            "assets/images/doctor.png", "ডাক্তার", context, Designation.route),
        options("assets/images/ambulance.png", "এ্যাম্বুলেন্স", context,
            AmbulanceServices.route),
        options("assets/images/hospital.png", "হাসপাতাল", context,
            HospitalTypes.route),
        options("assets/images/capsules.png", "ঔসধ", context, "/medicine"),
        options("assets/images/first-aid-kit.png", "প্রাথমিক চিকিৎসা", context,
            "/aid"),
        options("assets/images/chat.png", "গুপ্ত আলাপ", context, "/chat"),
      ],
    );
  }
}

Widget options(
    String source, String heading, BuildContext contex, String route) {
  return GestureDetector(
    onTap: () => Navigator.pushNamed(contex, route),
    child: Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Image.asset(
                source,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                heading,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
