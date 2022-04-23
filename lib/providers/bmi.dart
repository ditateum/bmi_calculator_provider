import 'package:flutter/material.dart';

class BmiProvider with ChangeNotifier {
  double _height = 150;
  double _weight = 40;
  double _age = 20;
  double _total = 0.0;
  bool _gender = false;

  bool get gender {
    return _gender;
  }

  void chooseGender() {
    _gender = !_gender;
    notifyListeners();
  }

  double get height {
    return _height;
  }

  void setHeight(double newValue) {
    _height = newValue;
    notifyListeners();
  }

  double get weight {
    return _weight;
  }

  void addWeight() {
    _weight += 1;
    notifyListeners();
  }

  void minusWeight() {
    if (_weight == 0) {
      _weight = _weight;
    } else {
      _weight -= 1;
    }
    notifyListeners();
  }

  double get age {
    return _age;
  }

  void addAge() {
    _age += 1;
    notifyListeners();
  }

  void minusAge() {
    if (_age == 0) {
      _age = _age;
    } else {
      _age -= 1;
    }
    notifyListeners();
  }

  double get calculateBmi {
    _total = _weight / ((_height / 100) * (_height / 100));
    return _total;
  }

  String get categoryBmi {
    if (_total > 40) {
      return 'Obese Class III';
    } else if ((_total > 35) && (_total <= 40)) {
      return 'Obese Class II';
    } else if ((_total > 30) && (_total <= 35)) {
      return 'Obese Class I';
    } else if ((_total > 25) && (_total <= 30)) {
      return 'Overweight';
    } else if ((_total > 18.5) && (_total <= 25)) {
      return 'Normal';
    } else if ((_total > 17) && (_total <= 18.5)) {
      return 'Mild Thinnes';
    } else if ((_total >= 16) && (_total < 17)) {
      return 'Moderate Thinness';
    } else {
      return 'Severe Thinness';
    }
  }
}
