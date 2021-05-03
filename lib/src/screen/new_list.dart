import 'package:flutter/material.dart';
import 'package:tutorial_flutter/src/bloc/stories_bloc.dart';
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

  Widget buildList(StoriesBloc bloc){
    return StreamBuilder(
      stream: bloc.topIds,
      builder: (context, snapshot){

        if (!snapshot.data) return Text("Still waiting on Ids");

        return ListView.builder(
          itemCount: snapshot.data.length,
          itemBuilder: (context, int index) {
            return Text(snapshot.data);
          }
        );
      },
    );
  }
}