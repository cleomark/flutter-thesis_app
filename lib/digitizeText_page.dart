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
        margin: new EdgeInsets.symmetric(vertical: 35.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 330, // Set the width as per your requirements
              height: 550, // Set the height as per your requirements
              decoration: BoxDecoration(
                color: Colors.white, // White background
                border: Border.all(
                  color: const Color(0xff432818), // Brown border color
                  width: 2.0, // Border width
                ),
                borderRadius: BorderRadius.circular(10), // Border radius
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 0, 0, 0)
                        .withOpacity(0.2), // Shadow color
                    spreadRadius: 0, // Spread radius (set to 0)
                    blurRadius: 30, // Blur radius
                    offset: Offset(10.0, 10.0), // Offset (adjust as needed)
                  ),
                ],
              ),
              child: ElevatedButton(
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
                      fontSize: 18, // Text size
                      color: const Color(0xff432818), // Text color
                      fontWeight: FontWeight.w600,
                      fontFamily: 'RobotoMono-Bold', // Text style
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
