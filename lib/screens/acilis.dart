import 'package:flutter/material.dart';

import 'package:saglikli_yasam/screens/login_screen.dart';

class Acilis extends StatefulWidget {
  @override
  _AcilisState createState() => _AcilisState();
}

class _AcilisState extends State<Acilis> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _logoAnimation;
  late Animation<double> _textAnimation;
  late Animation<Color?> _backgroundColorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3), // Toplam animasyon süresi
    );

    _logoAnimation = Tween<double>(
      begin: -1.0,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.0, 0.5, curve: Curves.easeInOut), // Logo animasyonu süresi
    ));

    _textAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.5, 1.0, curve: Curves.easeInOut), // Yazı animasyonu süresi
    ));

    _backgroundColorAnimation = ColorTween(
      begin: Colors.white,
      end: Colors.greenAccent[100], // Arka plan rengi
    ).animate(_controller);

    _controller.forward(); // Animasyonu başlat

    // 5 saniye sonra Homescreen'e yönlendir
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()), // Homescreen widget'ını navigate edin
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          backgroundColor: _backgroundColorAnimation.value,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedBuilder(
                  animation: _logoAnimation,
                  builder: (BuildContext context, Widget? child) {
                    return Transform(
                      transform: Matrix4.translationValues(
                        0.0,
                        _logoAnimation.value * MediaQuery.of(context).size.height,
                        0.0,
                      ),
                      child: child,
                    );
                  },
                  child: Image.asset(
                    'assets/logo.png',
                    width: 150,
                  ),
                ),
                SizedBox(height: 16),
                FadeTransition(
                  opacity: _textAnimation as Animation<double>,
                  child: Text(

                    'SAĞLIKLI\n YAŞAM',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.green, // Yazı rengi
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
