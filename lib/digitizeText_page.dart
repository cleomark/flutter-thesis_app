import 'package:flutter/material.dart';
import 'comparison_page.dart';

class DigitizeTextPage extends StatefulWidget {
  const DigitizeTextPage({Key? key}) : super(key: key);

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
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 241, 241, 241),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 20.0,
              left: 20.0,
              right: 20.0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.7,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: const Color(0xff432818),
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "Converted Text from the Model...",
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.123,
              left: 0,
              right: 0,
              child: FractionallySizedBox(
                widthFactor: 0.5,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const ComparisonPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(0.0, 60.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    side: const BorderSide(
                      color: Colors.white,
                      width: 3.0,
                    ),
                    foregroundColor: const Color(0xff432818),
                    backgroundColor: const Color(0xffffe6a7),
                  ),
                  child: const Text(
                    'COMPARE',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'RobotoMono-Bold',
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.04,
              left: 130.0,
              right: 130.0,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: TextButton.styleFrom(
                  minimumSize: const Size(0.0, 40.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7.0),
                  ),
                  side: BorderSide(
                    color: Colors.white,
                    width: 3.0,
                  ),
                  foregroundColor: Colors.white,
                  backgroundColor: Color(0xff432818),
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                ),
                child: Text(
                  'Choose or take a new photo',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'RobotoMono-Bold',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
