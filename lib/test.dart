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
// import 'package:flutter/material.dart';

// Scaffold(
//       appBar: AppBar(title: const Text('KindaCode.com')),
//       body: Center(
//         // add an elevation
//         child: Material(
//           elevation: 6,
//           // Size the button
//           child: SizedBox(
//             width: 300,
//             height: 200,
//             // Inkwell
//             child: InkWell(
//               radius: 100,
//               // display a snackbar on tap
//               onTap: () {
//                 ScaffoldMessenger.of(context).clearSnackBars();
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(
//                     content: Text('Hello There!'),
//                     duration: Duration(milliseconds: 1500),
//                   ),
//                 );
//               },
//               // implement the image with Ink.image
//               child: Ink.image(
//                 fit: BoxFit.cover,
//                 image: const NetworkImage(
//                     'https://www.kindacode.com/wp-content/uploads/2022/07/bottle.jpeg'),
//               ),
//             ),
//           ),
//         ),
//       ),
// );