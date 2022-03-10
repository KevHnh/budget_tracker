import 'package:flutter/material.dart';
import 'form_panel.dart';
import 'card_panel.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: FormScreen(),
        ),
      ),
    );
  }
}
