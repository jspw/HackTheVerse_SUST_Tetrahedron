import 'package:medone/HealthWorker/Screens/Socket/Chat/chatPage.dart';

import './customLib.dart';

class Routes {
  static routes() {
    return {
      //AUTH
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
      PrescriptionDetailView.route: (context) => PrescriptionDetailView(),
      TakeAppointment.route: (contex) => TakeAppointment(),

      // User : Doctor
      DoctorHome.route: (cotext) => DoctorHome(),
      // DashboardDoctor.route: (coontex) => DashboardDoctor(),
      // AppointmentsDoctor.route: (contex) => AppointmentsDoctor(),
      // Patient.route: (context) => Patient(),

      //Health Worker
      HealthWorkerHome.route: (context) => HealthWorkerHome(),
      NotificationsToNurse.route: (contex) => NotificationsToNurse(),
      DoctorsList.route: (contex) => DoctorsList(),
      NursesList.route: (context) => NursesList(),
      PatientsList.route: (contex) => PatientsList(),
    //   PatientProfile.route: (contex) => PatientProfile(
    //     // argument: ModalRoute.of(context).settings.arguments),

      ChatPage.route : (contex) => ChatPage(),

    };
  }

  static initScreen() {
    return Login.route;
    // return HealthWorkerHome.route;
    // return DoctorHome.route;
  }
}
