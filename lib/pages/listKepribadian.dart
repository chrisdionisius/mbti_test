import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mbti_test/dbhelper.dart';
import 'package:mbti_test/models/Kepribadian.dart';
import 'package:sqflite/sqflite.dart';

class ListKepribadian extends StatefulWidget {
  @override
  _ListKepribadianState createState() => _ListKepribadianState();
}

class _ListKepribadianState extends State<ListKepribadian> {
  int count = 0;
  List<Kepribadian> kepribadianList;
  DbHelper dbHelper = DbHelper();
  @override
  Widget build(BuildContext context) {
    updateListView();
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
        body: Column(
          children: [Expanded(child: createListView())],
        ),
      ),
    );
  }

  ListView createListView() {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: const Color(0xff252c48),
              child: Image.network(kepribadianList[index].gambar),
            ),
            title: Text(
              this.kepribadianList[index].tipe,
            ),
            subtitle: Text(this.kepribadianList[index].nama.toString()),
            trailing: null,
            onTap: null,
          ),
        );
      },
    );
  }

  void updateListView() {
    final Future<Database> dbFuture = dbHelper.initDb();
    dbFuture.then((database) {
      Future<List<Kepribadian>> kepribadianListFuture =
          dbHelper.getKepribadianList();
      kepribadianListFuture.then((kepribadianList) {
        setState(() {
          this.kepribadianList = kepribadianList;
          this.count = kepribadianList.length;
        });
      });
    });
  }
}
