void main() async{
  print("Ready. Sing");
  await fetchData(line1(), 5000);
  await fetchData(line2(), 3000);
  await fetchData(line3(), 2000);
  await fetchData(line4(), 1000);
 
}


Future<void> fetchData(String message, int delay) async {
  await Future.delayed(Duration(milliseconds: delay));
  print(message);
}

String line1() {
  return "pernahkah Kau Merasa";
}

String line2() {
  return "pernahkah Kau Merasa";
}

String line3() {
  return "pernahkah Kau Merasa";
}

String line4() {
  return "Hatimu hampa, pernahkah kau merasa hatimu kosong....";
}
