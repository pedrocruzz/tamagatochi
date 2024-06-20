import 'dart:async';
import 'package:flutter/material.dart';

class SleepProvider extends ChangeNotifier {
  double _sleep = 50.0;
  Timer? _timer;

  SleepProvider() {
    _startTimer();
  }

  double get sleep => _sleep;

  void increaseSleep(double amount) {
    _sleep = (_sleep + amount).clamp(0.0, 100.0);
    notifyListeners();
  }

  void decreaseSleep(double amount) {
    _sleep = (_sleep - amount).clamp(0.0, 100.0);
    notifyListeners();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(minutes: 1), (timer) {
      decreaseSleep(25.0);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}