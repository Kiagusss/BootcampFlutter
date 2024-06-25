
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