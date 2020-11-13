import 'package:flutter/material.dart';
import 'package:medone/Doctor/Screens/patient.dart';
import 'package:medone/Doctor/Screens/allApointmentsDoctor.dart';
import 'package:medone/Doctor/Screens/dashboardDoctor.dart';
import 'package:medone/Doctor/Screens/doctorHome.dart';
import 'package:medone/Doctor/Screens/test.dart';
import 'package:medone/Patient/Screens/AmbulanceSection/services.dart';
import 'package:medone/Patient/Screens/DiseaseSymptomSection/doctorsSuggest.dart';
import 'package:medone/Patient/Screens/DiseaseSymptomSection/selectSymtoms.dart';
import 'package:medone/Patient/Screens/DiseaseSymptomSection/bodyParts.dart';
import 'package:medone/Patient/Screens/DoctorSection/designation.dart';
import 'package:medone/Patient/Screens/DoctorSection/doctors.dart';
import 'package:medone/Patient/Screens/HospitalSection/hospitalTypes.dart';
import 'package:medone/Patient/Screens/Profile/billing.dart';
import 'package:medone/Patient/Screens/Profile/dashboardPatient.dart';
import 'package:medone/Patient/Screens/Profile/medicalRecords.dart';
import 'package:medone/Patient/Screens/Profile/prescriptionDetail.dart';
import 'package:medone/Patient/Screens/Profile/prescriptions.dart';
import 'package:medone/Patient/Screens/takeAppointment.dart';
import 'Admin/Screens/login.dart';
import 'Patient/Screens/patientHome.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      brightness: Brightness.light,
      backgroundColor: Colors.grey,
      primaryColor: Colors.indigo[300],
      accentColor: Colors.white,
      secondaryHeaderColor: Colors.black,
      textTheme: TextTheme(
        headline1: TextStyle(
            fontSize: 22.0, fontWeight: FontWeight.w900, color: Colors.white),
        headline2: TextStyle(
            fontSize: 20.0,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            color: Colors.black),
        bodyText2: TextStyle(
          fontSize: 18.0,
        ),
      ),
    ),
    // initialRoute: DoctorHome.route,
    // initialRoute: PatientHome.route,
    initialRoute: Login.route,
    routes: {
      Login.route: (context) => Login(),
      // User : Patient
      PatientHome.route: (context) => PatientHome(),
      SymtomsFindingSelectPart.route: (context) => SymtomsFindingSelectPart(),
      SelectSymtoms.route: (context) => SelectSymtoms(),
      DoctorsSuggest.route: (contex) => DoctorsSuggest(),
      DashboardPatient.route: (context) => DashboardPatient(),
      Designation.route: (contex) => Designation(),
      AmbulanceServices.route: (contex) => AmbulanceServices(),
      HospitalTypes.route: (contex) => HospitalTypes(),
      Doctors.route: (context) => Doctors(),
      Billing.route: (context) => Billing(),
      MedicalRecord.route: (context) => MedicalRecord(),
      Prescriptions.route: (context) => Prescriptions(),
      PrescriptionDetailView.route : (context) => PrescriptionDetailView(),
      TakeAppointment.route : (contex) => TakeAppointment(),
      // User : Doctor
      DoctorHome.route : (cotext) => DoctorHome(),
      DashboardDoctor.route : (coontex) => DashboardDoctor(), 
      AppointmentsDoctor.route : (contex) => AppointmentsDoctor(),
      Patient.route : (context) => Patient(),
      Test.route : (contex) => Test(),
    },
  ));
}
