import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class CRUDScreen extends StatefulWidget {
  const CRUDScreen({super.key});

  @override
  State<CRUDScreen> createState() => _CRUDScreenState();
}

class _CRUDScreenState extends State<CRUDScreen> {
  // Key um auf den Speicher zuzugreifen
  String key = 'key1';

  //Der Auf dem App Screen zu sehende Speicher
  String storedData = 'Simon';
  @override
  // Das solltet ihr alle drauf haben ;)
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Beim drücken auf den Button wir die jeweilige Funktion aufgerufen
            ElevatedButton(onPressed: createData, child: Text("Create")),
            ElevatedButton(onPressed: readData, child: Text("Read")),
            ElevatedButton(onPressed: updateData, child: Text("Update")),
            ElevatedButton(onPressed: deleteData, child: Text("Delete")),
            Text("der Name im Speicher lautet: $storedData"),
          ],
        ),
      ),
    );
  }

  Future<void> createData() async {
    // Wir holen uns die Instanz
    final preferences = await SharedPreferences.getInstance();
    // Wir bearbeiten die Instanz
    await preferences.setString('key1', 'IrgendeinString');
    print("create");
    readData();
  }

  Future<void> readData() async {
    // Wir holen uns die Instanz
    final preferences = await SharedPreferences.getInstance();

    // Wir holen uns die Daten aus der Instanz
    setState(() {
      String? data = preferences.getString('key1');

      // Abfrage ob String == null
      if (data == null) {
        storedData = "no data";
      } else {
        storedData = data;
      }
    });
  }

  void updateData() async {
    print("update");
    // Wir holen uns die Instanz
    final preferences = await SharedPreferences.getInstance();
    // Wir bearbeiten die Instanz
    await preferences.setString('key1', 'Daten Aktualisiert');
    readData();
  }

  void deleteData() async {
    // Wir holen uns die Instanz
    final preferences = await SharedPreferences.getInstance();
    // Wir bearbeiten die Instanz
    preferences.remove(key);
    print("deleted");
    readData();
  }
}
