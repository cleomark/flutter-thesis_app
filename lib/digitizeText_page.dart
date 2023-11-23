import 'package:flutter/material.dart';
import 'comparison_page.dart';

class DigitizeTextPage extends StatefulWidget {
  const DigitizeTextPage({super.key});

  @override
  State<DigitizeTextPage> createState() => _DigitizeTextPageState();
}

class _DigitizeTextPageState extends State<DigitizeTextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Generated Text'),
        centerTitle: true,
        backgroundColor: const Color(0xff432818),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        // margin: new EdgeInsets.symmetric(vertical: 35.0),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 241, 241, 241),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 35.0,
              left: 35.0,
              right: 35.0,
              child: Container(
                width: 0, // Set the width as per your requirements
                height: 560, // Set the height as per your requirements
                decoration: BoxDecoration(
                  color: Colors.white, // White background
                  border: Border.all(
                    color: const Color(0xff432818), // Brown border color
                    width: 2.0, // Border width
                  ),
                  borderRadius: BorderRadius.circular(10), // Border radius
                ),
              ),
            ),
            Positioned(
              bottom: 40.0,
              left: 0.0,
              right: 0.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(180.0, 60.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      side: BorderSide(
                        color: Colors.white,
                        width: 3.0,
                      ),
                      foregroundColor: const Color(0xff432818),
                      backgroundColor: const Color(0xffffe6a7),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const ComparisonPage(),
                        ),
                      );
                    },
                    child: Text(
                      'COMPARE',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'RobotoMono-Bold',
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(0.0, 40.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                      side: BorderSide(
                        color: Colors.white,
                        width: 3.0,
                      ),
                      foregroundColor: Colors.white,
                      backgroundColor: const Color(0xff432818),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Choose or take a new photo',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'RobotoMono-Bold',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
