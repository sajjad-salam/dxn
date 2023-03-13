import 'package:flutter/material.dart';

class MyPopup extends StatefulWidget {
  @override
  _MyPopupState createState() => _MyPopupState();
}

class _MyPopupState extends State<MyPopup> {
  final _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text('اضافة'),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Enter Text'),
                content: TextField(
                  controller: _textEditingController,
                  decoration: InputDecoration(hintText: 'Enter text here'),
                ),
                actions: <Widget>[
                  TextButton(
                    child: Text('CANCEL'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop({
                        'text': _textEditingController.text,
                      });
                    },
                  ),
                ],
              );
            },
          ).then(
            (value) {
              if (value != null) {
                // Do something with the entered text and elements
                print(value['text']);
                print(value['elements']);
              }
            },
          );
        },
      ),
    );
  }
}
