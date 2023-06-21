import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/acilis.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(SaglikliYasam());
}


class SaglikliYasam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sağlıklı Yaşam' ,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Acilis(),
    );
  }
}


