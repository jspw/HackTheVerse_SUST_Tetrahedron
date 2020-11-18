import 'customLib.dart';

class Routes {
  static routes() {
    return {
      //AUTH
      Login.route: (context) => Login(),

      //User
      HealthWorkerHome.route: (context) => HealthWorkerHome(),
      NotificationsToNurse.route: (contex) => NotificationsToNurse(),
      DoctorsList.route: (contex) => DoctorsList(),
      NursesList.route: (context) => NursesList(),
      PatientsList.route: (contex) => PatientsList(),
      InitialScreen.route : (contex) => InitialScreen(),

      //Util

      ChatPage.route: (contex) => ChatPage(),
    };
  }

  static initScreen() {
    return InitialScreen.route;
  }
}
