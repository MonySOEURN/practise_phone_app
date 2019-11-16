import 'package:flutter/material.dart';
import 'package:phone_app/Product.dart';

class PractiseProductScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {



    final categories = ['ទាំងអស់','សៀវភៅសដដសថ','សម្ភារះផ្ទះបាយ','អេឡិតត្រូនិច','គ្រឿងសម្អាង'];
    final products = [
      Product(1, 'Iphone Xs Max', 'assets/iphone_xs_max.jpg', 1280),
      Product(2, 'Iphone Xs Max12', 'assets/iphone_xs_max.jpg', 1280),
      Product(3, 'Iphone Xs Max', 'assets/iphone_xs_max.jpg', 1280),
      Product(4, 'Iphone Xs Max', 'assets/iphone_xs_max.jpg', 1280),
      Product(5, 'Iphone Xs Max', 'assets/iphone_xs_max.jpg', 1280),
      Product(6, 'Iphone Xs Max', 'assets/iphone_xs_max.jpg', 1280),
      Product(7, 'Iphone Xs Max', 'assets/iphone_xs_max.jpg', 1280),
      Product(8, 'Iphone Xs Max', 'assets/iphone_xs_max.jpg', 1280)
    ];

    final productWidget = Expanded(
      child: Container(
        color: Color(0xd7ded5),
          child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(products.length, (index) {
              return Center(

                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Container(
                    height: 250,
                    width: 200,
                    child: Column(
                      children: <Widget>[
                        Image.asset(products[index].imageUrl, width: 200, height: 150,),
                        Text(products[index].name),
                        Text('${products[index].price}')
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                    ),
                  ),
                )
              );
            }),
          )
      ),
    );

    final categoryWidget = Container(
      decoration: BoxDecoration(
        color: Colors.grey
      ),
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index){
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Text(categories[index], style: (
                TextStyle(
                  color: Colors.black,
                )),),
          );
        },
      ),
    );

    final toolbarWidget = AppBar(
      title: Text('ផលិតផលថ្មីៗ'),
      backgroundColor: Colors.blueGrey,
    );

    final bodyWidget = Column(

      children: <Widget>[
        categoryWidget,
        productWidget
      ],
    );

    final registerScreenWidget = Scaffold(appBar: toolbarWidget, body: bodyWidget,);
    return registerScreenWidget;
  }

}