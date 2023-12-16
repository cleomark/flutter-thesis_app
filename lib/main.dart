import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thesis_app/image_provider.dart' as CustomImageProvider;
import 'landing_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CustomImageProvider.ImageProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'RobotoMono-Regular',
        primaryColor: const Color(0xff432818),
      ),
      home: const LandingPage(),
    );
  }
}
