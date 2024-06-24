void main() {
  List<int> numbers = [1, 2, 3, 4, 5];
  numbers.forEach((data) => print(data));

  List<String> fruits = ['Apple', 'Banana', 'Orange'];
  fruits.add("Manggo");
  fruits.remove('Banana');
  print(fruits);
  List<int> list1 = [1, 2, 3];
  List<int> list2 = [4, 5, 6];

  List<int> gabungan = [...list1, ...list2];
  print(gabungan);

  Map<String, String> dataDiri = {
  'nama': 'John Doe',
  'alamat': 'Jl. Merdeka No. 123, Jakarta',
  'email': 'johndoe@example.com',
  'phone number': '08123456789'
};

print("Data Diri:");
print("Nama: ${dataDiri['nama']}");
print("Alamat: ${dataDiri['alamat']}");
print("Email: ${dataDiri['email']}");
print("Phone Number: ${dataDiri['phone number']}");

}
