import 'package:flutter/material.dart';

class SleepScreen extends StatelessWidget {
  final List<Map<String, String>> sleepTips = [
    {
      'title': 'Gün boyunca hareket edin',
      'subtitle': 'Düzenli egzersiz yaparak uykunuzun kalitesini artırabilirsiniz.',
      'image': 'assets/images/exercise.png',
    },
    {
      'title': 'Düzenli bir uyku programı oluşturun',
      'subtitle': 'Her gece aynı saatte yatıp kalkarak vücudunuzun alışkanlık edinmesini sağlayabilirsiniz.',
      'image': 'assets/images/clock.png',
    },
    {
      'title': 'Stresten kaçının',
      'subtitle': 'Stresli durumlarda meditasyon, yoga veya derin nefes alma egzersizleri yapabilirsiniz.',
      'image': 'assets/images/relaxation.png',
    },
    {
      'title': 'Uyku ortamınızı düzenleyin',
      'subtitle': 'Sessiz, karanlık ve serin bir uyku ortamı oluşturmak uykunuzun kalitesini artırabilir.',
      'image': 'assets/images/bedroom.png',
    },
    {
      'title': 'Kafein ve alkol tüketimini azaltın',
      'subtitle': 'Kafein ve alkol tüketimi uyku kalitenizi olumsuz etkileyebilir.',
      'image': 'assets/images/drink.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Uyku Önerileri'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: sleepTips.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    leading: CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.deepPurple.withOpacity(0.5),
                      child: Image.asset(
                        sleepTips[index]['image']!,
                        width: 32,
                        height: 32,
                      ),
                    ),
                    title: Text(
                      sleepTips[index]['title']!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    subtitle: Text(
                      sleepTips[index]['subtitle']!,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
