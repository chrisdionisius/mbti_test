import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'kuisioner.dart';

class InputNama extends StatelessWidget {
  final namaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xff252c48),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              child: Text(
                'Sebelum lanjut, masukin nama kamu dulu',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.65,
              child: TextField(
                controller: namaController,
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.65,
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
                      builder: (context) => Kuisioner(
                        nama: namaController.text,
                      ),
                    ),
                  );
                },
                child: Text('Mulai'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
