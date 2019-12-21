

import 'package:flutter/material.dart';

class Categories_Screen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _State();
  }

}

class _State extends State<Categories_Screen>{
  List<String> _categories;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadCategories().then((categories){
      _categories = categories;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Categories"),),
      body: _buildBody(),
    );
  }

  Widget _buildBody(){
    if(_categories == null){
      return Center(child: CircularProgressIndicator(),);
    } else {
      return ListView.builder(
        itemCount: _categories.length,
        itemBuilder: (context, index){
        String category = _categories[index];
        return ListTile(title: Text(category),);
        }
      );
    }
  }

  Future<List<String>> _loadCategories() async {
    var categories = ['គ្រឿងសម្អាង', 'សម្ភារៈផ្ទះបាយ', 'សម្ភារៈសំណង់', 'ផ្ទះបាយ'];
    await Future.delayed(
        Duration(seconds: 3)
    );
    return categories;
  }



}