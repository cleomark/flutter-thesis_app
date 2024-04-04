import 'package:flutter/material.dart';

class HowItWorksPage extends StatelessWidget {
  const HowItWorksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          'How it Works',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'RobotoMono',
          ),
        ),
        backgroundColor: const Color(0xff432818),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Overview',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'Our app converts handwritten sentence images into digital text. It works by utilizing advanced machine learning algorithms to recognize the text from the images you provide.',
            ),
            const SizedBox(height: 16),
            const Text(
              'Key Steps',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'There are a few key steps involved in using our app:',
            ),
            const SizedBox(height: 8),
            ListTile(
              title: const Text('Step 1: Capture Image'),
              subtitle: const Text(
                  'Take a clear picture of the handwritten sentence you want to convert.'),
            ),
            ListTile(
              title: const Text('Step 2: Select Language'),
              subtitle: const Text(
                  'Choose the language of the handwritten text for accurate conversion.'),
            ),
            ListTile(
              title: const Text('Step 3: Convert to Text'),
              subtitle: const Text(
                  'Tap the "Convert" button to process the image and obtain the digital text.'),
            ),
          ],
        ),
      ),
    );
  }
}
