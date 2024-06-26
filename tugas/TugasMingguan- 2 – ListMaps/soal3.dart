
void main(){
  var input = [
  ["001", "Roman Alamsyah", "Bandar Lampung", "21/05/1989", "Membaca"],
  ["002", "Dika Sembiring", "Medan", "10/10/1992", "Bermain Gitar"],
  ["003", "Winona", "Ambon", "25/12/1965", "Memasak"],
  ["004", "Bintang Senjaya", "Martapura", "6/4/1970", "Berkebun"],
];

printData(input);
}

void printData(List<List<String>> input) {
  for (List<String> data in input) {
    print("ID: ${data[0]}");
    print("Nama: ${data[1]}");
    print("Tempat Lahir: ${data[2]}");
    print("Tanggal Lahir: ${data[3]}");
    print("Hobi: ${data[4]}");
    print("---------------");
  }
}