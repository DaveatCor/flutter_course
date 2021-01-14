import 'package:flutter/material.dart';
import 'package:tutorial_flutter/screens/widets/cat.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {

  Animation<double> catAnimation;
  AnimationController catController;

  @override
  void initState() {
    super.initState();

    catController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this
    );

    catAnimation = Tween<double>(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(
        parent: catController,
        curve: Curves.easeIn
      )
      // catController
    );

    // Play Animation
    catController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AppBar"),
      ),
      body: AnimatedBuilder(
        animation: catAnimation, 
        builder: (context, child){
          // Builder Will Rebuild Everytime The Value Of Cat Controller Change
          // So We Use Container Because It Is Inexpensive Widget.
          return Container(
            child: child,
            margin: EdgeInsets.only(top: catController.value)
          );
        },
        child: Cat(),
      ),
    );
  }
}