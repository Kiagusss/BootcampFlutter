import 'dart:async';

// Kelas untuk mengirimkan pesan melalui sebuah stream
class MessageStream {
  final _controller = StreamController<String>();

  // Getter untuk stream
  Stream<String> get stream => _controller.stream;

  // Method untuk mengirimkan pesan
  void sendMessage(String message) {
    _controller.sink.add(message);
  }

  // Method untuk menutup stream
  void dispose() {
    _controller.close();
  }
}

// Kelas untuk mencetak pesan yang diterima dari stream
class MessagePrinter {
  final MessageStream _messageStream;
  
  MessagePrinter(this._messageStream) {
    // Berlangganan ke stream dan mencetak pesan yang diterima
    _messageStream.stream.listen((message) {
      print('Pesan diterima: $message');
    });
  }
}

void main() {
  // Membuat instance dari MessageStream
  final messageStream = MessageStream();

  // Membuat instance dari MessagePrinter dan berlangganan ke MessageStream
  final messagePrinter = MessagePrinter(messageStream);

  // Mengirim beberapa pesan
  messageStream.sendMessage('Hello, World!');
  messageStream.sendMessage('Dart is awesome!');
  messageStream.sendMessage('Streams are powerful!');

  // Menutup stream setelah beberapa waktu
  Future.delayed(Duration(seconds: 2), () {
    messageStream.dispose();
  });
}
