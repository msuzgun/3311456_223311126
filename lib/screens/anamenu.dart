import 'package:flutter/material.dart';
import 'package:saglikli_yasam/screens/havadurum.dart';
import 'package:saglikli_yasam/screens/home_screen.dart';
import 'package:saglikli_yasam/screens/susayar.dart';
import 'package:saglikli_yasam/screens/profil.dart';


class AnaMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Profil()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFEE99AA), // Pembe
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.account_circle, size: 48),
                          SizedBox(height: 8),
                          Text('Profil'),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF99CCEE), // Mavi
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.search, size: 48),
                          SizedBox(height: 8),
                          Text('Araştır'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Susayar()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF99EEAA), // Yeşil
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.water_drop_rounded, size: 48),
                          SizedBox(height: 8),
                          Text('Su Sayar'),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>HavaDurumuSayfasi()));                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFFFBB88), // Turuncu
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.sunny_snowing, size: 48),
                          SizedBox(height: 8),
                          Text('Hava Durumu'),
                        ],
                      ),
                    ),
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