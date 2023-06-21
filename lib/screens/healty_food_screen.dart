import 'package:flutter/material.dart';

class HealthyFoodScreen extends StatelessWidget {
  final List<String> foodItems = [
    'Ispanak',
    'Kırmızı Biber',
    'Portakal',
    'Yumurta',
    'Muz',
    'Avokado',
    'Brokoli',
    'Badem',
    'Somon',
    'Mercimek',

  ];

  final List<String> foodDescriptions = [
    'Ispanak, antioksidanlar ve C vitamini bakımından zengin olup kemik sağlığına da katkı sağlar.',
    'Kırmızı biber, C vitamini bakımından yüksek olup göz sağlığı için faydalıdır.',
    'Portakal, yüksek miktarda C vitamini içerir ve bağışıklık sistemini güçlendirir.',
    'Yumurta, yüksek protein içeriği ile kas gelişimi ve onarımı için gereklidir.',
    'Muz, potasyum bakımından yüksek olup kas kasılmalarına yardımcı olur.',
    'Avokado, kalp sağlığı için faydalı olan sağlıklı yağlar içerir.',
    'Brokoli, C vitamini ve lif bakımından yüksek olup sindirim sağlığına katkı sağlar.',
    'Badem, E vitamini ve magnezyum bakımından zengindir ve kalp sağlığı için faydalıdır.',
    'Somon, omega-3 yağ asitleri içerir ve beyin sağlığı için faydalıdır.',
    'Mercimek, yüksek protein ve lif içeriği ile sindirim sağlığına katkı sağlar.',

  ];

  final List<String> foodImages = [
    'assets/images/spinach.jpeg',
    'assets/images/red_pepper.jpeg',
    'assets/images/orange.jpeg',
    'assets/images/egg.jpeg',
    'assets/images/banana.jpeg',
    'assets/images/avocado.jpeg',
    'assets/images/broccoli.jpeg',
    'assets/images/almond.jpeg',
    'assets/images/salmon.jpeg',
    'assets/images/lentils.jpeg',

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text('Sağlıklı Yiyecekler'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: foodItems.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemBuilder:
              (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                _showFoodDetailsDialog(context, foodItems[index], foodDescriptions[index], foodImages[index]);
              },
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Image.asset(
                        foodImages[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        foodItems[index],
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _showFoodDetailsDialog(BuildContext context, String title, String description, String imagePath) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Image.asset(
                  imagePath,
                  height: 200,
                ),
                SizedBox(height: 8.0),
                Text(description),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Kapat'),
            ),
          ],
        );
      },
    );
  }
}