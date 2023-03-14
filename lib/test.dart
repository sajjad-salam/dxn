import 'package:flutter/material.dart';

class MyDropdownList extends StatefulWidget {
  @override
  _MyDropdownListState createState() => _MyDropdownListState();
}

class _MyDropdownListState extends State<MyDropdownList> {
  String _selectedItem = 'Option 1';
  List<String> _items = [
    'Option 1',
    'Option 2',
    'Option 3',
    'Option 4',
    'Option 5'
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: _selectedItem,
      items: _items.map((String value) {
        return DropdownMenuItem(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          _selectedItem = newValue!;
        });
      },
    );
  }
}
