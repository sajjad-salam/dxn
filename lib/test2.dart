import 'package:flutter/material.dart';

class MyPopup2 extends StatefulWidget {
  final String prod;

  MyPopup2({super.key, required this.prod});

  @override
  _MyPopupState createState() => _MyPopupState();
}

List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class _MyPopupState extends State<MyPopup2> {
  late final String prod;
  final _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: prod,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        try {
          prod = value!;
        } catch (e) {
          print(e);
        }
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
