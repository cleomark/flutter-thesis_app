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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'RobotoMono-Regular',
        primaryColor: const Color(0xff432818),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff432818),
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(color: Colors.white),
        ),
      ),
      home: const LandingPage(),
    );
  }
}
