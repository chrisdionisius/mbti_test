import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mbti_test/dbhelper.dart';
import 'package:mbti_test/models/Partisipan.dart';
import 'package:sqflite/sqflite.dart';

class Rekap extends StatefulWidget {
  @override
  _RekapState createState() => _RekapState();
}

class _RekapState extends State<Rekap> {
  int count = 0;
  List<Partisipan> partisipanList;
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
                child: Icon(Icons.topic_outlined)),
            title: Text(
              this.partisipanList[index].nama,
            ),
            subtitle: Text(this.partisipanList[index].kepribadian.toString()),
            trailing: GestureDetector(
              child: Icon(Icons.delete),
              onTap: () async {
                int result =
                    await dbHelper.delete(this.partisipanList[index].id);
                if (result > 0) updateListView();
              },
            ),
            onTap: null,
          ),
        );
      },
    );
  }

  void updateListView() {
    final Future<Database> dbFuture = dbHelper.initDb();
    dbFuture.then((database) {
      Future<List<Partisipan>> partisipanListFuture = dbHelper.getItemList();
      partisipanListFuture.then((partisipanList) {
        setState(() {
          this.partisipanList = partisipanList;
          this.count = partisipanList.length;
        });
      });
    });
  }
}
