import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class MyHomepage extends StatefulWidget {
  const MyHomepage({Key? key}) : super(key: key);
  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  final GlobalKey _key = GlobalKey();
  void _CaptureScreenShot() async {
    //get paint bound of your app screen or the widget which is wrapped with RepaintBoundary.
    RenderRepaintBoundary bound =
        _key.currentContext!.findRenderObject() as RenderRepaintBoundary;
    if (bound.debugNeedsPaint) {
      Timer(Duration(seconds: 1), () => _CaptureScreenShot());
      return null;
    }
    ui.Image image = await bound.toImage();
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    // this will save image screenshot in gallery
    if (byteData != null) {
      Uint8List pngBytes = byteData.buffer.asUint8List();
      final resultsave = await ImageGallerySaver.saveImage(
          Uint8List.fromList(pngBytes),
          quality: 90,
          name: 'screenshot-${DateTime.now()}.png');
      print(resultsave);
    }
  }

  @override
  Widget build(BuildContext context) {
    //Here i have wrapped whole app screen scaffold widget, to take full screenshot
    return RepaintBoundary(
      key: _key,
      child: Scaffold(
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.blue,
              width: 220,
              height: 220,
            ),
            SizedBox(
              height: 25,
            ),
            ElevatedButton(
                onPressed: () {
                  _CaptureScreenShot(); // Method called to take screenshot on wrapped widget and save it.
                },
                child: Text("Capture & Save"))
          ],
        )),
      ),
    );
  }
}
