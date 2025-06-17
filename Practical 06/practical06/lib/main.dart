import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Center(
              child: Column(
        children: [
          Text(
            "Hello, Flutter. This is me",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.pink),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              print("Clicked");
            },
            child: Text("Click me"),
          ),
        ],
      ))),
    );
  }
}
