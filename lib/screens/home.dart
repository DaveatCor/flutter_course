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
      duration: Duration(milliseconds: 800),
      vsync: this
    );

    catAnimation = Tween<double>(begin: -50.0, end: -70.0).animate(
      CurvedAnimation(
        parent: catController,
        curve: Curves.easeIn
      )
    );

    boxController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this
    );

    boxAnimation = Tween<double>(begin: pi * 0.6, end: pi * 0.65).animate(
      CurvedAnimation(
        parent: boxController,
        curve: Curves.easeInOut,
      )
    );

    // 33. Resetting  Animation
    boxAnimation.addStatusListener((status) {
      print("status $status");
      if(catAnimation.isCompleted || catAnimation.isDismissed) boxController.stop();
      else if (status == AnimationStatus.completed){
        boxController.reverse();
      } else if (status == AnimationStatus.dismissed){
        boxController.stop();
        boxController.forward();
      }
    });

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
              buildFlapLeft(),
              buildFlapRight(),
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
      width: 100,
      height: 100,
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
            angle: boxAnimation.value,
            child: child,
          );
        },
        child: Container(
          width: 70,
          height: 5,
          color: Colors.red
        ),
      ),
    );
  }

  // 35. Adding The Right Flap, 36. Negative Rotation Values
  Widget buildFlapRight(){
    return Positioned(
      right: 3.0,
      child: AnimatedBuilder(
        animation: boxAnimation,
        builder: (context, child){
          return Transform.rotate(
            alignment: Alignment.topRight,
            angle: -boxAnimation.value,
            child: child,
          );
        },
        child: Container(
          width: 70,
          height: 5,
          color: Colors.red
        ),
      ),
    );
  }
}