import 'package:mbti_test/models/Kepribadian.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'models/Partisipan.dart';

class DbHelper {
  static DbHelper _dbHelper;
  static Database _database;
  DbHelper._createObject();

  Future<Database> initDb() async {
    //untuk menentukan nama database dan lokasi yg dibuat
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'item.db';

    //create, read databases
    var itemDatabase = openDatabase(path, version: 4, onCreate: _createDb);
    //mengembalikan nilai object sebagai hasil dari fungsinya
    return itemDatabase;
  }

  //buat tabel baru dengan nama item
  void _createDb(Database db, int version) async {
    //create table partisipan
    await db.execute('''
      CREATE TABLE partisipan (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nama TEXT,
      kepribadian TEXT
      )
    ''');
    //create table kepribadian
    await db.execute('''
    CREATE TABLE kepribadian (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      tipe TEXT,
      nama TEXT,
      deskripsi TEXT,
      profesi TEXT,
      gambar TEXT)
      ''');
    //pre-populate table kepribadian
    await db.rawInsert(
        '''INSERT INTO kepribadian (tipe,nama,deskripsi,profesi,gambar) VALUES
          (
            "INTJ",
            "Arsitek",
            "Pemikir yang imajinatif dan orisinil. Memiliki motivasi tinggi untuk menjalankan ide-idenya hingga mencapai tujuan. Visioner, mandiri, dan percaya diri, memiliki kemampuan menganalisa yang bagus, skeptis, kritis, logis, dan kadang keras kepala.",
            "Peneliti, Ilmuan, Insinyur, Teknisi, Hakim, Programmer",
            "https://campuspedia.id/news/wp-content/uploads/2020/02/Screenshot_2020-02-09-09-40-49-494_com.android.chrome-300x300.png"
          ),
          (
            "INTP",
            "Ahli Logika",
            "Menghargai intelektualitas dan pengetahuan,lebih suka bekerja sendiri, kritis, skeptis, mudah curiga dan pesimis, tidak suka memimpin, dan memiliki minat yang jelas.",
            "Penulis Buku Teknis, Ahli Forensik, Jaksa, Pengacara, Teknisi",
            "https://campuspedia.id/news/wp-content/uploads/2020/02/Screenshot_2020-02-09-09-41-16-385_com.android.chrome-300x300.png"
          ),
          (
            "ENTJ",
            "Sang Komandan",
            "Pemimpin yang pemberani, imajinatif, dan berambisi kuat. Selalu menemukan cara atau menciptakan cara melakukan sesuatu.",
            "Pebisnis, Pengacara, Hakim, Konsultan, Pemimpin Organisasi",
            "https://campuspedia.id/news/wp-content/uploads/2020/02/Screenshot_2020-02-09-09-32-55-155_com.android.chrome-300x300.png"
          ),
          (
            "ENTP",
            "Si Pendebat",
            "Pemikir yang cerdas dan serius yang gatal terhadap tantangan intelektual. Sanggup memecahkan masalah yang menantang. Banyak bicara, fleksibel, dan kurang konsisten.",
            "Pengacara, Psikolog, Konsultan, Ilmuwan, Aktor, Marketing",
            "https://campuspedia.id/news/wp-content/uploads/2020/02/Screenshot_2020-02-09-09-33-19-943_com.android.chrome-300x300.png"
          ),
          (
            "INFJ",
            "Advokat",
            "Pendiam dan mistis, tetapi idealis yang sangat menginspirasi dan tak kenal lelah. Perhatian, tekun, idealis, visioner. Selalu ingin memahami pola pikir orang lain.",
            "Pengajar, Psikolog, Dokter, Konselor, Pekerja Sosial, Fotografer, Seniman",
            "https://campuspedia.id/news/wp-content/uploads/2020/02/Screenshot_2020-02-09-09-41-42-014_com.android.chrome-300x300.png"
          ),
          (
            "INFP",
            "Mediator",
            "Orang yang puitis, baik hati dan altruisik, selalu ingin membantu aksi kebaikan. Perhatian dan peka, antusias dan setia, idealis dan perfeksionis, setia kepada prinsip yang digenggam.",
            "Penulis, Sastrawan, Konselor, Psikolog, Pengajar, Seniman, Pemuka Agama",
            "https://campuspedia.id/news/wp-content/uploads/2020/02/Screenshot_2020-02-09-09-42-09-996_com.android.chrome-300x300.png"
          ),
          (
            "ENFJ",
            "Sang Protagonis",
            "Pemimpin yang karismatik dan menginspirasi, mampu memukau pendengarnya. Kreatif, peduli apa kata orang lain, pandai bergaul, menyukai tantangan, dan butuh apresiasi.",
            "Konsultan, Psikolog, Pengajar, Marketing, Entertainer, Penulis, Motivator",
            "https://campuspedia.id/news/wp-content/uploads/2020/02/Screenshot_2020-02-09-09-34-13-127_com.android.chrome-300x300.png"
          ),
          (
            "ENFP",
            "Juru Kampanye",
            "Semangat yang antusias, kreatif dan bebas bergaul, yang selalu dapat menemukan alasan untuk tersenyum. Ramah, imajinatif, pandai berkomunikasi, dan bisa membaca kebutuhan orang lain.",
            "Psikolog, Entertainer, Pengajar, Motivator, Presenter, Reporter, MC, Seniman",
            "https://campuspedia.id/news/wp-content/uploads/2020/02/Screenshot_2020-02-09-09-34-38-017_com.android.chrome-300x300.png"
          ),
          (
            "ISTJ",
            "Ahli Logistik",
            "Individu yang praktis dan mengutamakan fakta, yang keandalannya tidak dapat diragukan. Serius, senang pada fakta, tekun, pendengar yang baik, memegang aturan.",
            "Polisi, Hakim, Pengacara, Dokter, Akuntan, Pemimpin Militer",
            "https://campuspedia.id/news/wp-content/uploads/2020/02/Screenshot_2020-02-09-09-42-35-171_com.android.chrome-300x300.png"
          ),
          (
            "ISFJ",
            "Si Pembela",
            "Pelindung yang sangat berdedikasi dan hangat, selalu siap membela orang yang dicintainya. penuh pertimbangan, serius, ramah, memiliki kemampuan mengorganisasi, detil, dan bisa diandalkan.",
            "Desainer, Konselor, Penjaga Toko/Perpustakaan, Dunia Perhotelan.",
            "https://campuspedia.id/news/wp-content/uploads/2020/02/Screenshot_2020-02-09-09-43-06-502_com.android.chrome-300x300.png"
          ),
          (
            "ESTJ",
            "Eksekutif",
            "Administrator istimewa, tidak ada duanya dalam mengelola sesuatu atau orang. Praktis, sistematis, disiplin, dan cenderung kaku.",
            "Militer, Manajer, Polisi, Hakim, Pengacara, Guru, Sales, Auditor, Akuntan",
            "https://campuspedia.id/news/wp-content/uploads/2020/02/Screenshot_2020-02-09-09-35-10-924_com.android.chrome-300x300.png"
          ),
          (
            "ESFJ",
            "Konsul",
            "Orang yang sangat peduli, sosial dan populer, selalu ingin membantu. Hangat, banyak bicara, membutuhkan keseimbangan, santai, sederhana, teliti, dan rajin merawat apa yang dimiliki.",
            "Perencana Keuangan, Perawat, Guru, Bidang anak-anak",
            "https://campuspedia.id/news/wp-content/uploads/2020/02/Screenshot_2020-02-09-09-35-41-247_com.android.chrome-300x300.png"
          ),
          (
            "ISTP",
            "Pengrajin",
            "Experimenter yang pemberani dan praktis, menguasai semua jenis alat. Tenang, cenderung kaku, logis, rasional, kritis, percaya diri, pemecah masalah yang baik.",
            "Polisi, Programmer, Ahli Komputer, Teknisi, Insinyur, Mekanik, Pilot, Atlet",
            "https://campuspedia.id/news/wp-content/uploads/2020/02/Screenshot_2020-02-09-09-43-32-692_com.android.chrome-300x300.png"
          ),
          (
            "ISFP",
            "Petualang",
            "Seniman yang fleksibel dan mengagumkan, selalu siap menjelajahi dan mengalami hal baru. Berpikiran praktis, menghindari konflik, cenderung tidak mau memimpin, santai.",
            "Seniman, Desainer, Pekerja Sosial, Psikolog, Guru, Aktor",
            "https://campuspedia.id/news/wp-content/uploads/2020/02/Screenshot_2020-02-09-09-43-52-621_com.android.chrome-300x300.png"
          ),
          (
          "ESTP",
          "Pengusaha",
          "Orang yang cerdas, bersemangat dan sangat tanggap, benar-benar menikmati hidup yang menantang. Spontan, aktif, enerjik, ceplas-ceplos, berkarisma, mudah beradaptasi.",
          "Marketing, Sales, Polisi, Pebisnis, Pialang Saham",
          "https://campuspedia.id/news/wp-content/uploads/2020/02/Screenshot_2020-02-09-09-36-28-149_com.android.chrome-300x300.png"
          ),
          (
            "ESFP",
            "Penghibur",
            "Orang yang spontan, bersemangat dan antusias, hidup tidak akan membosankan saat berdekatan dengan mereka. Mudah berteman, ramah, menyenangkan, optimis, ceria, suka menjadi pusat perhatian, menghindari konflik, cepat, dan praktis.",
            "Entertainer, Seniman, Marketing, Konselor, Desainer, Tour Guide",
            "https://campuspedia.id/news/wp-content/uploads/2020/02/Screenshot_2020-02-09-09-36-54-404_com.android.chrome-300x300.png"
          )
          ''');
    print('table 2 masuk bos');
  }

  //select table partisipan
  Future<List<Map<String, dynamic>>> select() async {
    Database db = await this.initDb();
    print('tampilin data');
    var mapList = await db.query('partisipan', orderBy: 'nama');
    return mapList;
  }

  //select table kepribadian
  Future<List<Map<String, dynamic>>> selectKepribadian() async {
    Database db = await this.initDb();
    print('tampilin data');
    var mapList = await db.query('kepribadian', orderBy: 'tipe');
    return mapList;
  }

  //insert menuju table partisipan
  Future<int> insert(Partisipan object) async {
    Database db = await this.initDb();
    int count = await db.insert('partisipan', object.toMap());
    print('data dah terinsert');
    return count;
  }

  //insert menuju table kepribadian
  Future<Kepribadian> cari(String tipe) async {
    Database db = await this.initDb();
    Kepribadian kep;
    List<Map> result =
        await db.rawQuery('SELECT * FROM kepribadian WHERE tipe=?', [tipe]);
    kep = Kepribadian.fromMap(result?.first);
    return kep;
  }

  // update table partisipan
  // Future<int> update(Partisipan object) async {
  //   Database db = await this.initDb();
  //   int count = await db.update('partisipan', object.toMap(),
  //       where: 'id=?', whereArgs: [object.id]);
  //   return count;
  // }

  //delete record pada table partisipan
  Future<int> delete(int id) async {
    Database db = await this.initDb();
    int count = await db.delete('partisipan', where: 'id=?', whereArgs: [id]);
    return count;
  }

  //konversi dari bentuk string menuju bentuk map object pada table partisipan
  Future<List<Partisipan>> getItemList() async {
    var itemMapList = await select();
    int count = itemMapList.length;
    List<Partisipan> itemList = List<Partisipan>();
    for (int i = 0; i < count; i++) {
      itemList.add(Partisipan.fromMap(itemMapList[i]));
    }
    return itemList;
  }

  //konversi dari bentuk string menuju bentuk map object pada table kepribadian
  Future<List<Kepribadian>> getKepribadianList() async {
    var itemMapList = await selectKepribadian();
    int count = itemMapList.length;
    List<Kepribadian> itemList = List<Kepribadian>();
    for (int i = 0; i < count; i++) {
      itemList.add(Kepribadian.fromMap(itemMapList[i]));
    }
    return itemList;
  }

  factory DbHelper() {
    if (_dbHelper == null) {
      _dbHelper = DbHelper._createObject();
    }
    return _dbHelper;
  }
  Future<Database> get database async {
    if (_database == null) {
      _database = await initDb();
    }
    return _database;
  }
}
