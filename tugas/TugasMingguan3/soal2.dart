import 'dart:async';

void main() async {
  var h = Human();
  print("luffy");
  print("Zoro");
  print("Killer");
  print(h.name); 
  
  await h.getData();  
  print(h.name);
}

class Human {
  String name = "nama character one piece";

  Future<void> getData() async {
    await fetchData(name, 3000);
    name = "hilmy";
    print("get Data [Done]");
  }
}

Future<void> fetchData(String message, int delay) async {
  await Future.delayed(Duration(milliseconds: delay));
  print(message);
}
