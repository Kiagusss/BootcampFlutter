void main() async{
  print("Hasil Sebelumnya");
  await fetchData("Hasil String", 1000);
  print("Hasil Berikutnya");
}


Future<void> fetchData(String message, int delay) async {
  await Future.delayed(Duration(milliseconds: delay));
  print(message);
}

