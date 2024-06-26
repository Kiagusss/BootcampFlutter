void main(){
  print("Hasil Sebelumnya");
 fetchData("Hasil String", 1000);
  print("Hasil Berikutnya");

  
}

// 1. 

Future<void> fetchData(String message, int delay) async {
  await Future.delayed(Duration(milliseconds: delay));
  print(message);
}




