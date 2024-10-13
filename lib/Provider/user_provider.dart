import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String _gender = '';
  int _age = 0;
  String _height = '';
  String _weight = '';
  String _goal = '';
  String _activityLevel = '';

  String get gender => _gender;
  int get age => _age;
  String get height => _height;
  String get weight => _weight;
  String get goal => _goal;
  String get activityLevel => _activityLevel;

  void setGender(String _gender) {
    _gender = gender;
  }
  void setAge(int _age) {
    _age = age;
  }

  void setHeight(String _height) {
    _height = height;
  }
  void setWeight(String _weight) {
    _weight = weight;
  }
  void setGoal(String _goal) {
    _goal = goal;
  }
  void setActivityLevel(String _activityLevel) {
    _activityLevel = activityLevel;
  }
}
