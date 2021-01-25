import 'package:flutter/material.dart';
import 'package:tutorial_flutter/screens/widets/cat.dart';
import 'dart:math';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {

  Animation<double> catAnimation;
  AnimationController catController;
  
  Animation<double> boxAnimation;
  AnimationController boxController;

  @override
  void initState() {
    super.initState();

    catController = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this
    );

    catAnimation = Tween<double>(begin: -100.0, end: -200.0).animate(
      CurvedAnimation(
        parent: catController,
        curve: Curves.easeIn
      )
    );

    boxController = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this
    );

    boxAnimation = Tween<double>(begin: 0.0, end: 3.14).animate(
      CurvedAnimation(
        parent: boxController,
        curve: Curves.linear,
      )
    );

    // Video number 12
    // Play Animation
    // catController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AppBar"),
      ),
      body: GestureDetector( // Video Number 13
        onTap: (){
          if (catController.status == AnimationStatus.dismissed) catController.forward();
          else if (catAnimation.status == AnimationStatus.completed) catController.reverse();


          if (boxAnimation.status == AnimationStatus.dismissed) boxController.forward();
          else if (boxAnimation.status == AnimationStatus.completed) boxController.reverse();
        },
        child: Center(
          child: Stack(
            overflow: Overflow.visible,
            children: [
              buildCatAnimation(),
              buildBox(),
              buildFlapLeft()
            ],
          ),
        )
      )
    );
  }

  Widget buildCatAnimation(){
    return AnimatedBuilder(
      animation: catAnimation, 
      builder: (context, child){
        // Builder Will Rebuild Everytime The Value Of Cat Controller Change
        // So We Use Container Because It Is Inexpensive Widget.
        return Positioned(
          child: child,
          top: catAnimation.value,
          left: 0.0,
          right: 0.0
        );
      },
      child: Cat(),
    );
  }

  Widget buildBox(){
    return Container(
      width: 300,
      height: 300,
      color: Colors.red,
    );
  }

  Widget buildFlapLeft(){
    return Positioned(
      left: 3.0,
      child: AnimatedBuilder(
        animation: boxAnimation,
        builder: (context, child){
          return Transform.rotate(
            alignment: Alignment.topLeft,
            angle: boxAnimation.value * 0.6,
            child: child,
          );
        },
        child: Container(
          width: 100,
          height: 10,
          color: Colors.red
        ),
      ),
    );
  }
}