// 1. A. Integer (int): Integer adalah tipe data yang mewakili bilangan bulat tanpa bagian desimal. Mereka dapat berupa bilangan positif atau negatif. Contoh: 42, -7, 1000.
// Float (double): Double adalah tipe data yang mewakili bilangan dengan bagian desimal. Mereka dapat digunakan untuk merepresentasikan bilangan dengan presisi lebih tinggi. Contoh: 3.14, -0.001, 2.71828.

B. void main() {
  print(nama);
}

String nama = "Kiagus"; //String Biasa
String? name = "Kiagus2"; //Nullable String
String? nama2 = nama2 = null ?? "Bukan Kiagus"; //Jika data kosong, akan memberikan nilai default Bukan Kiagus


2.void main() {
  var word = 'dart';
  var second = 'is';
  var third = 'awesome';
  var fourth = 'and';
  var fifth = 'I';
  var sixth = 'love';
  var seventh = 'it!';

  var sentence =
      '${word[0].toUpperCase()}${word.substring(1)} $second $third $fourth $fifth $sixth $seventh';

  print(sentence);
}


3. void main() {
  var sentence = "I am going to be Flutter Developer";

  var words = sentence.split(' ');

  var exampleFirstWord = words[0];
  var secondWord = words[1];
  var thirdWord = words[2];
  var fourthWord = words[3];
  var fifthWord = words[4];
  var sixthWord = words[5];
  var seventhWord = words[6];

  print('First Word: ' + exampleFirstWord);
  print('Second Word: ' + secondWord);
  print('Third Word: ' + thirdWord);
  print('Fourth Word: ' + fourthWord);
  print('Fifth Word: ' + fifthWord);
  print('Sixth Word: ' + sixthWord);
  print('Seventh Word: ' + seventhWord);
  print(sentence);
}


4. import 'dart:io';

void main() {
  // Minta pengguna untuk memasukkan nama depan
  stdout.write('Masukkan nama depan: ');
  String firstName = stdin.readLineSync() ?? '';

  // Minta pengguna untuk memasukkan nama belakang
  stdout.write('Masukkan nama belakang: ');
  String lastName = stdin.readLineSync() ?? '';

  // Gabungkan nama depan dan nama belakang
  String fullName = '$firstName $lastName';

  // Cetak nama lengkap
  print('Nama lengkap anda adalah: $fullName');
}

5. void main() {
  jumlah();
}

void jumlah() {
  int a = 5;
  int b = 10;

  print(a * b);
  print(a + b);
  print(a - b);
  print(a / b);
}
 
