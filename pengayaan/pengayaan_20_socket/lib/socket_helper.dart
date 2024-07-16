import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as socket_io;

class SocketHelper {
  /// Socket
  socket_io.Socket? socket;

  /// Response Dari Socket
  final _socketResponse = StreamController<String>();

  /// Tambahkan value Response ke Stream
  void Function(String) get addResponse => _socketResponse.sink.add;

  /// Response Stream dari Socket
  Stream<String> get getResponse => _socketResponse.stream;

  /// Connect ke Socket
  void connectAndListen() {
    /// Close socket sebelumnya (Jika ada)
    socket?.close();

    /// Connect ke socket
    socket = socket_io.io(
      'http://localhost:3001', // Masukkan url dan port dari socket kita.
      socket_io.OptionBuilder().setTransports(['websocket']).build(),
    );

    /// Callback yang akan dijalankan ketika socket terhubung
    socket?.onConnect((_) => debugPrint('Socket Connected'));

    /// Ketika event dijalankan dari Server, data akan ditambahkan ke Stream
    socket?.on('msg', (data) {
      /// Tambahkan response ke Stream
      addResponse(data);
    });

    /// Callback yang akan dijalankan ketika disconnect
    socket?.onDisconnect((_) => debugPrint('disconnect'));
  }

  /// Panggil event msg ke Server
  void callMsgEvent() {
    socket?.emit('msg', 'Data dari event ${Random().nextInt(999)}');
  }

  /// Method untuk menutup koneksi socket
  void dispose() {
    socket?.close();
    _socketResponse.close();
  }
}
