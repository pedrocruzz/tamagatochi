import 'dart:async';

import 'package:flutter/material.dart';

class BathProvider extends ChangeNotifier {
  double _bath = 50;
  Timer? _timer;

  BathProvider() {
    _startTimer();
  }

  double get bath => _bath;

  void increaseBath(double amount) {
    _bath = (_bath + amount).clamp(0.0, 100.0);
    notifyListeners();
  }

  void decreaseBath(double amount) {
    _bath = (_bath - amount).clamp(0.0, 100.0);
    notifyListeners();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(minutes: 1), (timer) {
      decreaseBath(25.0);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
