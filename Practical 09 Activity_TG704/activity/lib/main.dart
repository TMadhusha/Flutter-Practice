import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Form'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>(); // Form key
  final _nameController = TextEditingController(); // name controller
  final _mailController = TextEditingController(); //mail controller
  final _pwdController  = TextEditingController();
  final _confirmPwdController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _mailController.dispose();
    _pwdController.dispose();
    _confirmPwdController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // If the form is valid, display a snackbar with input value
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                'Registration Successfull'
            ),
        ),
      );
    }
  }

  void _clearForm() {
    // Clear all text fields
    _nameController.clear();
    _mailController.clear();
    _pwdController.clear();
    _confirmPwdController.clear();

    // Optionally, reset the form validation state
    _formKey.currentState?.reset();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    title: Text(widget.title),
    ),
    body: Center(
    child: Container(
    width: 350, // Reduce form width
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
    color: Colors.white,
    ),
    child: Form(
    key: _formKey,
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    TextFormField(
    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    controller: _nameController,
    decoration: const InputDecoration(
    labelText: 'Enter Name',
    border: OutlineInputBorder(),
    ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your name';
        }
        return null;
      },
    ),
      const SizedBox(
        height: 20,
      ),
      TextFormField(
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        controller: _mailController,
        decoration: const InputDecoration(
          labelText: 'Enter Email',
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your email';
          }
          else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(value)) {
            return 'Please enter a valid email address';
          }
          return null;
        },
      ),
      const SizedBox(
        height: 20,
      ),
      TextFormField(
        style: TextStyle(fontSize: 16, fontWeight:FontWeight.bold),
        controller: _pwdController,
        decoration: const InputDecoration(
          labelText: 'Enter Password',
          border: OutlineInputBorder(),
        ),
        obscureText: true,
        validator: (value){
          if(value == null || value.isEmpty){
            return 'Please enter the password';
          }
          return null;
        },
      ),
      const SizedBox(
        height: 20,
      ),
      TextFormField(
        style: TextStyle(fontSize: 16, fontWeight:FontWeight.bold),
        controller: _confirmPwdController,
        decoration: const InputDecoration(
          labelText: 'Confirm Password',
          border: OutlineInputBorder(),
        ),
        obscureText: true,
        validator: (value){
          if(value == null || value.isEmpty){
            return 'Please re-enter the password';
          }
          else if (value != _pwdController.text) {
            return 'Passwords do not match';
          }
          return null;
        },
      ),
      const SizedBox(height: 30),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: _submitForm,
            child: const Text('Submit'),
          ),
          const SizedBox(width: 20),
          ElevatedButton(
            onPressed: _clearForm,
            child: const Text('Clear'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey, // Gray color for the clear button
            ),
          ),
        ],
      ),
    ],
    ),
    ),
    ),
    ),
    );
  }
}