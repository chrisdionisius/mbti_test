class Kepribadian {
  // deklarasi attr model
  String _tipe, _nama, _deskripsi, _profesi, _gambar;
  int _id;

  // set setter getter attribute
  int get id => this._id;

  String get tipe => this._tipe;
  set tipe(String value) => this._tipe = value;

  String get nama => this._nama;
  set nama(String value) => this._nama = value;

  String get deskripsi => this._deskripsi;
  set deskripsi(String value) => this._deskripsi = value;

  String get profesi => this._profesi;
  set profesi(String value) => this._profesi = value;

  String get gambar => this._gambar;
  set gambar(String value) => this._gambar = value;

  //konstruktor pengisian value attribute moddel
  Kepribadian(
      this._tipe, this._nama, this._deskripsi, this._profesi, this._gambar);

  //konstruktor pengisian value lewat map
  Kepribadian.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._tipe = map['tipe'];
    this._nama = map['nama'];
    this._deskripsi = map['deskripsi'];
    this._profesi = map['profesi'];
    this._gambar = map['gambar'];
  }
  //konstruktor pengisian value lewat string sql
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['tipe'] = tipe;
    map['nama'] = nama;
    map['deskripsi'] = deskripsi;
    map['profesi'] = profesi;
    map['gambar'] = gambar;
    return map;
  }
}
