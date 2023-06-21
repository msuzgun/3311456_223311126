import 'package:flutter/material.dart';

class MentalHealthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mental Sağlık'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mental Sağlık',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                'Mental sağlık, beden sağlığı kadar önemlidir. İşte size bazı mental sağlık ipuçları:',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              _buildTipCard(
                context,
                'Stresle Başa Çıkmak',
                'Stresle başa çıkmak için yoga, meditasyon ve derin nefes egzersizleri yapabilirsiniz.',
                'assets/images/stress.jpg',
              ),
              _buildTipCard(
                context,
                'Uyku Düzeni',
                'Uyku düzeninizi düzenli hale getirin. Yeterli ve kaliteli uyku almak mental sağlık için önemlidir.',
                'assets/images/sleep.jpg',
              ),
              _buildTipCard(
                context,
                'Sosyal İlişkiler',
                'Sosyal ilişkilerinizde sağlıklı sınırlar belirleyin. Negatif insanlardan uzak durun.',
                'assets/images/social.jpg',
              ),
              _buildTipCard(
                context,
                'Hobiler',
                'Bir hobi edinin ve onunla düzenli olarak ilgilenin. Hobiler sizi mutlu eder ve stresle başa çıkmaya yardımcı olur.',
                'assets/images/hobies.jpg',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTipCard(
      BuildContext context,
      String title,
      String description,
      String image,
      ) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            image,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
