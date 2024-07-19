import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:pengayaan_23_camera/camera_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BarcodeScannerPage()));
              },
              child: const Text('Scan Barcode'),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CameraPage()));
                },
                child: const Text("Go to Camera Page"))
          ],
        ),
      ),
    );
  }
}

class BarcodeScannerPage extends StatefulWidget {
  const BarcodeScannerPage({super.key});

  @override
  _BarcodeScannerPageState createState() => _BarcodeScannerPageState();
}

class _BarcodeScannerPageState extends State<BarcodeScannerPage> {
  String barcode = '';
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Barcode Scanner"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 300,
              height: 100,
              child: MobileScanner(
                onDetect: (BarcodeCapture barcodeCapture) async {
                  final List<Barcode> barcodes = barcodeCapture.barcodes;
                  if (barcodes.isNotEmpty) {
                    setState(() {
                      isLoading = true;
                    });
                    await Future.delayed(const Duration(seconds: 1));
                    setState(() {
                      barcode =
                          barcodes.first.rawValue ?? 'Failed to scan barcode';
                      isLoading = false;
                    });
                  }
                },
              ),
            ),
            const SizedBox(height: 20),
            isLoading
                ? const CircularProgressIndicator()
                : Text('Scan result: $barcode'),
          ],
        ),
      ),
    );
  }
}
