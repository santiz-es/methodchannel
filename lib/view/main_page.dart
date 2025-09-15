import 'package:flutter/material.dart';
import '../viewmodel/native_view_model.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});
  final vm = NativeViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MethodChannel MVVM')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => vm.mostrarToast('Olá do Flutter!'),
              child: const Text('Mostrar Toast'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => vm.mostrarAlertDialog(
                'Aviso',
                'Este AlertDialog é nativo Android!',
              ),
              child: const Text('Mostrar AlertDialog'),
            ),
          ],
        ),
      ),
    );
  }
}
