import 'package:flutter/material.dart';

void main()=>runApp(NavigationApp());

class NavigationApp extends StatelessWidget {
    // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('First Screen')),
      body: Center(
        child: ElevatedButton(
            child: Text('Go to Second Screen'),
            onPressed:(){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=>SecondScreen()),
              );
            },
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Second Screen')),
      body: Center(
        child: ElevatedButton(
            child: Text('Go Back'),
            onPressed: (){
              Navigator.pop(context);
            },
        ),
      ),
    );
  }
}

