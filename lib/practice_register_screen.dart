import 'package:flutter/material.dart';

class PracticeRegisterScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    final facebookLogo = Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/facebook_logo.webp',),
        ),
      ),
    );
    final googleLogo = Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/google_logo.png',),
        ),
      ),
    );

    final shareLogo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        facebookLogo,
        SizedBox(width: 10,),
        googleLogo
      ],
    );

    final submitButtonWidget = Center(
      child: RaisedButton(
        color: Colors.blueGrey,
        onPressed: () {},
        textColor: Colors.white,
        padding: const EdgeInsets.all(0.0),
        child: Container(
          decoration: const BoxDecoration(
          ),
          child: const Text(
              'ចូល',
              style: TextStyle(fontSize: 20)
          ),
        ),
      ),
    );

    final emailField = TextFormField(
      decoration: InputDecoration(
          labelText: 'អុីមែល'
      ),
    );
    final passField = TextFormField(
      decoration: InputDecoration(
          labelText: 'ពាក្យសម្ងាត់'
      ),
    );

    final formWidget = Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          emailField,
          passField
        ],
      ),
    );

    final logoWidget = Center(child: Container(
        height: 230,
        width: 230,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(115)),
          color: Colors.white,
        ),
        child: Center(
          child: Container(
            width: 170,
            height: 170,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(45)),
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage('assets/fe_logo.png',),

              ),

            ),
          ),
        )
    ),
    );


    final toolbarWidget = AppBar(
      title: Text('គណនី'),
      backgroundColor: Colors.blueGrey,
    );

    final bodyWidget = Column(

      children: <Widget>[
        SizedBox(height: 20,),
        logoWidget,
        SizedBox(height: 20,),
        formWidget,
        SizedBox(height: 20,),
        submitButtonWidget,
        SizedBox(height: 20,),
        Text('ភ្លេចពាក្យសម្ងាត់'),
        Text('ចុះឈ្មោះ'),
        SizedBox(height: 50,),
        Text('ឬចូលតាមរយះ'),
        shareLogo
      ],
    );

    final registerScreenWidget = Scaffold(appBar: toolbarWidget, body: bodyWidget,);
    return registerScreenWidget;
  }

}