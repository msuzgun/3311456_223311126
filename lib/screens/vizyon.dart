import 'package:flutter/material.dart';

class VisionMissionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vizyon ve Misyon'),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Vizyonumuz',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue[900],
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Şirketimiz, her zaman yenilikçi ve öncü bir yaklaşımla müşterilerine hizmet vermektedir.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.blue[900],
              ),
            ),
            SizedBox(height: 32.0),
            Text(
              'Misyonumuz',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.orange[900],
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Müşterilerimize, kaliteli ve güvenilir hizmet sunmak için çalışıyoruz. ',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.orange[900],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
