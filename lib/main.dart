import 'package:flutter/material.dart';
import 'main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Young Mosque',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: PrayerTimesPage(),
    );
  }
}
