import 'package:e_commerce/utilities/router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: onGenerate,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xffE5E5E5),
        primaryColor: Color(0xffDB3022),
      ),
    );
  }
}

