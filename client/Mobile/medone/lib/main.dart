import 'Utils/Others/customLib.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "MedOne",
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
    routes: Routes.routes(),
    initialRoute: Routes.initScreen(),
  ));
}
