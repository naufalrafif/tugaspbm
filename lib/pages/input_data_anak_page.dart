import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myapp/models/child.dart';
import 'package:myapp/providers/app_providers.dart';

class InputDataAnakPage extends StatefulWidget {
  @override
  _InputDataAnakPageState createState() => _InputDataAnakPageState();
}

class _InputDataAnakPageState extends State<InputDataAnakPage> {
  final TextEditingController _namaAnakController = TextEditingController();
  final TextEditingController _umurAnakController = TextEditingController();

  void _submitDataAnak() {
    final String nama = _namaAnakController.text;
    final int umur = int.parse(_umurAnakController.text);

    if (nama.isNotEmpty && umur > 0) {
      Provider.of<AppProvider>(context, listen: false)
          .addChild(Child(name: nama, age: umur));
      _namaAnakController.clear();
      _umurAnakController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Data Anak'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _namaAnakController,
              decoration: InputDecoration(labelText: 'Nama Anak'),
            ),
            TextField(
              controller: _umurAnakController,
              decoration: InputDecoration(labelText: 'Umur'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitDataAnak,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
