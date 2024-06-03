import 'package:flutter/material.dart';
import 'package:myapp/models/activity.dart';
import 'package:myapp/models/child.dart';

class AppProvider with ChangeNotifier {
  List<Activity> _activities = [];
  List<Child> _children = [];

  List<Activity> get activities => _activities;
  List<Child> get children => _children;

  void addActivity(Activity activity) {
    _activities.add(activity);
    notifyListeners();
  }

  void addChild(Child child) {
    _children.add(child);
    notifyListeners();
  }
}
