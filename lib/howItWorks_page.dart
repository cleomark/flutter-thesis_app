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
              'Our app converts handwritten sentence images into digital text. It works by utilizing advanced machine learning algorithms to recognize the text from the images you provide. We employ a combination of ResNet architecture for image feature extraction and Conv1D layers for text recognition to achieve high accuracy and robustness.',
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
              title: const Text('Step 1: Capture or Upload Image'),
              subtitle: const Text(
                  'Take a clear picture of the handwritten sentence you want to convert or upload an image from your device.'),
            ),
            ListTile(
              title: const Text('Step 2: Convert Image to Text'),
              subtitle: const Text(
                  'Process the captured/uploaded image to extract text using machine learning algorithms.'),
            ),
            ListTile(
              title: const Text('Step 3: Compare Image with Text'),
              subtitle: const Text(
                  'Compare the original image with the extracted text to ensure accuracy.'),
            ),
            ListTile(
              title: const Text('Step 4: Copy Converted Text'),
              subtitle: const Text(
                  'If the extracted text matches the content of the image, copy the text for further use.'),
            ),
          ],
        ),
      ),
    );
  }
}
