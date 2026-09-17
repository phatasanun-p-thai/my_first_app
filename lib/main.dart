import 'package:flutter/material.dart';

import 'resume_page.dart';
import 'theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Resume',
      debugShowCheckedModeBanner: false,
      theme: buildAppTheme(),
      home: const ResumePage(),
    );
  }
}