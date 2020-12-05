import 'package:flutter/material.dart';
import 'package:tutorial_flutter/bloc/bloc.dart';

class Provider extends InheritedWidget{

  final bloc = Bloc();

  Provider({
    Key key, 
    Widget child
  }) : super(key: key, child: child);

  @override
  updateShouldNotify(_) => true;

  // static Bloc of(BuildContext context){
  //   return (context.dependOnInheritedWidgetOfExactType() as Provider).bloc;
  // }
  
  static Provider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>();
  }
}