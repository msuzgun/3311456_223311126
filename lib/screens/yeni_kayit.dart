import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _signUp() async {
    try {
      final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );
      // Kayıt başarılı
      // İstediğiniz ek işlemleri gerçekleştirin (veritabanına kullanıcı bilgilerini kaydetme, vb.)
      print('Hesap oluşturuldu: ${userCredential.user?.email}');
    } catch (e) {
      // Kayıt sırasında hata oluştu
      print('Hesap oluşturulamadı: $e');
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlutterLogo(
                    size: 100.0,
                  ),
                  SizedBox(height: 50.0),
                  Text(
                    'Yeni Hesap Oluştur',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 50.0),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: 'E-posta adresiniz',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Şifreniz',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: _signUp,
                    child: Text('Hesap Oluştur'),
                  ),
                  SizedBox(height: 10.0),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context); // Geri düğmesi, login ekranına geri dönmek için
                    },
                    child: Text('Geri'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
