import 'package:flutter/material.dart';

class BmiCalculatorScreen extends StatefulWidget {
  const BmiCalculatorScreen({Key? key}) : super(key: key);

  @override
  _BmiCalculatorScreenState createState() => _BmiCalculatorScreenState();
}

class _BmiCalculatorScreenState extends State<BmiCalculatorScreen> {
  final _formKey = GlobalKey<FormState>();
  double _bmiResult = 0;
  String _bmiCategory = '';

  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  void _calculateBmi() {
    double height = double.parse(_heightController.text) / 100.0;
    double weight = double.parse(_weightController.text);

    setState(() {
      _bmiResult = weight / (height * height);

      if (_bmiResult < 18.5) {
        _bmiCategory = 'Zayıf';
      } else if (_bmiResult >= 18.5 && _bmiResult < 25.0) {
        _bmiCategory = 'Normal';
      } else if (_bmiResult >= 25.0 && _bmiResult < 30.0) {
        _bmiCategory = 'Fazla Kilolu';
      } else {
        _bmiCategory = 'Obez';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vücut Kitle Endeksi Hesaplama'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _heightController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Boy (cm)',
                    hintText: 'Örn: 175',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Lütfen boyunuzu girin';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _weightController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Kilo (kg)',
                    hintText: 'Örn: 70',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Lütfen kilonuzu girin';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _calculateBmi();
                    }
                  },
                  child: const Text('HESAPLA'),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Vücut Kitle Endeksiniz: ${_bmiResult.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Durumunuz: $_bmiCategory',
                  style: const TextStyle(fontSize: 20.0),
                ),
                SizedBox(height: 16.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
