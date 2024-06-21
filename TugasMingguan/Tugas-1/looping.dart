import 'dart:io';

void main() {
  loopingPertama();
  loopingKedua();
  loopingDenganFor();
  loopingPersegiPanjang();
  loopingTangga();
}

// 1.Looping menggunakan While
void loopingPertama() {
  print("LOOPING PERTAMA");
  int i = 2;
  while (i <= 20) {
    print("$i - I love coding");
    i += 2;
  }
}

void loopingKedua() {
  print("LOOPING KEDUA");
  int i = 20;
  while (i >= 2) {
    print("$i - I will become a mobile developer");
    i -= 2;
  }
}

// 2. Looping Menggunakan For

void loopingDenganFor() {
  for (int i = 1; i <= 20; i++) {
    if (i % 2 != 0 && i % 3 == 0) {
      // Angka ganjil dan kelipatan 3
      print("$i - I Love Coding");
    } else if (i % 2 == 0) {
      // Angka genap
      print("$i - Berkualitas");
    } else if (i % 2 != 0) {
      // Angka ganjil
      print("$i - Santai");
    }
  }
}

// 3. Membuat Persegi Panjang #
void loopingPersegiPanjang() {
  int lebar = 8;
  int tinggi = 4;

  for (int i = 0; i < tinggi; i++) {
    for (int j = 0; j < lebar; j++) {
      stdout.write("#");
    }
    print("");
  }
}

// 4. Membuat Tangga
void loopingTangga() {
  int tinggi = 7;

  int baris = 1;
  while (baris <= tinggi) {
    int kolom = 1;
    while (kolom <= baris) {
      stdout.write("#");
      kolom++;
    }
    print("");
    baris++;
  }
}
