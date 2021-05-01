import 'package:flutter/material.dart';
import 'package:tutorial_flutter/src/bloc/stories_provider.dart';
import 'package:tutorial_flutter/src/screen/new_list.dart';

class App extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => AppBody();
}

class AppBody extends State<App>{
  
  Widget build(BuildContext context){
    return StoriesProvider(
      child: MaterialApp(
        home: NewsList(),
      ),
    );
  }
}