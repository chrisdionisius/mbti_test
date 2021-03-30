import 'package:mbti_test/pages/kuisioner.dart';
import 'package:mbti_test/pages/analisis.dart';
import 'package:mbti_test/pages/home.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/kuisioner': (context) => Kuisioner(),
        '/analisis': (context) => Analisis(),
      },
    );
  }
}
