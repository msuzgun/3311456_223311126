import 'package:flutter/material.dart';

class KullanimSart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Kullanım Şartları ve Gizlilik Politikası',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'KULLANIM ŞARTLARI',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Bu uygulama ile ilgili tüm haklar saklıdır. Uygulama içerisinde yer alan tüm bilgiler yalnızca bilgilendirme amaçlıdır ve kullanımından doğabilecek herhangi bir sorumluluk kabul edilmemektedir.',
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            SizedBox(height: 32),
            Text(
              'GİZLİLİK POLİTİKASI',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Bu uygulama, kullanıcıların kişisel bilgilerini (ad, soyad, e-posta, telefon numarası vb.) toplayabilir. Bu bilgiler, kullanıcıların uygulamada verilen hizmetlerden yararlanabilmesi ve kullanıcı deneyimini iyileştirmek amacıyla kullanılabilir.',
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            SizedBox(height: 16),
            Text(
              'Kullanıcılarımızın gizliliği bizim için önemlidir. Kişisel bilgilerinizin gizliliğini korumak için gerekli tüm önlemleri almaktayız ve bu bilgileri üçüncü şahıslarla kesinlikle paylaşmamaktayız.',
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            SizedBox(height: 32),
            Text(
              'KABUL EDİYORUM',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Bu uygulamayı kullanarak, Kullanım Şartları ve Gizlilik Politikası\'nı okuduğunuzu, anladığınızı ve kabul ettiğinizi beyan etmiş olursunuz.',
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
          ],
        ),
      ),
    );
  }
}
