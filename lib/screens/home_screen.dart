import 'package:flutter/material.dart';
import 'package:saglikli_yasam/screens/about.dart';
import 'package:saglikli_yasam/screens/bmi_calculator_screen.dart';
import 'package:saglikli_yasam/screens/exercise_screen.dart';
import 'package:saglikli_yasam/screens/healty_food_screen.dart';
import 'package:saglikli_yasam/screens/mental_health_screen.dart';
import 'package:saglikli_yasam/screens/sleep_screen.dart';
import 'package:saglikli_yasam/screens/about.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _children = [       HealthyFoodScreen(), ExerciseScreen(), MentalHealthScreen(), SleepScreen(), BmiCalculatorScreen(), AboutScreen()  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [

          BottomNavigationBarItem(
            backgroundColor: Colors.blueGrey,
            icon: Icon(Icons.restaurant),
            label: 'Sağlıklı Yiyecekler',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.blueGrey,
            icon: Icon(Icons.directions_run),
            label: 'Egzersiz',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.blueGrey,
            icon: Icon(Icons.mood),
            label: 'Mental Sağlık',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.blueGrey,
            icon: Icon(Icons.nightlight_round),
            label: 'Uyku Sağlığı',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.blueGrey,
            icon: Icon(Icons.calculate),
            label: 'VKE',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Diğer Menü',
          ),
        ],
      ),
    );
  }
}


