import 'package:flutter/material.dart';
import 'package:rive_demo/presentation/screens/test_screen.dart';

class AppMain extends StatelessWidget {
  const AppMain({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TestScreen(),
    );
  }
}
