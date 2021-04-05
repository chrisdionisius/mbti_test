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
  //variable untuk mengelompokkan radio button berdasarkan pertanyaan
  List<String> _score = List<String>();
  //var untuk menampung object dari hasil analisis kepribadian
  var kepribadian;
  //var untuk menampung tipe sub-kepribadian berdasarkan input sementara
  var hasil = List(4);
  //method untuk melakukan  set state / refresh
  void stateMethod() {
    setState(() {});
  }

  //instansiasi obj dbHelper
  DbHelper dbHelper = DbHelper();

  var analisis;

  Future<void> display() async {
    analisis = '';
    //iterasi untuk menginputkan sub-kepribadian menjadi suatu jenis kepribadian
    for (int i = 0; i < hasil.length; i++) analisis += hasil[i];
    //melalukan select untuk mencari tipe kepribadian yang sesuai pada table di db
    kepribadian = await dbHelper.cari(analisis);
    //instansiasi object partisipan berdasar tipe kepribadian dan nama user
    var partisipan = Partisipan(widget.nama, kepribadian.tipe);
    //proses input data menuju database
    await dbHelper.insert(partisipan);

    Navigator.push(
      context,
      MaterialPageRoute(
        //menuju laman analisis untuk membaca keterangan kepribadian
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
