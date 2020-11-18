import '../../Utils/Others/customLib.dart';

class InitialScreen extends StatefulWidget {
    static const route = "/init";
  @override
  _InitialScreenState createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen>
    with TickerProviderStateMixin {
  Animation animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    final CurvedAnimation curve =
        new CurvedAnimation(parent: controller, curve: Curves.decelerate);
    animation = new Tween(begin: 80.0, end: 150.0).animate(curve);
    animation.addStatusListener(listener);
    controller.forward();
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => Login())));
  }


  void listener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      controller.reverse();
    } else if (status == AnimationStatus.dismissed) {
      controller.forward();
    }
  }

  Widget builder(BuildContext context, Widget child) {
    return new Container(
      height: animation.value,
      width: animation.value,
      child: Image.asset(
        'assets/images/apple-touch-icon.png',
        fit: BoxFit.cover,
      ),
    );
  }


  @override
dispose() {
  controller.dispose(); // you need this
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        // height: MediaQuery.of(context).size.height,
        // width: MediaQuery.of(context).size.width,
        // child: 
        // DecoratedBox(
        //   position: DecorationPosition.background,
          // decoration: BoxDecoration(
          //   color: Colors.white,
          //   image: DecorationImage(
          //     image: AssetImage("assets/images/background.jpg"),
          //     fit: BoxFit.fill,
          //   ),
          // ),
          child: Center(
            child: AnimatedBuilder(animation: animation, builder: builder),
          ),
        // ),
      ),
    );
  }
}
