import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HavaDurumuSayfasi extends StatefulWidget {
  @override
  _HavaDurumuSayfasiState createState() => _HavaDurumuSayfasiState();
}

class _HavaDurumuSayfasiState extends State<HavaDurumuSayfasi> {
  String _sehir = 'Ankara'; // İstediğiniz şehri burada belirtebilirsiniz
  String _apiKey = 'd5844c2e2cad4634a55123645232106'; // WeatherAPI.com'dan alacağınız API anahtarını buraya ekleyin
  String _sicaklik = '';
  String _durum = '';
  String _ruzgar = '';
  String _havaDurumuResim = '';

  List<String> _sehirler = [
    'Adana', 'Adıyaman', 'Afyon', 'Ağrı', 'Amasya', 'Ankara', 'Antalya', 'Artvin', 'Aydın', 'Balıkesir',
    'Bilecik', 'Bingöl', 'Bitlis', 'Bolu', 'Burdur', 'Bursa', 'Çanakkale', 'Çankırı', 'Çorum', 'Denizli',
    'Diyarbakır', 'Edirne', 'Elazığ', 'Erzincan', 'Erzurum', 'Eskişehir', 'Gaziantep', 'Giresun', 'Gümüşhane',
    'Hakkari', 'Hatay', 'Isparta', 'Mersin', 'İstanbul', 'İzmir', 'Kars', 'Kastamonu', 'Kayseri', 'Kırklareli',
    'Kırşehir', 'Kocaeli', 'Konya', 'Kütahya', 'Malatya', 'Manisa', 'Kahramanmaraş', 'Mardin', 'Muğla', 'Muş',
    'Nevşehir', 'Niğde', 'Ordu', 'Rize', 'Sakarya', 'Samsun', 'Siirt', 'Sinop', 'Sivas', 'Tekirdağ', 'Tokat',
    'Trabzon', 'Tunceli', 'Şanlıurfa', 'Uşak', 'Van', 'Yozgat', 'Zonguldak', 'Aksaray', 'Bayburt', 'Karaman',
    'Kırıkkale', 'Batman', 'Şırnak', 'Bartın', 'Ardahan', 'Iğdır', 'Yalova', 'Karabük', 'Kilis', 'Osmaniye',
    'Düzce'
  ];

  Future<void> _havaDurumuVerisiCek(String sehir) async {
    var url =
        'https://api.weatherapi.com/v1/current.json?key=$_apiKey&q=$sehir&aqi=no';

    var response =  await http.get(Uri.parse(url));
    var durumTR="";
    if (response.statusCode == 200) {
      var veri = jsonDecode(response.body);
      setState(() {
        _sicaklik = veri['current']['temp_c'].toString();
        _durum = _getHavaDurumuTr(veri['current']['condition']['text']);
        _ruzgar = veri['current']['wind_kph'].toString();
        _havaDurumuResim = _getHavaDurumuResim(_durum);
      });
    }
  }

  String _getHavaDurumuResim(String durum) {
    switch (durum) {
      case 'Güneşli':
        return 'assets/images/gunesli.jpg';
      case 'Parçalı Bulutlu':
        return 'assets/images/bulutlu.jpg';
      case 'Bulutlu':
        return 'assets/images/bulutlu.jpg';
      case 'Yağmurlu':
        return 'assets/images/yagmurlu.jpg';
      case 'Gök gürültülü sağanak':
        return 'assets/images/yagmurlu.jpg';
      case 'Fırtınalı':
        return 'assets/images/simsekli.jpg';
      case 'Hafif yağmurlu':
        return 'assets/images/yagmurlu.jpg';
      case 'Gök gürültülü hafif yağmur':
        return 'assets/images/yagmurlu.jpg';
      case 'Kısmen yağmur':
        return 'assets/images/yagmurlu.jpg';
      default:
        return 'assets/images/gunesli.jpg';
    }
  }
  String _getHavaDurumuTr(String durum) {
    switch (durum) {
      case 'Sunny':
        return 'Güneşli';
      case 'Partly cloudy':
        return 'Parçalı Bulutlu';
      case 'Cloudy':
        return 'Bulutlu';
      case 'Rainy':
        return 'Yağmurlu';
      case 'Moderate or heavy rain with thunder':
        return 'Gök gürültülü sağanak';
      case 'Patchy light rain with thunder':
        return 'Gök gürültülü hafif yağmur';
      case 'Thundery outbreaks possible':
        return 'Fırtınalı';
      case 'Patchy rain possible':
        return 'Kısmen yağmur';
      case 'Light rain shower':
        return 'Hafif yağmurlu';
      default:
        return durum;
    }
  }
  @override
  void initState() {
    super.initState();
    _havaDurumuVerisiCek(_sehir);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hava Durumu'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButton<String>(
              value: _sehir,
              onChanged: (String? newValue) {
                setState(() {
                  _sehir = newValue!;
                  _havaDurumuVerisiCek(_sehir);
                });
              },
              items: _sehirler.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    _havaDurumuResim,
                    width: 300,
                    height: 300,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Şehir: $_sehir',
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Sıcaklık: $_sicaklik°C',
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Durum: $_durum',
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Rüzgar: $_ruzgar km/s',
                    style: TextStyle(fontSize: 24),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
