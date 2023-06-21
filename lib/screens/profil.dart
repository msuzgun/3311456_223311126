import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Profil extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<Profil> {
  final User? user = FirebaseAuth.instance.currentUser;
  final String? uid = FirebaseAuth.instance.currentUser?.uid;
  final CollectionReference profilesCollection =
  FirebaseFirestore.instance.collection('profiles');

  TextEditingController adController = TextEditingController();
  TextEditingController soyadController = TextEditingController();
  TextEditingController boyController = TextEditingController();
  TextEditingController kiloController = TextEditingController();
  TextEditingController dogumTarihiController = TextEditingController();

  bool isEditing = false;
  bool hasProfile = false;

  @override
  void initState() {
    super.initState();
    fetchProfileData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil Sayfası'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: adController,
              decoration: InputDecoration(labelText: 'Ad'),
              enabled: isEditing,
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: soyadController,
              decoration: InputDecoration(labelText: 'Soyad'),
              enabled: isEditing,
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: boyController,
              decoration: InputDecoration(labelText: 'Boy'),
              enabled: isEditing,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: kiloController,
              decoration: InputDecoration(labelText: 'Kilo'),
              enabled: isEditing,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: dogumTarihiController,
              decoration: InputDecoration(labelText: 'Doğum Tarihi'),
              enabled: isEditing,
              keyboardType: TextInputType.datetime,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (isEditing) {
                  updateProfileData();
                }
                setState(() {
                  isEditing = !isEditing;
                });
              },
              child: Text(isEditing ? 'Kaydet' : 'Düzenle'),
            ),
          ],
        ),
      ),
    );
  }

  void fetchProfileData() async {
    try {
      DocumentSnapshot document = await profilesCollection.doc(uid).get();

      if (document.exists) {
        setState(() {
          hasProfile = true;
          adController.text = document.get('ad') ?? '';
          soyadController.text = document.get('soyad') ?? '';
          boyController.text = document.get('boy') ?? '';
          kiloController.text = document.get('kilo') ?? '';
          dogumTarihiController.text = document.get('dogumTarihi') ?? '';
        });
      } else {
        setState(() {
          hasProfile = false;
        });
      }
    } catch (e) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
        return AlertDialog(
            title: Text('Hata'),
    content: Text('Profil bilgileri alınırken birhata oluştu.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Tamam'),
            ),
          ],
        );
          },
      );
    }
  }

  void updateProfileData() async {
    try {
      if (hasProfile) {
// Profil kaydı varsa güncelle
        await profilesCollection.doc(uid).update({
          'ad': adController.text,
          'soyad': soyadController.text,
          'boy': boyController.text,
          'kilo': kiloController.text,
          'dogumTarihi': dogumTarihiController.text,
        });
      } else {
// Profil kaydı yoksa oluştur
        await profilesCollection.doc(uid).set({
          'ad': adController.text,
          'soyad': soyadController.text,
          'boy': boyController.text,
          'kilo': kiloController.text,
          'dogumTarihi': dogumTarihiController.text,
        });
      }
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Başarılı'),
            content: Text('Profil bilgileri güncellendi.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Tamam'),
              ),
            ],
          );
        },
      );

      setState(() {
        isEditing = false;
      });
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Hata'),
            content: Text('Profil bilgileri güncellenirken bir hata oluştu.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Tamam'),
              ),
            ],
          );
        },
      );
    }
  }
}
