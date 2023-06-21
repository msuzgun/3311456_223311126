import 'package:flutter/material.dart';

class iletisim extends StatefulWidget {
  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<iletisim> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('İletişim'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Ad Soyad',
                  hintText: 'Lütfen adınızı ve soyadınızı girin',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Lütfen adınızı ve soyadınızı girin';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'E-Posta',
                  hintText: 'Lütfen e-posta adresinizi girin',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Lütfen e-posta adresinizi girin';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _messageController,
                maxLines: null,
                decoration: InputDecoration(
                  labelText: 'Mesajınız',
                  hintText: 'Lütfen mesajınızı girin',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Lütfen mesajınızı girin';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Send form data to server ama  şu anda ekranda yazdırır
                    final name = _nameController.text;
                    final email = _emailController.text;
                    final message = _messageController.text;
                    print('Name: $name, Email: $email, Message: $message');

                    // Show success message
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Mesajınız gönderildi!'),
                          content: Text('Teşekkür ederiz.'),
                          actions: [
                            TextButton(
                              child: Text('Kapat'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );

                    // Clear form fields
                    _nameController.clear();
                    _emailController.clear();
                    _messageController.clear();
                  }
                },
                child: Text('Gönder'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
