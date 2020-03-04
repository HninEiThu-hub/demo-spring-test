import 'package:flutter/material.dart';
import 'about.dart';
import 'gratitude.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({Key key,}):super(key:key);
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {

  String _howAreYou = "...";
  void _openPageAbout({BuildContext context,bool fullScreeenDialog=false}){
    Navigator.push(context, MaterialPageRoute(
      fullscreenDialog: fullScreeenDialog,
      builder: (context) => About(),

    ));


  }

  void _openPageGradtitude({BuildContext context,bool fullScreenDialog=false}) async{
    final String _gradtitudeResponse=await Navigator.push(context, MaterialPageRoute(
      fullscreenDialog: fullScreenDialog,
      builder: (context) => Gradtitude(
        radioGroupValue: -1,
      ),
    ), );
    _howAreYou = _gradtitudeResponse ?? '';



  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Navigator'),
        backgroundColor: Colors.brown[800],
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () => _openPageAbout(
              context: context,
              fullScreeenDialog: true,

            ),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text('Grateful for: $_howAreYou',
            style: TextStyle(
              fontSize: 32.0,
            ),),
        ),


      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> _openPageGradtitude(context: context),
        tooltip: 'About',
        child: Icon(Icons.sentiment_satisfied),

      ),


    );
  }
}

