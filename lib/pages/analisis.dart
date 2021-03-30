import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mbti_test/models/Kepribadian.dart';

class Analisis extends StatelessWidget {
  final Kepribadian kepribadian;
  const Analisis({Key key, this.kepribadian}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: Colors.white,
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text("Tes MBTI"),
          backgroundColor: Colors.amber,
        ),
        backgroundColor: const Color(0xff252c48),
        body: Column(
          children: [
            Text(
              kepribadian.tipe,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Text(
              kepribadian.nama,
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: Image.network(kepribadian.gambar),
            ),
            Text(kepribadian.deskripsi,
                style: TextStyle(
                  color: Colors.white,
                )),
            Divider(),
            Text(
              'Profesi : ' + kepribadian.profesi,
              style:
                  TextStyle(fontStyle: FontStyle.italic, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
