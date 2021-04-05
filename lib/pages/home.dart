import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mbti_test/pages/listKepribadian.dart';
import 'package:mbti_test/pages/rekap.dart';
import 'inputnama.dart';

class Home extends StatelessWidget {
  void mulaiKuis() {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xff252c48),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(30),
              child: Text(
                'MBTI Test',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            //button untuk memulai test
            Container(
              margin: EdgeInsets.only(top: 10),
              child: SizedBox(
                width: 300,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.amber,
                    padding: EdgeInsets.symmetric(vertical: 15),
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(15.0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        //menujy page InputNama
                        builder: (context) => InputNama(),
                      ),
                    );
                  },
                  child: Text(
                    'Mulai',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            Divider(),
            //button untuk melihat daftar kepribadian
            Container(
              child: SizedBox(
                width: 300,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.amber,
                    padding: EdgeInsets.symmetric(vertical: 15),
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(15.0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        //menuju page ListKepribadian
                        builder: (context) => ListKepribadian(),
                      ),
                    );
                  },
                  child: Text(
                    'List Kepribadian',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            Divider(),
            Divider(),
            Divider(),
            //button untuk melihat daftar inputan
            Container(
              child: SizedBox(
                width: 150,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.amber,
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(15.0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        //menuju page rekap
                        builder: (context) => Rekap(),
                      ),
                    );
                  },
                  child: Text(
                    'Lihat Data',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
