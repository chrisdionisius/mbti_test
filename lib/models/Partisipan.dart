class Partisipan {
  int _id;
  String _nama, _kepribadian;

  int get id => this._id;

  String get nama => this._nama;
  set nama(String value) => this._nama = value;

  String get kepribadian => this._kepribadian;
  set kepribadian(String value) => this._kepribadian = value;

  Partisipan(this._nama, this._kepribadian);

  Partisipan.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._nama = map['nama'];
    this._kepribadian = map['kepribadian'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['nama'] = nama;
    map['kepribadian'] = kepribadian;
    return map;
  }
}
