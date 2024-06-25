void main() {
  // Soal 1.
  print("");
  print("===== Soal 1 =====");
  print("");
  Siswa siswa1 = Siswa("asep", 20, 30013);
  Siswa siswa2 = Siswa("Udin", 80, 30014);
  siswa1.tampilkanInformasi();
  print("============");
  siswa2.tampilkanInformasi();
  // Soal 2.
  print("");
  print("===== Soal 2 =====");
  print("");
  PersegiPanjang persegiPanjang1 = PersegiPanjang(20, 30);
  persegiPanjang1.hitungLuas();
  // Soal 3. 
    print("");
    print("===== Soal 3 =====");
    print("");
  persegiPanjang1.hitungKeliling();
  Buku buku1 = Buku("Filosofi Teras", "Agus", 2024);
  buku1.tampilkanInformasi();
  // Soal 4. 
    print("");
    print("===== Soal 4 =====");
    print("");
  Mobil mobil1 = Mobil("Toyota", "Camry", 2020);

  mobil1.nyalakanMesin();
  mobil1.matikanMesin();
  mobil1.matikanMesin();
  mobil1.nyalakanMesin();

  // Soal 5. 
    print("");
    print("===== Soal 5 =====");
    print("");
  Kucing kucing1 = Kucing("Kitty", 2, "Persia");
  kucing1.tampilkanInformasi();
  kucing1.bersuara();
  kucing1.bermain();


}

// 1.
class Siswa {
  final String nama;
  final int nip;
  final num nilai;

  const Siswa(this.nama, this.nilai, this.nip);

  bool cekKelulusan() {
    return nilai > 70;
  }

  void tampilkanInformasi() {
    print("Nama: $nama");
    print("NIP: $nip");
    print("Nilai: $nilai");
    print("Status: ${cekKelulusan() ? "Lulus" : "Tidak Lulus"}");
  }
}

// 2.
class PersegiPanjang {
  final num panjang;
  final num lebar;

  const PersegiPanjang(this.panjang, this.lebar);

  void hitungLuas() {
    print(panjang * lebar);
  }

  void hitungKeliling() {
    print(2 * (panjang + lebar));
  }
}

// 3.
class Buku {
  final String judul;
  final String penulis;
  final int tahunTerbit;

  const Buku(this.judul, this.penulis, this.tahunTerbit);

  void tampilkanInformasi() {
    print(judul);
    print(penulis);
    print(tahunTerbit);
  }
}

class Mobil {
  // Atribut
  String merek;
  String model;
  int tahunProduksi;
  bool mesinMenyala = false;

  Mobil(this.merek, this.model, this.tahunProduksi);
  
  void nyalakanMesin() {
    if (!mesinMenyala) {
      mesinMenyala = true;
      print("Mesin mobil $merek $model Dengan tahun produksi $tahunProduksi sudah menyala.");
    } else {
      print("Mesin mobil $merek $model Dengan tahun produksi $tahunProduksi sudah dalam keadaan menyala.");
    }
  }

  void matikanMesin() {
    if (mesinMenyala) {
      mesinMenyala = false;
      print("Mesin mobil $merek $model Dengan tahun produksi $tahunProduksi sudah dimatikan.");
    } else {
      print("Mesin mobil $merek $model Dengan tahun produksi $tahunProduksi sudah dalam keadaan mati.");
    }
  }
}

// 5.
class Hewan {
  
  String nama;
  int umur;

  
  Hewan(this.nama, this.umur);

 
  void tampilkanInformasi() {
    print("Nama: $nama");
    print("Umur: $umur tahun");
  }

  void bersuara() {
    print("$nama bersuara.");
  }
}

class Kucing extends Hewan {

  String ras;

 
  Kucing(String nama, int umur, this.ras) : super(nama, umur);

 
  
  void tampilkanInformasi() {
    super.tampilkanInformasi();
    print("Ras: $ras");
  }

 
 
  void bersuara() {
    print("$nama mengeong.");
  }
  void bermain() {
    print("$nama sedang bermain.");
  }
}




