import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as Path;
import 'package:syncfusion_flutter_charts/charts.dart';

class Susayar extends StatefulWidget {
  @override
  _SusayarState createState() => _SusayarState();
}

class _SusayarState extends State<Susayar> {
  late Database _database;
  final List<String> suMiktarlari = ['200 ml', '500 ml', '1000 ml'];
  final List<String> suResimleri = [
    'assets/images/su_bardagi.png',
    'assets/images/pet_500ml.png',
    'assets/images/pet_1000ml.png',
  ];
  List<Map<String, dynamic>> kayitlar = [];
  List<BarChartData> grafikVerileri = [];

  @override
  void initState() {
    super.initState();
    openDatabaseAndCreateTable();
    fetchKayitlar();
  }

  Future<void> openDatabaseAndCreateTable() async {
    final databasesPath = await getDatabasesPath();
    final path = Path.join(databasesPath, 'susayar.db');

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          '''
          CREATE TABLE suMiktarlari (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            miktar TEXT,
            tarih TEXT
          )
          ''',
        );
      },
    );
  }

  Future<void> fetchKayitlar() async {
    final List<Map<String, dynamic>> result =
    await _database.query('suMiktarlari', orderBy: 'tarih ASC');
    setState(() {
      kayitlar = result;
      grafikVerileri = getGrafikVerileri();
    });
  }

  Future<void> kaydet(String miktar) async {
    final DateTime now = DateTime.now();
    final String formattedDate = '${now.year}-${now.month}-${now.day}';

    await _database.insert(
      'suMiktarlari',
      {'miktar': miktar, 'tarih': formattedDate},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(microseconds: 500),
        content: Text('Su miktarı kaydedildi.'),
      ),
    );

    fetchKayitlar();
  }

  Future<void> sil(int id) async {
    await _database.delete('suMiktarlari', where: 'id = ?', whereArgs: [id]);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(microseconds: 500),
        content: Text('Kayıt silindi.'),
      ),
    );

    fetchKayitlar();
  }

  int getToplamSuMiktari() {
    int toplamMiktar = 0;
    for (var kayit in kayitlar) {
      final miktar = kayit['miktar'] as String;
      toplamMiktar += int.parse(miktar.split(' ')[0]);
    }
    return toplamMiktar;
  }

  List<BarChartData> getGrafikVerileri() {
    List<BarChartData> veriler = [];
    Map<String, int> tarihMiktarMap = {};

    for (var kayit in kayitlar) {
      final tarih = kayit['tarih'] as String;
      final miktar = int.parse(kayit['miktar'].split(' ')[0]);

      if (tarihMiktarMap.containsKey(tarih)) {
        tarihMiktarMap[tarih] = tarihMiktarMap[tarih]! + miktar;
      } else {
        tarihMiktarMap[tarih] = miktar;
      }
    }

    tarihMiktarMap.forEach((tarih, miktar) {
      veriler.add(BarChartData(tarih: tarih, miktar: miktar));
    });

    return veriler;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Susayar'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
      Expanded(
      child: GridView.builder(
      shrinkWrap: true,
        padding: EdgeInsets.all(16.0),
        itemCount: suMiktarlari.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
        ),
        itemBuilder: (context, index) {
          final miktar = suMiktarlari[index];
          final resim = suResimleri[index];

          return InkWell(
            onTap: () => kaydet(miktar),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4.0,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    resim,
                    width: 64.0,
                    height: 64.0,
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    miktar,
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    ),
    Divider(height: 1.0, color: Colors.grey),
    Padding(
    padding: EdgeInsets.all(16.0),
    child: Text(
    'Günlük Su Kayıtları',
    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
    ),
    ),
    Expanded(
    child: ListView.builder(
    reverse: true,
    itemCount: kayitlar.length,
    itemBuilder: (context, index) {
    final kayit = kayitlar[index];
    final id = kayit['id'] as int;
    final miktar = kayit['miktar'] as String;
    final tarih = kayit['tarih'] as String;

    return ListTile(
    leading: IconButton(
    icon: Icon(Icons.delete),
    onPressed: () => sil(id),
    ),
    title: Text(miktar),
    subtitle: Text(tarih),
    );
    },
    ),
    ),
    Container(
    color: Colors.blue,
    padding: EdgeInsets.all(16.0),
    child: Text(
    'Toplam Su Miktarı: ${getToplamSuMiktari()} ml',
    style: TextStyle(fontSize: 18.0, color: Colors.white),
    ),
    ),
    Padding(
    padding: EdgeInsets.all(16.0),
    child: Text(
    'Günlük Su Tüketimi Grafiği',
      style: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    ),
          Expanded(
            child: SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              primaryYAxis: NumericAxis(),
              series: <ChartSeries>[
                ColumnSeries<BarChartData, String>(
                  dataSource: grafikVerileri,
                  xValueMapper: (BarChartData data, _) => data.tarih,
                  yValueMapper: (BarChartData data, _) => data.miktar,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BarChartData {
  final String tarih;
  final int miktar;

  BarChartData({required this.tarih, required this.miktar});
}


