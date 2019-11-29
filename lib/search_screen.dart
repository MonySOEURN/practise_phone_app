import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phone_app/Product.dart';

class SearchScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    final searchScreenWidget = Scaffold(
        body: Center(
          child: Text("Search"),
        )
    );
    return searchScreenWidget;
  }

}
