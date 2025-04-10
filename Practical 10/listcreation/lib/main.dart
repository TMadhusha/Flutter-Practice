import 'package:flutter/material.dart';

void main()=>runApp(DataPassingApp());

class DataPassingApp extends StatelessWidget {
    @override
    Widget build(BuildContext context){
      return MaterialApp(
        home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<String> items=['Apple', 'Banana', 'Orange'];
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Home Screen')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context,index){
          return ListTile(
            title: Text(items[index]),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context)=>DetailsScreen(item:items[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  final String item;
  DetailsScreen({required this.item});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Details Screen')),
      body: Center(
        child: Text('Selected item: $item'),
      ),
    );
  }
}
