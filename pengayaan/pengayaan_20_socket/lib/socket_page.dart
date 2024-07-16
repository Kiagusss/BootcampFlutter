import 'package:flutter/material.dart';
import 'package:pengayaan_20_socket/socket_helper.dart';

class MateriSocketIO extends StatefulWidget {
  @override
  MateriSocketIOState createState() => MateriSocketIOState();
}

class MateriSocketIOState extends State<MateriSocketIO> {
  /// Inisialisasikan Socket dari Socket Helper
  final socket = SocketHelper();

  /// Jalankan fungsi connect socket
  @override
  void initState() {
    super.initState();
    socket.connectAndListen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Materi Socket IO',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: StreamBuilder<String>(
                stream: socket.getResponse,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text('Data dari Socket : ${snapshot.data}');
                  } else {
                    return const Text('Menunggu Data dari Socket');
                  }
                },
              ),
            ),
            /// Tombol untuk panggil event [msg]
            ElevatedButton(
              onPressed: () {
                socket.callMsgEvent();
              },
              child: const Text('Panggil Event'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    socket.dispose();
    super.dispose();
  }
}
