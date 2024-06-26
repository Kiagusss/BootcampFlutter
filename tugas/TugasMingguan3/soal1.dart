void main(List<String> args) {
  final segitiga = Segitiga(0.5, 20.0, 30.0);
  final hitungSegitiga = segitiga.luasSegitiga();
  print(hitungSegitiga);
}

class Segitiga {
  final double alas;
  final double setengah;
  final double tinggi;

  const Segitiga(this.alas, this.setengah, this.tinggi);
  num luasSegitiga() {
    return setengah * alas * tinggi;
  }
}
