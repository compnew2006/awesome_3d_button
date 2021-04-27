import 'package:flutter/foundation.dart';

class ButtonStateNotifier extends ChangeNotifier {
  late double xElevation;
  late double yElevation;

  double topPosition = 0;

  ButtonStateNotifier(this.yElevation) {
    xElevation = yElevation + yElevation * 0.1;
    if (!kIsWeb) xElevation += 10;
  }

  void triggerButtonDown() {
    topPosition = yElevation;
    xElevation = 0;
    notifyListeners();
  }

  void triggerButtonUp() {
    Future.delayed(const Duration(milliseconds: 100), () {
      topPosition = 0;
      xElevation = yElevation + yElevation * 0.1 + 10;
      notifyListeners();
    });
  }

  void triggerOnMouseHover() {
    topPosition = 0;
    xElevation = yElevation + yElevation * 0.1 + 10;
    notifyListeners();
  }

  void triggerOnMouseExit() {
    topPosition = 5;
    xElevation = yElevation + yElevation * 0.1;
    notifyListeners();
  }
}
