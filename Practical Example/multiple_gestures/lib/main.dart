import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: GestureDetector(),
        theme: ThemeData(
          // ThemeData should be here
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
        ),
    );
  }
}

class GestureDemo extends StatefulWidget{
  @override
  _GestureDemoState createState() => _GestureDemoState();
}

class _GestureDemoState extends State<GestureDemo>{
  String _gestureText = "Try tapping, swipping or long-pressing!";
  @override
  Widget build(BuildContext context){
    return
  }
}

