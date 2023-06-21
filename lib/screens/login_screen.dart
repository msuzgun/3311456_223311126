import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:saglikli_yasam/screens/anamenu.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/logo.png',width: 150,),
              const SizedBox(height: 20.0), // Logo ile arasında bir boşluk
              Form(
                key: _formKey,
                child: Column(
                  children: [

                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(labelText: 'E-posta'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'E-posta alanı boş olamaz.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: _passwordController,
                      decoration: const InputDecoration(labelText: 'Şifre'),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Şifre alanı boş olamaz.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: _isLoading ? null : _login,
                            child: const Text('Giriş Yap'),
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: _isLoading ? null : _register,
                            child: const Text('Kayıt Ol'),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        final String email = _emailController.text.trim();
        final String password = _passwordController.text.trim();

        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );

        // Başarılı oturum açma durumunda yapılacak işlemler
        Navigator.push(context, MaterialPageRoute(builder: (context)=>AnaMenu()));

      } catch (error) {
        // Oturum açma hatası
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('Oturum Açma Hatası'),
            content: const Text('Oturum açarken bir hata oluştu. Lütfen tekrar deneyin.'),
            actions: [
              TextButton(
                child: const Text('Tamam'),
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
              ),
            ],
          ),
        );
      }

      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _register() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      try {
        final String email = _emailController.text.trim();
        final String password = _passwordController.text.trim();

        await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        // Başarılı kayıt oluşturma durumunda yapılacak işlemler

      } catch (error) {
        // Kayıt oluşturma hatası
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('Kayıt Oluşturma Hatası'),
            content: const Text('Kayıt oluştururken bir hata oluştu. Lütfen tekrar deneyin.'),
            actions: [
              TextButton(
                child: const Text('Tamam'),
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
              ),
            ],
          ),
        );
      }

      setState(() {
        _isLoading = false;
      });
    }
  }
}
