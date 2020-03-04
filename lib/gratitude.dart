import 'package:flutter/material.dart';

class Gradtitude extends StatefulWidget {
  final int radioGroupValue;
  Gradtitude({Key key,@required this.radioGroupValue}):super(key : key);
  @override
  _GradtitudeState createState() => _GradtitudeState();
}

class _GradtitudeState extends State<Gradtitude> {
  List<String> _gradtitudeList=List();
  String _selectedGradtitude;
  int _radioGroupValue;

  void _radioOnChanged(int index){
    setState(() {
      _radioGroupValue=index;
      _selectedGradtitude=_gradtitudeList[index];
      print('_selectedRadioValue $_selectedGradtitude');
    });

  }

  @override
  void initState() {
    super.initState();
    _gradtitudeList..add('Family')..add('Friends')..add('Coffee');
    _radioGroupValue=widget.radioGroupValue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gradtitude'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.check),
            onPressed: ()=>Navigator.pop(context,_selectedGradtitude),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: <Widget>[
              Radio(
                value: 0,
                groupValue: _radioGroupValue,
                onChanged: (index) => _radioOnChanged(index),
              ),
              Text('Family'),
              Radio(
                value: 1,
                groupValue: _radioGroupValue,
                onChanged: (index) => _radioOnChanged(index),

              ),
              Text('Friends'),
              Radio(
                value: 2,
                groupValue: _radioGroupValue,
                onChanged: (index) => _radioOnChanged(index),

              ),
              Text('Coffee'),

            ],
          ),
        ),
      ),
    );
  }
}
