import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pengayaan_24_firebase/bloc/users_bloc/users_bloc.dart';

class FirestorePage extends StatefulWidget {
  const FirestorePage({super.key});

  @override
  State<FirestorePage> createState() => _FirestorePageState();
}

class _FirestorePageState extends State<FirestorePage> {
  final TextEditingController namaController = TextEditingController();
  int selectedUmur = 18;

  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(UsersFetch());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Materi Cloud Firestore',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Flexible(
                  flex: 2,
                  child: DropdownButtonFormField<int>(
                    value: selectedUmur,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    items: List.generate(
                      100,
                      (index) => DropdownMenuItem(
                        value: index + 1,
                        child: Text('${index + 1}'),
                      ),
                    ),
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          selectedUmur = value;
                        });
                      }
                    },
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        labelText: 'Nama',
                      ),
                      controller: namaController,
                    ),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                context.read<UserBloc>().add(
                      UsersAdded(
                        nama: namaController.text,
                        umur: selectedUmur,
                      ),
                    );
              },
              child: const Text("Kirim Ke firestore"),
            ),
            BlocBuilder<UserBloc, UsersState>(
              builder: (context, state) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.users.length,
                    itemBuilder: (context, index) {
                      final data = state.users[index];
                      return Row(
                        children: [
                          Expanded(
                            child: Text(
                              "${index + 1}. Id: ${data['id']} Umur: ${data['umur']}, Nama: ${data['nama']}",
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              context.read<UserBloc>().add(
                                    UsersDeleted(id: data['id']),
                                  );
                            },
                          ),
                        ],
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
