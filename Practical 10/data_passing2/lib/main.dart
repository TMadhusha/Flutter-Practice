import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Passing Data',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TodosScreen(
        todos: List.generate(
            3,
            (i)=>Todo(
              title: 'Todo $i',
              description: 'Description of what needs to be done for Todo $i',
            ),
        ),
      ),
    );
  }
}

class Todo {
  final String title;
  final String description;

  const Todo({required this.title, required this.description});
}
class TodosScreen extends StatelessWidget{
  final List<Todo> todos;

  const TodosScreen({super.key, required this.todos});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Todos'),
      ),
      body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context,index){
            return ListTile(
              title: Text(todos[index].title),
              onTap:(){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context)=>DetailsScreen(todo:todos[index]),
                  ),
                );
              }
            );
          },
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget{
  final Todo todo;
  
  const DetailsScreen({required this.todo});
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text(todo.title),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(todo.description),
      ),
    );
  }
}