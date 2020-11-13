import '../../../utils/customLib.dart';

class Designation extends StatelessWidget {

  static const route = "/doctors-designation";

  List<String> doctorTypes = [
    "Cardiologist",
    "Audiologist",
    "Dentist",
    "ENT specialist(ear, nose and throat)",
    "Gynaecologist",
    "Orthopaedic surgeon",
    "Paediatrician",
    "Psychiatrist",
    "Veterinarian",
    "Radiologist",
    "Pulmonologist",
    "Endocrinologist",
    "Oncologist",
    "Neurologist",
    "Cardiothoracic surgeon",
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      appBar: PreferredSize(
          child: SecondaryAppBar("Types", "Select your needed types of doctor"),
          preferredSize: Size(MediaQuery.of(context).size.width, 130)),
      body: Types(doctorTypes, Doctors.route),
    );
  }
}
