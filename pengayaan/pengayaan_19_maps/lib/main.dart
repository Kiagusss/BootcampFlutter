import 'package:easy_scaffold/easy_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

// import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pengayaan_19_maps/flutter_map.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Scaffold(
        body: MyMap(
          locations: [
            LatLng(37.7749, -122.4194),
            LatLng(37.7749, -122.4194),
          ],
        ),
      ),
    );
  }
}

// class GmapsPage extends StatefulWidget {
//   const GmapsPage({super.key});

//   @override
//   State<GmapsPage> createState() => _GmapsPageState();
// }

// class _GmapsPageState extends State<GmapsPage> {
//   GoogleMapController? _controller;
//   final Set<Marker> _markers = {};

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Google Maps Example'),
//       ), // AppBar
//       body: GoogleMap(
//         initialCameraPosition: const CameraPosition(
//           target: LatLng(37.7749, -122.4194), // San Francisco, CA
//           zoom: 12,
//         ), // CameraPosition
//         markers: _markers,
//         onMapCreated: (GoogleMapController controller) {
//           _controller = controller;
//           // Tambahkan marker ke peta saat peta sudah dibuat
//           setState(() {
//             _markers.add(
//               Marker(
//                 markerId: const MarkerId('1'),
//                 position: const LatLng(37.7749, -122.4194),
//                 onTap: () {
//                   // Handler untuk menampilkan info window saat marker di-klik
//                   _showInfoWindow();
//                 },
//               ),
//             );
//           });
//         },
//       ), // GoogleMap
//     ); // Scaffold
//   }

//   // Method untuk menampilkan info window
//   void _showInfoWindow() {
//     _controller?.showMarkerInfoWindow(const MarkerId('1'));
//   }
// }
