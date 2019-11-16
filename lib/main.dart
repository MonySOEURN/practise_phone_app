import 'package:flutter/material.dart';
import 'package:phone_app/practice_register_screen.dart';
import 'package:phone_app/practise_product_screen.dart';

/**
 * Date of write: 01-11-2019
 */
void main(){

//  final phoneApp = MaterialApp(home: PractiseProductScreen(),);
  final phoneApp = MaterialApp(home: PracticeRegisterScreen(),);
  runApp(phoneApp);

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