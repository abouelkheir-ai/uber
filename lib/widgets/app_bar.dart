import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      iconTheme: IconThemeData(color: Theme.of(context).colorScheme.primary),
    );
  }
}
