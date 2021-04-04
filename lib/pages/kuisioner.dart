import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:mbti_test/Judul.dart';
import 'package:mbti_test/Kalkulasi.dart';
import 'package:mbti_test/ListPertanyaan.dart';
import 'package:mbti_test/dbhelper.dart';
import 'package:mbti_test/models/Partisipan.dart';
import 'package:mbti_test/pages/analisis.dart';

void main() => runApp(Kuisioner());

class Kuisioner extends StatefulWidget {
  final nama;
  const Kuisioner({Key key, this.nama}) : super(key: key);

  @override
  _KuisionerState createState() => _KuisionerState();
}

class _KuisionerState extends State<Kuisioner> {
  List<String> _score = List<String>();
  var kepribadian;
  var hasil = List(4);
  void stateMethod() {
    setState(() {});
  }

  DbHelper dbHelper = DbHelper();
  var analisis;

  Future<void> display() async {
    analisis = '';
    for (int i = 0; i < hasil.length; i++) analisis += hasil[i];

    kepribadian = await dbHelper.cari(analisis);

    var partisipan = Partisipan(widget.nama, kepribadian.tipe);
    await dbHelper.insert(partisipan);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Analisis(kepribadian: kepribadian),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xff252c48),
        appBar: AppBar(
          leading: BackButton(
            color: Colors.white,
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text("Tes MBTI"),
          backgroundColor: Colors.amber,
        ),
        body: ListView(children: [
          Judul(nama: widget.nama),
          ListPertanyaan(score: _score, hasil: hasil, stateMethod: stateMethod),
          Kalkulasi(display: display),
        ]),
      ),
    );
  }
}
