import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  const MyListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: ListTile(
        leading: Icon(
          Icons.place,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        title: Text(
          "Select CityWall Mall",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        subtitle: Text(
          'Skaet District Center, District Center, Sector 6  Pushp Vihar New Helhi Delhi 110017',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    );
  }
}
