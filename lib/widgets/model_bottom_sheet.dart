import 'package:flutter/material.dart';

class ModelBottomSheet extends StatefulWidget {
  const ModelBottomSheet({super.key});

  @override
  State<ModelBottomSheet> createState() => _ModelBottomSheetState();
}

class _ModelBottomSheetState extends State<ModelBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plan your trip'),
      ),
      body: Column(
        children: [
          Row(children: [DropdownButtonFormField(items: const [
            DropdownMenuItem(value: 1, child: Text('1')),
            DropdownMenuItem(value: 2, child: Text('2')),
            DropdownMenuItem(value: 3, child: Text('3')),
            DropdownMenuItem(value: 4, child: Text('4')),
            DropdownMenuItem(value: 5, child: Text('5')),
            DropdownMenuItem(value: 6, child: Text('6')),
            DropdownMenuItem(value: 7, child: Text('7')),
            DropdownMenuItem(value: 8, child: Text('8')),
            DropdownMenuItem(value: 9, child: Text('9')),
            DropdownMenuItem(value: 10, child: Text('10')),
            DropdownMenuItem(value: 11, child: Text('11')),
            DropdownMenuItem(value: 12, child: Text('12')),
          ], onChanged: (value){})],),
        ],
      ),
    );
  }
}
