//import dart
import 'package:mbti_test/pages/kuisioner.dart';
import 'package:mbti_test/pages/analisis.dart';
import 'package:mbti_test/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:mbti_test/pages/listKepribadian.dart';
import 'package:mbti_test/pages/rekap.dart';

//main method
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //routing
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/kuisioner': (context) => Kuisioner(),
        '/analisis': (context) => Analisis(),
        '/listKepribadian': (context) => ListKepribadian(),
        '/rekap': (context) => Rekap(),
      },
    );
  }
}
