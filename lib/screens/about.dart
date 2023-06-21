import 'package:flutter/material.dart';
import 'package:saglikli_yasam/screens/about_ic.dart';
import 'package:saglikli_yasam/screens/ekib.dart';
import 'package:saglikli_yasam/screens/vizyon.dart';
import 'package:saglikli_yasam/screens/iletisim.dart';
import 'package:saglikli_yasam/screens/kullanimsart.dart';
class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hakkında'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.red,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AboutScreenic(),
                    ),
                  );
                },
                child: Center(
                  child: Text(
                    'Hakkımızda',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.green,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VisionMissionScreen(),
                    ),
                  );
                },
                child: Center(
                  child: Text(
                    'Vizyon ve Misyon',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.blue,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TeamScreen(),
                    ),
                  );
                },
                child: Center(
                  child: Text(
                    'Ekibimiz',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.orange,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => iletisim(),
                    ),
                  );
                },
                child: Center(
                  child: Text(
                    'İletişim',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.purple,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => KullanimSart(),
                    ),
                  );
                },
                child: Center(
                  child: Text(
                    'Kullanım Şartları ve Gizlilik',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            color: Colors.grey[200],
            height: 50.0,
            child: Center(
              child: Text(
                'Her Hakkı Saklıdır!',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
