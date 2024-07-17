import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  String text = "Contoh Untuk Widget Test";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Materi Widget Test'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(text),
            const Icon(Icons.home),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    text = "Tombol Ditekan";
                  });
                },
                child: const Text("Tombol"))
          ],
        ),
      ),
    );
  }
}
