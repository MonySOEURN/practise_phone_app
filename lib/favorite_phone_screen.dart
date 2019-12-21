

import 'package:flutter/material.dart';
import 'package:phone_app/Product.dart';
import 'package:http/http.dart' as api;
import 'dart:convert';

import 'package:phone_app/SurveyScreen.dart';

class FavoritePhoneScreen extends StatefulWidget{

  final String phone;

  FavoritePhoneScreen(this.phone);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _State();
  }
}

class _State extends State<FavoritePhoneScreen>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Phone'),
      ),
      body: _buildBody()
    );
  }

  Widget _buildBody(){
    return FutureBuilder(
      future: _loadFavoriteProduct(),
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.done){
          if(snapshot.hasError){
            return Center(
                child: Text("${snapshot.error}")
            );
          } else {
            return GridView.count(
              // Create a grid with 2 columns. If you change the scrollDirection to
              // horizontal, this produces 2 rows.
              crossAxisCount: 2,
              // Generate 100 widgets that display their index in the List.
              children: List.generate(snapshot.data.length, (index) {
                return GestureDetector(
                  onTap: (){
                    Navigator.of(context).pop(snapshot.data[index].name);
                  },
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            height: 250,
                            width: 200,
                            child: Column(
                              children: <Widget>[
                                Image.network(snapshot.data[index].imageUrl, width: 200, height: 150,),
                                Text(snapshot.data[index].name),
                                Text('${snapshot.data[index].price}')
//                            Text('name'),
//                            Text('price'),
                              ],
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            child: _buildCheckWidget(snapshot.data[index].name),
                          ),
                        ],
                      )
                    )
                  ),
                );
              }),
            );
          }
        } else {
        return Center(
          child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Future<List<Product>> _loadFavoriteProduct() async {
    var url = 'http://lp.js-cambodia.com/rupp/phones.php';
    var response = await api.get(url);
    List<Product> product = ConvertToListofProduct(response.body);
    return product;
  }

  List<Product> ConvertToListofProduct(String stringAll){
    List jsonArray = json.decode(stringAll);
    List<Product> product = jsonArray.map((phoneJson){
      return Product(phoneJson['id'],phoneJson['name'],phoneJson['imageUrl'],phoneJson['price']);
    }).toList();
    return product;
  }

  Widget _buildCheckWidget(name){

    bool check = false;
    if(widget.phone == 'select Phone') {
      check = false;
      print(widget.phone);
    } else {
      check = true;
    }
    if(widget.phone == name){
      return Container(
        height: 30,
        width: 30,
        child: Icon(Icons.check, color: Colors.white,),
        decoration: BoxDecoration(
          color: Color(0x80000000),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
      );
    } else {
      return null;
    }
  }

}