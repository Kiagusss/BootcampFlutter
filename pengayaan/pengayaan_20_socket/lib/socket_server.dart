import 'package:flutter/material.dart';
import 'package:socket_io/socket_io.dart';

class AppSocketServer {
  // Dart server
  static Server io = Server();

  void initialize() {
    /// Jika user terkoneksi pada server kita
    io.on('connection', (client) {
      /// Print Message
      debugPrint('connection default namespace');

      /// Ketika user mengirimkan event [msg].
      /// Server akan merespon langsung.
      client.on('msg', (data) {
        client.emit('msg', "OK - $data");
      });
    });

    /// Kita jalankan server di port 3001
    io.listen(3001);
  }
}
