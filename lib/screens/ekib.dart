import 'package:flutter/material.dart';

class TeamScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ekibimiz'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Ekibimiz',
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 32.0),
            Expanded(
              child: ListView(
                children: [
                  _buildMemberCard(
                    'assets/images/member1.jpg',
                    'Ahmet Yılmaz',
                    'Yazılım Mühendisi',
                  ),
                  SizedBox(height: 16.0),
                  _buildMemberCard(
                    'assets/images/member2.jpg',
                    'Fatma Kaya',
                    'UI/UX Tasarımcısı',
                  ),
                  SizedBox(height: 16.0),
                  _buildMemberCard(
                    'assets/images/member3.jpg',
                    'Mehmet Aktaş',
                    'Proje Yöneticisi',
                  ),
                  SizedBox(height: 16.0),
                  _buildMemberCard(
                    'assets/images/member4.jpg',
                    'Ayşe Demir',
                    'Mobil Uygulama Geliştiricisi',
                  ),
                  SizedBox(height: 16.0),
                  _buildMemberCard(
                    'assets/images/member5.jpg',
                    'Mustafa Şahin',
                    'Full Stack Geliştirici',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildMemberCard(String imagePath, String name, String title) {
    return Container(
      height: 120.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 3.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 2.0),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 120.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.0),
                bottomLeft: Radius.circular(8.0),
              ),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 16.0),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
