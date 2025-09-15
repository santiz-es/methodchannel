import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class NativeViewModel {
  static const _channel = MethodChannel('com.example.methodchannel/native');

  Future<void> showToast(String message) async {
    await _channel.invokeMethod('showToast', {'message': message});
  }

  Future<void> showAlert(String title, String message) async {
    await _channel.invokeMethod('showAlert', {
      'title': title,
      'message': message,
    });
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MethodChannel Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final viewModel = NativeViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MethodChannel Demo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                viewModel.showToast('Hola desde Flutter!');
              },
              child: const Text('Mostrar Toast'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                viewModel.showAlert(
                  'Título nativo',
                  'Este AlertDialog viene del código nativo Android',
                );
              },
              child: const Text('Mostrar AlertDialog'),
            ),
          ],
        ),
      ),
    );
  }
}
