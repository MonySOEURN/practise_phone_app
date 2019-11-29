import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phone_app/Product.dart';

class ProductDetail extends StatelessWidget{
  final Product product;

  ProductDetail(this.product);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(product.name),
        )
      ),
      body: Center(
        child: Text(product.name),
      ),
    );
  }

}