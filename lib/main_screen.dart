import 'package:flutter/material.dart';
import 'package:phone_app/SurveyScreen.dart';
import 'package:phone_app/categories_screen.dart';
import 'package:phone_app/home_screen.dart';
import 'package:phone_app/practice_register_screen.dart';
import 'package:phone_app/practise_product_screen.dart';
import 'package:phone_app/search_screen.dart';

class MainScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _State();
  }

}

class _State extends State<MainScreen>{

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final bottomNavigationBarWidget = BottomNavigationBar(
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.yellow,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.blueGrey,
      currentIndex: currentIndex,
      onTap: (index){
        print("$index");
        setState(() {
          currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home")
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text("Category")
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text("Search")
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.question_answer),
            title: Text("Survey")
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text("Account")
        ),
      ]
    );

    final screen = Scaffold(
      body: _buildBodyWidget(),
      bottomNavigationBar: bottomNavigationBarWidget,
    );

    return screen;
  }

  Widget _buildBodyWidget() {
    switch (currentIndex) {
      case 0:
        {
          return HomeScreen();
        }
      case 1:
        {
          return Categories_Screen();
        }
      case 2:
        {
          return SearchScreen();
        }
      case 3:
        {
          return SurveyScreen();
        }
      default:
        {
          return PracticeRegisterScreen();
        }
    }
  }
}