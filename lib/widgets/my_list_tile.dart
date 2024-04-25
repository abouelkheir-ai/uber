import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  const MyListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 254, 250, 250),
      child: ListTile(
        leading: Icon(Icons.timer),
        title: Text("Select CityWall Mall"),
        subtitle: Text(
          'Skaet District Center, District Center, Sector 6  Pushp Vihar New Helhi Delhi 110017',
        ),
      ),
    );
  }
}
