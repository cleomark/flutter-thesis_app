import 'package:flutter/material.dart';

class HowItWorksPage extends StatelessWidget {
  const HowItWorksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('How it Works'),
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
              'Our product or service is designed to help you [achieve a specific goal]. It works by [briefly describe the process].',
            ),
            const SizedBox(height: 16),
            const Text(
              'Key Steps',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'There are a few key steps involved in using our product or service:',
            ),
            const SizedBox(height: 8),
            ListTile(
              title: const Text('Step 1'),
              subtitle: const Text('[Briefly describe Step 1]'),
            ),
            ListTile(
              title: const Text('Step 2'),
              subtitle: const Text('[Briefly describe Step 2]'),
            ),
            ListTile(
              title: const Text('Step 3'),
              subtitle: const Text('[Briefly describe Step 3]'),
            ),
          ],
        ),
      ),
    );
  }
}
