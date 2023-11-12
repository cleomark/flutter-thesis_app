import 'package:flutter/material.dart';

class ComparisonPage extends StatefulWidget {
  const ComparisonPage({super.key});

  @override
  State<ComparisonPage> createState() => _ComparisonPageState();
}

class _ComparisonPageState extends State<ComparisonPage> {
  @override
  Widget build(BuildContext context) {
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
              width: 350, // Set the width as per your requirements
              height: 285, // Set the height as per your requirements
              decoration: BoxDecoration(
                color: Colors.white, // White background
                border: Border.all(
                  color: const Color(0xff432818), // Brown border color
                  width: 2.0, // Border width
                ),
                borderRadius: BorderRadius.circular(10), // Border radius
              ),
            ),
            Container(
              width: 350, // Set the width as per your requirements
              height: 285, // Set the height as per your requirements
              decoration: BoxDecoration(
                color: Colors.white, // White background
                border: Border.all(
                  color: const Color(0xff432818), // Brown border color
                  width: 2.0, // Border width
                ),
                borderRadius: BorderRadius.circular(10), // Border radius
              ),
            ),
          ],
        ),
      ),
    );
  }
}
