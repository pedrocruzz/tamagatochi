import 'dart:async';
import 'package:flutter/material.dart';

class HungerProvider extends ChangeNotifier {
  double _hunger = 50.0;
  Timer? _timer;

  HungerProvider() {
    _startTimer();
  }

  double get hunger => _hunger;

  void increaseHunger(double amount) {
    _hunger = (_hunger + amount).clamp(0.0, 100.0);
    notifyListeners();
  }

  void decreaseHunger(double amount) {
    _hunger = (_hunger - amount).clamp(0.0, 100.0);
    notifyListeners();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(minutes: 1), (timer) {
      decreaseHunger(25.0);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
