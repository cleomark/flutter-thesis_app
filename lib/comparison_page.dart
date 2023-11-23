import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:provider/provider.dart';
import 'image_provider.dart' as CustomImageProvider;

class ComparisonPage extends StatefulWidget {
  const ComparisonPage({super.key});

  @override
  State<ComparisonPage> createState() => _ComparisonPageState();
}

class _ComparisonPageState extends State<ComparisonPage> {
  @override
  Widget build(BuildContext context) {
    final imageProvider =
        Provider.of<CustomImageProvider.ImageProvider>(context);
    final Uint8List? croppedImage = imageProvider.croppedImage;
    return Scaffold(
      appBar: AppBar(
        title: Text('Image vs Text'),
        centerTitle: true,
        backgroundColor: const Color(0xff432818),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        margin: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              constraints: BoxConstraints(
                minWidth: 0,
                maxWidth: 350,
              ),
              height: 285,
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.grey,
                border: Border.all(
                  color: Colors.black,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: croppedImage != null
                  ? Image.memory(croppedImage)
                  : Center(child: Text('No image to show')),
            ),
            Container(
              width: 350,
              height: 285,
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: const Color(0xff432818),
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  'Translated Text Placeholder',
                  style: TextStyle(color: Colors.black54),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
