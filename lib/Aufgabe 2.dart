import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CRUD'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => createData(),
              child: const Text('Create'),
            ),
            ElevatedButton(
              onPressed: () => readData(),
              child: const Text('Read'),
            ),
            ElevatedButton(
              onPressed: () => updateData(),
              child: const Text('Update'),
            ),
            ElevatedButton(
              onPressed: () => deleteData(),
              child: const Text('Delete'),
            ),
          ],
        ),
      ),
    );
  }

  // CRUD mit Shared Preferences

  Future<void> createData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('info', 'Data saved');
  }

  Future<void> readData() async {}

  Future<void> updateData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('info', 'updated Data');
  }

  Future<void> deleteData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('info');
  }
}
