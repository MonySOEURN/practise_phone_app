
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phone_app/favorite_phone_screen.dart';
import 'package:phone_app/gender_optionScreen.dart';

class SurveyScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _State();
  }

}

class _State extends State<SurveyScreen>{

  var selectGender = 'select Gender';
  var selectPhone = 'select Phone';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Survey'),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(context){

    final surveyTitle = Center(
      child: Text('Survey',
        style: TextStyle(
          fontSize: 40,
        ),
      ),
    );

    final nameBox = TextField(
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1.0),
          ),
          hintText: 'Your Name'
      ),
    );

    final genderTab = GestureDetector(
      onTap: (){
        print('Gender tab clicked');
        showGenderOption(context, selectGender);
      },
      child: Row(
        children: <Widget>[
          Text('Gender:',
              style: TextStyle(
                fontSize: 20,)
          ),
          Spacer(),
          Text(selectGender,
              style: TextStyle(
                fontSize: 20,)),
          Icon(Icons.arrow_forward_ios)
        ],
      ),
    );

    final favoritephone = GestureDetector(
      onTap: (){
        print('favoritephone tab clicked');
        showFavoritePhone(context, selectPhone);
      },
      child: Row(
        children: <Widget>[
          Text('Favorite Phone:',
              style: TextStyle(
                fontSize: 20,)
          ),
          Spacer(),
          Text(selectPhone,
              style: TextStyle(
                fontSize: 20,)),
          Icon(Icons.arrow_forward_ios)
        ],
      ),
    );

    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          SizedBox(height: 20,),
          surveyTitle,
          SizedBox(height: 20,),
          nameBox,
          SizedBox(height: 25,),
          genderTab,
          SizedBox(height: 25,),
          favoritephone,
        ],
      ),
    );
  }

  void showGenderOption(context, selectGender) async {
    final route = MaterialPageRoute(
        builder: (context){
          return GenderOptionScreen(selectGender);
        }
    );
    final gender = await Navigator.of(context).push(route);
    if(gender != null){
      this.selectGender = gender;
      setState(() {});
    }
  }

  void showFavoritePhone(context, selectPhone) async {

    final route = MaterialPageRoute(
        builder: (context){
          return FavoritePhoneScreen(selectPhone);
        }
    );
    final favoritePhone = await Navigator.of(context).push(route);
    print(favoritePhone);
    if(favoritePhone != null){
      this.selectPhone = favoritePhone;
      setState(() {});
    }
  }
}