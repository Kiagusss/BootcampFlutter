import 'dart:async';

class MessageStream {
  Stream<String> messageStream(String pesan) async* {
    yield pesan;
  }
}

class MessagePrinter {
  final MessageStream _messageStream;

  MessagePrinter(this._messageStream);

  void printMessage(String message) {
    _messageStream.messageStream(message).listen((value) {
      
      print(value);
    }).onDone(() {
      print("Stream Selesai");
    });
  
  }
}

void main() {
  final messageStream = MessageStream();

  final messagePrinter = MessagePrinter(messageStream);

  messagePrinter.printMessage("Hello, World!");
  messagePrinter.printMessage("Dart is awesome!");
  messagePrinter.printMessage("Streams are powerful!");
  
}
