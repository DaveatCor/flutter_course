import 'package:flutter/material.dart';
import 'package:tutorial_flutter/src/screen/new_list.dart';

class App extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => AppBody();
}

class AppBody extends State<App>{
  
  Widget build(BuildContext context){
    return MaterialApp(
      home: NewsList(),
    );
  }
}