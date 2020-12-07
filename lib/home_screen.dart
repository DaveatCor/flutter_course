import 'package:flutter/material.dart';
import 'package:tutorial_flutter/provider/provider.dart';

class Home extends StatefulWidget {
  
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of(context);
    return Container(
      child: RaisedButton(
        child: Text("Click"),
        onPressed: (){
          provider.bloc.submit();
        },
      ),
    );
  }
}