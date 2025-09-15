import 'package:flutter/services.dart';

class NativeViewModel {
  static const _channel = MethodChannel('com.exemplo/native');

  Future<void> mostrarToast(String mensagem) async {
    await _channel.invokeMethod('mostrarToast', {'mensagem': mensagem});
  }

  Future<void> mostrarAlertDialog(String titulo, String mensagem) async {
    await _channel.invokeMethod('mostrarAlertDialog', {
      'titulo': titulo,
      'mensagem': mensagem,
    });
  }
}
