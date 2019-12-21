

import 'package:flutter/material.dart';
import 'package:phone_app/SurveyScreen.dart';

class GenderOptionScreen extends StatelessWidget{
  final String gender;

  GenderOptionScreen(this.gender);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Gender select'),
      ),
      body: _buildBody(context)
    );
  }

  Widget _buildBody(context){
    return Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        children: <Widget>[
          GestureDetector(
          onTap: (){
            Navigator.of(context).pop('Male');
          },
          child:
          ListTile(
            title: Text('Male',
              style: TextStyle(
                  fontWeight: FontWeight.bold
              ),
            ),
            trailing: _checkWidget(gender, 'Male'),
          ),
        ),
          GestureDetector(
            onTap: (){
              Navigator.of(context).pop('Female');
            },
            child:
            ListTile(
              title: Text('Female',
                style: TextStyle(
                    fontWeight: FontWeight.bold
                ),
              ),
              trailing: _checkWidget(gender, 'Female'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _checkWidget(gender, textGender){

    print(gender);
    bool check = false;
    if(gender == 'select Gender') {
      check = false;
      print(gender);
    } else {
      check = true;
    }

    if(check){
      if(textGender == 'Male' && gender == 'Male'){
        return Icon(Icons.check);
      }
      if (textGender == 'Female' && gender == 'Female'){
        return Icon(Icons.check);
      }
    }
  }

}