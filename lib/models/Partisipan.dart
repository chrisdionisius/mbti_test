class Partisipan {
  // deklarasi attr model
  int _id;
  String _nama, _kepribadian;

  // set setter getter attribute
  int get id => this._id;

  String get nama => this._nama;
  set nama(String value) => this._nama = value;

  String get kepribadian => this._kepribadian;
  set kepribadian(String value) => this._kepribadian = value;

  //konstruktor pengisian value attribute model
  Partisipan(this._nama, this._kepribadian);

  //konstruktor pengisian value lewat map
  Partisipan.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._nama = map['nama'];
    this._kepribadian = map['kepribadian'];
  }

  //konstruktor pengisian value lewat string sql
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['nama'] = nama;
    map['kepribadian'] = kepribadian;
    return map;
  }
}
