

import 'package:flutter/material.dart';

class Categories_Screen2 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _State();
  }
}

class _State extends State<Categories_Screen2>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Categories"),),
      body: _buildBody(),
    );
  }

  Widget _buildBody(){
    return FutureBuilder(
      future: _loadCategories(),
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.done) {
          if(snapshot.hasError){
            return Center(
                child: Text("${snapshot.error}")
            );
          } else {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index){
                var categories = snapshot.data[index];
                return ListTile(title: Text(categories));
            });
          }
        } else {
          return Center(child: CircularProgressIndicator(),);
        }
      },
    );
  }

  Future<List<String>> _loadCategories() async {
//    var url = "";
//    var response = ;
//    var categories = ['គ្រឿងសម្អាង', 'សម្ភារៈផ្ទះបាយ', 'សម្ភារៈសំណង់', 'ផ្ទះបាយ'];
//    await Future.delayed(
//        Duration(seconds: 3)
//    );
//    return categories;
  }

}