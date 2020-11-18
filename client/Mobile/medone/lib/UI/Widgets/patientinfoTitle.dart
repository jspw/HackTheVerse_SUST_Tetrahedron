import '../../Utils/Others/customLib.dart';

Widget patientinfoTitle(String title) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      title,
      style: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
    ),
  );
}
