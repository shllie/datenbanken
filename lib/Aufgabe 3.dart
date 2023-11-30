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

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _textFieldController = TextEditingController();
  String _savedText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Save or load Text'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _textFieldController,
              decoration: const InputDecoration(labelText: 'Text'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                SharedPreferences.getInstance().then((prefs) {
                  prefs.setString('savedText', _textFieldController.text);
                });
              },
              child: const Text('Save'),
            ),
            ElevatedButton(
              onPressed: () {
                SharedPreferences.getInstance().then((prefs) {
                  setState(() {
                    _savedText =
                        prefs.getString('savedText') ?? 'There is no text';
                  });
                });
              },
              child: const Text('Load'),
            ),
            const SizedBox(height: 16.0),
            Text('Saved Textitext: $_savedText'),
          ],
        ),
      ),
    );
  }
}
