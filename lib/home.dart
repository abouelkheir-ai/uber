import 'package:flutter/material.dart';
import 'package:uber/widgets/search_textField.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String dropdownValue = 'Now'; // Initialize the selected value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            SearchTextField(),
            ListView.builder(
              itemCount: 2,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    leading: Icon(Icons.timer),
                    title: Text("Select CityWall Mall"),
                    subtitle: Text(
                      'Skaet District Center, District Center, Sector 6  Pushp Vihar New Helhi Delhi 110017',
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
