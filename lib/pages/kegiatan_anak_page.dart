import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myapp/providers/app_providers.dart';

class KegiatanAnakPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final activities = Provider.of<AppProvider>(context).activities;

    return Scaffold(
      appBar: AppBar(
        title: Text('Kegiatan Anak'),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 236, 234, 238), Colors.purple],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.builder(
          itemCount: activities.length,
          itemBuilder: (context, index) {
            final activity = activities[index];
            return Card(
              elevation: 5,
              margin: EdgeInsets.all(16),
              child: ListTile(
                title: Text(
                  activity.name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  activity.description,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}