import 'package:flutter/material.dart';

class Judul extends StatelessWidget {
  final nama;
  const Judul({
    Key key,
    this.nama,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(5),
      child: Text(
        'Halo ' + nama,
        style: TextStyle(fontSize: 20, color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  }
}
