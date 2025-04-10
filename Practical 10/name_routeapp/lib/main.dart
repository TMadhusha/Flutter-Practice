import 'package:flutter/material.dart';

void main() => runApp(NamedRoutesApp());

class NamedRoutesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => MainScreen(),
        '/setting': (context) => SettingsScreen(),
        '/profile': (context) => ProfileScreen(name: 'John Deo'),
      },
    );
  }
}

class MainScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Main Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child:Text('Go to Setting'),
              onPressed: (){
                Navigator.pushNamed(context, '/setting');
              },
            ),
            ElevatedButton(
              child: Text('View Profile'),
              onPressed: (){
                Navigator.pushNamed(context, '/profile');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Center(
        child: ElevatedButton(
            child: Text('Go Back'),
            onPressed: (){
              Navigator.pop(context);
            }
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget{
  final String name;

  ProfileScreen({required this.name});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('profile')),
      body: Center(
        child: Text('Welcome $name'),
      ),
    );
  }
}

