import 'dart:ffi';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';

/**
 * Date of write: 01-11-2019
 */
void main(){
  int _current = 0;

  final categories = ["សៀវភៅ", 'សំភារះផ្ទះបាយ', 'គ្រឿងសម្អាង', 'គ្រឿងអលង្ការ'];
  final slidePaths = ["assets/example1.jpg", "assets/example2.jpeg", "assets/example3.jpeg"];

  final slider = slidePaths.map((imagePath){
    return Column(
      children: <Widget>[
        buildSliderItem(imagePath),

      ],
    );
  }).toList();

  final newSlider = slidePaths.map((c){
    return ExactAssetImage(c);
  }).toList();

  final itemsListView = Container(
      height: 50,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index){
            return buildItemListView(categories[index]);
          })
  );

  final sliderContainerWidget = CarouselSlider(
    height: 400,
    enlargeCenterPage: true,
    items:
      slider
  );

  final cartWidget = Container(
    height: 60,
    width: 60,
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.white,
      ),
      color: Color(0x80000000),
      borderRadius: BorderRadius.all(Radius.circular(30)),
    ),
    child: Icon(Icons.shopping_cart,
      color: Colors.yellow,
      size: 35,
    ),
  );

//  final stackWidget = Stack(
//    children: <Widget>[
//      Positioned(
//        child: cartWidget,
//        right: 20,
//        top: 40,
//      )
//    ],
//
//  );

  final underSlideWidget = Container(
    margin: EdgeInsets.all(10),
    child: Column(
      children: <Widget>[
        itemsListView,
        buildingItemCategoryList('ផលិតផលថ្មីៗ'),
        buildingItemCategoryList("បញ្ចុះតម្លៃ"),
        buildingItemCategoryList("ផលិតផងពេញនិយម")
      ],
    ),
  );

  final bodyWidget = ListView(
    children: <Widget>[
      CarouselPage(children: newSlider,),
//      stackWidget,
//      CarouselPage(children: newSlider,),
//      sliderContainerWidget,
      underSlideWidget,
    ],
  );

  final homeScreenWidget = Stack(
    children: <Widget>[
      Scaffold(body: bodyWidget,),
      Positioned(
        child: cartWidget,
        right: 10,
        top: 50,
      )
    ],
  );
  final phoneApp = MaterialApp(home: homeScreenWidget,);
  runApp(phoneApp);

}

Widget buildItemListView(name){
  return Container(
    margin: EdgeInsets.all(8),
    width: 100,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(25),),
      border: Border.all(
        color: Colors.black,
      ),
    ),
    child: Center(
      child: Text(name),
    ),
  );
}

Widget buildingItemCategoryList(name){

  final phoneDataWidget = Container(
    margin: EdgeInsets.only(top: 5),
    height: 90,
//    color: Colors.red,
    decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.all(Radius.circular(5))
    ),
  );

  final firstPhoneRowLable = Container(
    padding: EdgeInsets.only(left: 10),
    height: 30,
    child: Row(
      children: <Widget>[
        Text(name),
        Spacer(),
        Icon(Icons.arrow_forward_ios)
      ],
    ),
  );

  return Container(
    height: 140,
    child: Column(
      children: <Widget>[
        firstPhoneRowLable,
        phoneDataWidget
      ],
    ),
  );
}

Widget buildSliderItem(imagePath){
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 8),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      image: DecorationImage(
        image: AssetImage(imagePath),
        fit: BoxFit.fill,
      )
    ),
  );
}

class CarouselPage extends StatelessWidget{
  final List<ExactAssetImage>children;

  const CarouselPage({Key key, this.children}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 300,
      child: Carousel(
        autoplay: false,
        borderRadius: true,
        boxFit: BoxFit.fill,
        dotSize: 6,
        showIndicator: true,
        dotBgColor: Colors.transparent,
        dotIncreasedColor: Colors.blueGrey,
        indicatorBgPadding: 7,
        images: children,
      ),
    );
  }

}





/**
 * Date of write: 26-10-2019
 */

/*
void main(){

  final categories = ["សៀវភៅ", 'សំភារះផ្ទះបាយ', 'គ្រឿងសម្អាង', 'គ្រឿងអលង្ការ'];
  /*
  final categoriesItemWidgetMode1 = categories.map((category){
    return buildItemListView(category);
  }).toList();
  */


  final bookItemView = Container(
    margin: EdgeInsets.all(8),
    width: 100,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(25),),
      border: Border.all(
        color: Colors.black,
      ),
    ),
    child: Center(
      child: Text('សៀរភៅ'),
    ),
  );

  /*
  final itemsListView = Container(
    height: 50,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: categoriesItemWidgetMode1,
    ),
  );
  */

  final itemsListView = Container(
    height: 50,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (context, index){
        return buildItemListView(categories[index]);
      })
  );

  final sliderContainerWidget = Container(
    height: 400,
    color: Colors.black,
  );

  final bodyWidget = Column(
    children: <Widget>[
      sliderContainerWidget,
      SizedBox(height: 5),
      itemsListView,
    ],
  );
  final homeScreenWidget = Scaffold(body: bodyWidget,);
  final phoneApp = MaterialApp(home: homeScreenWidget,);
  runApp(phoneApp);

}

Widget buildItemListView(String name){
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 5),
    padding: EdgeInsets.symmetric(horizontal: 24),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(25),),
      border: Border.all(
        color: Colors.black,
      ),
    ),
    child: Center(
      child: Text(name),
    ),
  );
}
*/

/**
 * Date of write: 25-10-2019
 * Homework 1
 */
/*
void main(){


  final bookItemView = Container(
    margin: EdgeInsets.all(8),
    width: 100,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(25),),
      border: Border.all(
        color: Colors.black,
      ),
    ),
    child: Center(
      child: Text('សៀរភៅ'),
    ),
  );

  final itemsListView = Container(
    height: 50,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        buildItemListView('សៀវភៅ'),
        bookItemView,
      ],
    ),
  );

  final sliderContainerWidget = Container(
    height: 400,
    color: Colors.black,
  );

  final underSlideWidget = Container(
    margin: EdgeInsets.all(10),
    child: Column(
      children: <Widget>[
        itemsListView,
        buildingItemCategoryList('ផលិតផលថ្មីៗ'),
        buildingItemCategoryList("បញ្ចុះតម្លៃ"),
        buildingItemCategoryList("ផលិតផងពេញនិយម")
      ],
    ),
  );

  final bodyWidget = Column(
    children: <Widget>[
      sliderContainerWidget,
      underSlideWidget,
    ],
  );
  
  final homeScreenWidget = Scaffold(body: bodyWidget,);
  final phoneApp = MaterialApp(home: homeScreenWidget,);
  runApp(phoneApp);

}

Widget buildItemListView(name){
  return Container(
    margin: EdgeInsets.all(8),
    width: 100,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(25),),
      border: Border.all(
        color: Colors.black,
      ),
    ),
    child: Center(
      child: Text(name),
    ),
  );
}

Widget buildingItemCategoryList(name){

  final phoneDataWidget = Container(
    margin: EdgeInsets.only(top: 5),
    height: 90,
//    color: Colors.red,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black),
      borderRadius: BorderRadius.all(Radius.circular(5))
    ),
  );

  final firstPhoneRowLable = Container(
    padding: EdgeInsets.only(left: 10),
    height: 30,
    child: Row(
      children: <Widget>[
        Text(name),
        Spacer(),
        Icon(Icons.arrow_forward_ios)
      ],
    ),
  );

  return Container(
    height: 140,
    child: Column(
      children: <Widget>[
        firstPhoneRowLable,
        phoneDataWidget
      ],
    ),
  );
}
*/

/**
 * Date of write: 19-10-2019
 */
/*
void main (){
  final iconWidget = Icon(Icons.account_circle, size: 148,);
  final textWidget = Text('Faculty of Engineering', textAlign: TextAlign.center,textScaleFactor: 2,);
  final bodyWidget = Center(
    child: Container(
      color: Colors.blue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          iconWidget,
          SizedBox(height: 8,),
          textWidget,
        ],
      ),
    ),
  );
  final scaffoldWidget = Scaffold(body: bodyWidget,);
  final homeScreen = MaterialApp(home: scaffoldWidget,);
  runApp(homeScreen);
}
*/

/**
 * date of write: 18-10-2019
 */
/*
void main (){

  Widget titleWidget = Text('Fe online shop');

  Widget appBarWidget = AppBar(title: titleWidget,);

  Widget scaffoldWidget = Scaffold(appBar: appBarWidget,);

  Widget screenWidget = MaterialApp(home: scaffoldWidget,);
  runApp(screenWidget);

}
 */