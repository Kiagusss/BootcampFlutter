void main(){
  print("Hasil Sebelumnya");
 delayedPrint("Hasil String", 1000);
  print("Hasil Berikutnya");

  
}

// 1. 

Future<void> delayedPrint(String message, int delay) async {
  await Future.delayed(Duration(milliseconds: delay));
  print(message);
}




