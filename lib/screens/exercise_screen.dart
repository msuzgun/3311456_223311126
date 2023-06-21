import 'package:flutter/material.dart';

class ExerciseScreen extends StatefulWidget {
  @override
  _ExerciseScreenState createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Egzersiz Önerileri'),
        backgroundColor: Colors.deepOrange,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ExpansionPanelList.radio(
            initialOpenPanelValue: 0,
            children: List.generate(exerciseItems.length, (index) {
              return ExpansionPanelRadio(
                value: index,
                canTapOnHeader: true,
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      exerciseItems[index],
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
                body: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    exerciseDescriptions[index],
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
              );
            }),
            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                _selectedIndex = index;
              });
            },
            animationDuration: Duration(milliseconds: 500),
            expandedHeaderPadding: EdgeInsets.all(8.0),
          ),
        ),
      ),
    );
  }
}

final List<String> exerciseItems = [  'Kardiyo',  'Kuvvet Antrenmanı',  'Yoga',  'Pilates',];

final List<String> exerciseDescriptions = [  'Kardiyo, kalp ve dolaşım sisteminin sağlıklı bir şekilde çalışması için çok önemlidir. Kardiyo egzersizleri arasında yürüyüş, koşu, bisiklet sürme, yüzme, kürek çekme ve dans yer alır. Günlük kardiyo egzersizi, genel sağlığınızı iyileştirmeye yardımcı olur.',  'Kuvvet antrenmanı, kas kütlenizi ve metabolizmanızı artırmaya yardımcı olur. Kuvvet antrenmanı yaparken, ağırlık kaldırma, barfiks, mekik ve plank yapabilirsiniz.',  'Yoga, vücudunuzun esnekliğini artırır ve zihninizi sakinleştirir. Yoga egzersizleri arasında, özellikle gevşeme pozları ve nefes egzersizleri öne çıkar.',  'Pilates, merkezi vücut kaslarını güçlendirmeye ve esnekliği artırmaya yardımcı olur. Pilates egzersizleri arasında, özellikle karın kasları ve sırt kaslarına odaklanan egzersizler bulunur.',];
