import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phone_app/Product.dart';
import 'package:phone_app/product_detail_screen.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
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
    return homeScreenWidget;
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
        child: Padding(
          padding: EdgeInsets.only(left: 8),
          child: Text(name),
        ),
      ),
    );
  }

  Widget buildingItemCategoryList(name){

    final products = [
      Product(1, 'iphone 1', 'assets/iphone_xs_max.jpg', 1233),
      Product(2, 'iphone 2', 'assets/iphone_xs_max.jpg', 1233),
      Product(3, 'iphone 3', 'assets/iphone_xs_max.jpg', 1233),
      Product(4, 'iphone 4', 'assets/iphone_xs_max.jpg', 1233),
      Product(5, 'iphone 5', 'assets/iphone_xs_max.jpg', 1233),
    ];

    final phoneDataWidget = Container(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index){
          return GestureDetector(
            onTap: (){
//              print(products[index].name);
              showProductDetail(products[index], context);
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Image.asset(products[index].imageUrl, width: 100, height: 100,),
                  Text(products[index].name),
                  Text('${products[index].price}')
                ],
              ),
            ),
          );
        },
      ),
      margin: EdgeInsets.only(top: 5),
      height: 145,
//    color: Colors.red,
      decoration: BoxDecoration(
//          border: Border.all(color: Colors.red),
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Color(0xcdde90)
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
      height: 180,
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

  void showProductDetail(Product product,BuildContext context){
    print(product.name);
    final route = MaterialPageRoute(
      builder: (context){
        return ProductDetail(product);
      }
    );
    Navigator.of(context).push(route);
  }


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