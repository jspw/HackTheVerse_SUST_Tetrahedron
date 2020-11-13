import '../../../utils/customLib.dart';

class SymtomsFindingSelectPart extends StatelessWidget {
  static const route = "/find-symtomps-select-part";

  List<String> bodyParts = [
    "হাত",
    "পা",
    "গলা",
    "নাক",
    "কান",
    "চোখ",
    "চামড়া",
    "দাঁত",
    "পিঠ",
    "বুক",
    "গোপন অঙ্গ",
    "তলপেট",
    "গাইনী",
    "শিশু",
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return Scaffold(
      appBar: PreferredSize(
        child: SecondaryAppBar("রোগলক্ষন", "আক্রান্ত অঙ্গ নির্বাচন করুন"),
        preferredSize: Size(MediaQuery.of(context).size.width, 130),
      ),
      body: Types(bodyParts, SelectSymtoms.route),
    );
  }
}

// "রোগলক্ষন | " + body_part

// রোগলক্ষন

// "আক্রান্ত অঙ্গ নির্বাচন করুন"
