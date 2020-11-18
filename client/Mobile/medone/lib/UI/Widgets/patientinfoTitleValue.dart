import '../../Utils/Others/customLib.dart';

Widget patientinfoTitleValue(String value) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      value,
      style: TextStyle(
        fontSize: 18.0,
        color: Colors.grey,
        fontWeight: FontWeight.w500,
      ),
      overflow: TextOverflow.ellipsis,
    ),
  );
}
