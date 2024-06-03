import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myapp/models/activity.dart';
import 'package:myapp/providers/app_providers.dart';
import 'package:myapp/pages/kegiatan_anak_page.dart';

class InputKegiatanPage extends StatefulWidget {
  @override
  _InputKegiatanPageState createState() => _InputKegiatanPageState();
}

class _InputKegiatanPageState extends State<InputKegiatanPage> {
  final TextEditingController _kegiatanController = TextEditingController();
  final TextEditingController _deskripsiController = TextEditingController();

  void _submitKegiatan() {
    final String kegiatan = _kegiatanController.text;
    final String deskripsi = _deskripsiController.text;

    if (kegiatan.isNotEmpty && deskripsi.isNotEmpty) {
      Provider.of<AppProvider>(context, listen: false)
          .addActivity(Activity(name: kegiatan, description: deskripsi));
      _kegiatanController.clear();
      _deskripsiController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Kegiatan'),
        backgroundColor: Colors.indigo,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.indigo, Colors.blue],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Text(
                'Input Kegiatan',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: _kegiatanController,
                        decoration: InputDecoration(
                          labelText: 'Nama Kegiatan',
                          labelStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      TextField(
                        controller: _deskripsiController,
                        decoration: InputDecoration(
                          labelText: 'Deskripsi',
                          labelStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: _submitKegiatan,
                style: ElevatedButton.styleFrom(
                 backgroundColor: Colors.white,
                ),
                child: Text('Submit'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => KegiatanAnakPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:  Colors.white,
                ),
                child: Text('Lihat Kegiatan Anak'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}