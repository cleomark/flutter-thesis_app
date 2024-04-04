import 'package:flutter/material.dart';
import 'comparison_page.dart';

class DigitizeTextPage extends StatefulWidget {
  const DigitizeTextPage({Key? key}) : super(key: key);

  @override
  State<DigitizeTextPage> createState() => _DigitizeTextPageState();
}

class _DigitizeTextPageState extends State<DigitizeTextPage> {
  static const Color primaryColor = Color(0xff432818);
  static const Color secondaryColor = Color(0xffffe6a7);
  static const Color borderColor = Color(0xff432818);
  static const Color backgroundColor = Color.fromARGB(255, 241, 241, 241);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generated Text'),
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: backgroundColor,
        ),
        child: Stack(
          children: [
            _buildTextContainerWithCompareButton(context),
            _buildBottomTextButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTextContainerWithCompareButton(BuildContext context) {
    return Positioned(
      top: 20.0,
      left: 20.0,
      right: 20.0,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.7,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: borderColor, width: 2.0),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text("Converted Text from the Model..."),
            ),
            Positioned(
              bottom: -30,
              left: 50,
              right: 50,
              child: Center(
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
                    minimumSize:
                        const Size(double.infinity, 60.0), // Full width
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    side: const BorderSide(color: Colors.white, width: 3.0),
                    foregroundColor: primaryColor,
                    backgroundColor: secondaryColor,
                  ),
                  child: const Text(
                    'COMPARE',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'RobotoMono-Bold',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  // Widget _buildTextContainer(BuildContext context) {
  //   return Positioned(
  //     top: 20.0,
  //     left: 20.0,
  //     right: 20.0,
  //     child: Container(
  //       height: MediaQuery.of(context).size.height * 0.7,
  //       decoration: BoxDecoration(
  //         color: Colors.white,
  //         border: Border.all(color: borderColor, width: 2.0),
  //         borderRadius: BorderRadius.circular(10),
  //       ),
  //       child: const Padding(
  //         padding: EdgeInsets.all(16.0),
  //         child: Text("Converted Text from the Model..."),
  //       ),
  //     ),
  //   );
  // }

  // Widget _buildCompareButton(BuildContext context) {
  //   return Positioned(
  //     bottom: MediaQuery.of(context).size.height * 0.125,
  //     left: 20.0,
  //     right: 20.0,
  //     child: FractionallySizedBox(
  //       widthFactor: 0.5,
  //       child: ElevatedButton(
  //         onPressed: () {
  //           Navigator.of(context).push(
  //             MaterialPageRoute(
  //               builder: (BuildContext context) => const ComparisonPage(),
  //             ),
  //           );
  //         },
  //         style: ElevatedButton.styleFrom(
  //           minimumSize: const Size(double.infinity, 60.0), // Full width
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(30.0),
  //           ),
  //           side: const BorderSide(color: Colors.white, width: 3.0),
  //           foregroundColor: primaryColor,
  //           backgroundColor: secondaryColor,
  //         ),
  //         child: const Text(
  //           'COMPARE',
  //           style: TextStyle(
  //             fontSize: 20,
  //             fontWeight: FontWeight.w600,
  //             fontFamily: 'RobotoMono-Bold',
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget _buildBottomTextButton(BuildContext context) {
    return Positioned(
      bottom: MediaQuery.of(context).size.height * 0.04,
      left: 110.0,
      right: 110.0,
      child: TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        style: TextButton.styleFrom(
          minimumSize: const Size(double.infinity, 40.0), // Full width
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7.0),
          ),
          side: const BorderSide(color: Colors.white, width: 3.0),
          foregroundColor: Colors.white,
          backgroundColor: primaryColor,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
        ),
        child: const Text(
          'Choose or take a new photo',
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            fontFamily: 'RobotoMono-Bold',
          ),
        ),
      ),
    );
  }
}
