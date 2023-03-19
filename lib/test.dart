// import 'package:flutter/material.dart';
// import 'package:flutter_screenshot/flutter_screenshot.dart';

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Screenshot Example'),
//       ),
//       body: Center(
//         child: RaisedButton(
//           onPressed: () async {
//             // Take the screenshot and get the image file
//             var imageFile = await ScreenshotController().capture();

//             // Save the image file to the device's gallery
//             await ImageGallerySaver.saveFile(imageFile.path);

//             // Show a snackbar with the result
//             Scaffold.of(context).showSnackBar(
//               SnackBar(
//                 content: Text('Screenshot saved to gallery'),
//               ),
//             );
//           },
//           child: Text('Take Screenshot'),
//         ),
//       ),
//     );
//   }
// }



