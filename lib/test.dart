import 'package:flutter/material.dart';

class MyTable extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {'name': 'Product 1', 'number': 1, 'points': 100, 'price': '\$10'},
    {'name': 'Product 2', 'number': 2, 'points': 50, 'price': '\$5'},
    {'name': 'Product 3', 'number': 3, 'points': 200, 'price': '\$20'},
  ];

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: <DataColumn>[
        DataColumn(label: Text('Name')),
        DataColumn(label: Text('Number')),
        DataColumn(label: Text('Points')),
        DataColumn(label: Text('Price')),
      ],
      rows: List<DataRow>.generate(
        products.length,
        (index) => DataRow(
          cells: <DataCell>[
            DataCell(Text(products[index]['name'])),
            DataCell(Text(products[index]['number'].toString())),
            DataCell(Text(products[index]['points'].toString())),
            DataCell(Text(products[index]['price'])),
          ],
        ),
      ),
    );
  }
}
