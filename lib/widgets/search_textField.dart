import 'package:flutter/material.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({super.key});

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 211, 209, 209),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                border: InputBorder.none,
                hintText: 'Where to?',
                hintStyle: TextStyle(fontSize: 22),
              ),
            ),
          ),
          Container(
            width: 105,
            height: 39,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Colors.white,
            ),
            margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.access_time_filled_rounded,
                ),
                Text('Now'),
                Icon(Icons.arrow_drop_down_rounded)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
