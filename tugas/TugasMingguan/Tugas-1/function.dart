import 'dart:io';

void main() {
  teriak();
  var hasilKali = kalikan(num1, num2);
  print(hasilKali);

  // Memanggil fungsi introduce() dengan variabel name, age, address, dan hobby sebagai argumen
  var perkenalan = introduce(name, age, address, hobby);
  print(perkenalan);
  // Faktorial
  factorial();
}

// 1. mengembalikan nilai teriak()

void teriak() {
  print("Halo Sanbers!");
}

// 2. Memngembalikan nilai kalikan()

kalikan(int num1, int num2) {
  return num1 * num2;
}

var num1 = 12;
var num2 = 4;

// 3. Function Introduce
String introduce(name, age, address, hobby) {
  return "Nama saya $name, umur saya $age tahun, alamat saya di $address, dan saya punya hobby yaitu $hobby!";
}

var name = "Agus";
var age = 30;
var address = "Jln. Malioboro, Yogyakarta";
var hobby = "Gaming";

// 4. Membuat Faktorial

void factorial() {
  print("Masukkan Angka:");
  String? input = stdin.readLineSync();

  if (input != null) {
    int angka = int.tryParse(input) ??
        0; 

    int faktorial(int n) {
      if (n <= 0) {
        return 1;
      } else {
        int result = 1;
        for (int i = 1; i <= n; i++) {
          result *= i;
        }
        return result;
      }
    }

    int hasil = faktorial(angka);
    print("Faktorial dari $angka adalah $hasil");
  } else {
    print("Input tidak valid.");
  }
}
