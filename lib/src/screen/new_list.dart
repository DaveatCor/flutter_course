import 'package:flutter/material.dart';
import 'package:tutorial_flutter/src/bloc/stories_provider.dart';

class NewsList extends StatelessWidget{
  
  Widget build(BuildContext context){
    final bloc = StoriesProvider.of(context);
    return Scaffold(

      appBar: AppBar(
        title: Text('Top News')
      ),
      body: Text(
        'Show some news here!'
      ),
    );
  }
}