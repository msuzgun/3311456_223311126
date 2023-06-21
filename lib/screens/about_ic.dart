import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class AboutScreenic extends StatefulWidget {
  @override
  _AboutScreenicState createState() => _AboutScreenicState();
}

class _AboutScreenicState extends State<AboutScreenic> {
  File? selectedImage;
  String imagePath = '';

  @override
  void initState() {
    super.initState();
    getImagePath().then((value) {
      setState(() {
        imagePath = value;
      });
    });
  }

  Future<String> getImagePath() async {
    Directory appDocumentsDirectory = await getApplicationDocumentsDirectory();
    String appDocumentsPath = appDocumentsDirectory.path;
    String imageFileName = 'profile_pic.jpg';
    return path.join(appDocumentsPath, imageFileName);
  }

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: source);
    if (pickedImage != null) {
      File imageFile = File(pickedImage.path);
      String newImagePath = await getImagePath();
      await imageFile.copy(newImagePath);
      setState(() {
        selectedImage = imageFile;
        imagePath = newImagePath;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Murat Süzgün'),
        ),
        body: Container(
        padding: EdgeInsets.all(16.0),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      CircleAvatar(
        radius: 80.0,
        backgroundImage: selectedImage != null
            ? FileImage(selectedImage!)
            : AssetImage('assets/images/profile_pic.jpg') as ImageProvider,
      ),

      SizedBox(height: 16.0),
    Text(
    'Murat Süzgün',
    style: TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    ),
    ),
    SizedBox(height: 8.0),
    Text(
    'Flutter Geliştiricisi',
    style: TextStyle(
    fontSize: 18.0,
    ),
    ),
    SizedBox(height: 16.0),
    Text(
    'Hakkımda: ',
    style: TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    ),
    ),
    SizedBox(height: 8.0),
    Text(
    'Merhaba, ben Murat Süzgün. 2 yıldır Flutter ile uğraşıyorum. Flutter ile mobil uygulama geliştirmeye, özellikle de kullanıcı arayüzüne olan ilgim nedeniyle başladım. Flutter\'ın sağladığı kolaylık ve hız sayesinde birçok projede yer aldım ve olmaya da devam ediyorum. ',
    textAlign: TextAlign.center,
    style: TextStyle(
    fontSize: 16.0,
    ),
    ),
    SizedBox(height: 16.0),
    ElevatedButton(
        onPressed: () {
          // TODO: Button action
        },
          child: Text('Projelerim'),
        ),
      ],
    ),
    ),
    floatingActionButton: FloatingActionButton(
    onPressed: () {
    showDialog(
    context: context,
    builder: (BuildContext context) {
    return AlertDialog(
    title: Text('Profil Resmini Seç'),
    content: SingleChildScrollView(
    child: ListBody(
    children: [
    GestureDetector(
    child: Text('Kamera'),
    onTap: () {
    _pickImage(ImageSource.camera);
    Navigator.of(context).pop();
    },
    ),
    SizedBox(height: 16.0),
    GestureDetector(
    child: Text('Galeri'),
    onTap: () {
    _pickImage(ImageSource.gallery);
    Navigator.of(context).pop();
    },
    ),
    ],
    ),
    ),
    );
    },
    );
    },
    child: Icon(Icons.add_a_photo),
    ),
    );
  }
}
