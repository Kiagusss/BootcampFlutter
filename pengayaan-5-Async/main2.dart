void main() async{
  print("Hasil Sebelumnya");
  await delayedPrint("Hasil String", 1000);
  print("Hasil Berikutnya");
}


Future<void> delayedPrint(String message, int delay) async {
  await Future.delayed(Duration(milliseconds: delay));
  print(message);
}

