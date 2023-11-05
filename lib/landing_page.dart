import 'package:flutter/material.dart';
import 'upload_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/background.jpg"),
              fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 150,
              height: 40,
              margin: const EdgeInsets.only(top: 25.0),
              decoration: BoxDecoration(
                color: Colors.yellow.shade100,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: const Center(
                child: Text(
                  'WELCOME!',
                  style: TextStyle(
                    fontSize: 24, // Text size
                    color: Color.fromARGB(255, 75, 47, 35), // Text color
                    fontWeight: FontWeight.bold,
                    fontFamily: 'RobotoMono-Bold', // Text style
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 180.0, // Adjust the size as needed
              height: 180.0, // Adjust the size as needed
              // decoration: BoxDecoration(
              //   shape: BoxShape.circle,
              //   border: Border.all(
              //     color:
              //         const Color.fromARGB(255, 56, 35, 25), // Add border color
              //     width: 5.0, // Add border width
              //   ),
              // ),
              child: ClipOval(
                child: Image.asset(
                  'assets/images/app-logo.png', // Replace with your image URL
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 215.0,
              height: 165.0,
              // decoration: BoxDecoration(
              //   border: Border.all(
              //     color: Colors.black, // Border color
              //     width: 2.0, // Border width
              //   ),
              // ),
              child: Center(
                child: Text(
                  "Welcome to our free OCR application! Transform handwritten text from images into a digital format effortlessly. Edit, format, and manage your text with precision. Let's get started on this efficient journey!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromRGBO(255, 249, 196, 0.767),
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'StyleScript',
                  ),
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(110.0, 35.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        30.0), // Adjust the radius as needed
                  ),
                  side: BorderSide(
                    color: Colors.yellow.shade100, // Border color
                    width: 2.0, // Border width
                  ),
                  foregroundColor: Colors.white,
                  backgroundColor: const Color.fromARGB(255, 59, 32, 27)),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => const UploadPage(),
                  ),
                );
              },
              child: const Text(
                "Let's go!",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
