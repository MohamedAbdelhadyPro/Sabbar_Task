import 'package:oktoast/oktoast.dart';

class ToastM {
  /// Bottom Toast Message
  static show(String message) {
    showToast(message, position: ToastPosition.bottom);
  }

  /// Center Toast Message
  static showCenter(String message) {
    showToast(message, position: ToastPosition.center);
  }
}
