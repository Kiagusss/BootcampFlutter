import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/auth_bloc/auth_bloc.dart';
import '../../bloc/users_bloc/users_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController namaController = TextEditingController();
  int selectedUmur = 18;
  int? editingUserId;

  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(UsersFetch());
  }

  void _editUser(Map<String, dynamic> user) {
    setState(() {
      namaController.text = user['nama'];
      selectedUmur = user['umur'];
      editingUserId = user['id'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'CRUD',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state.user != null) {
                return Center(
                  child: Text(
                    'Welcome, ${state.user!.email ?? 'User'}!',
                    style: const TextStyle(fontSize: 24),
                  ),
                );
              }

              return const Center(
                child: Text(
                  'No user logged in',
                  style: TextStyle(fontSize: 24),
                ),
              );
            },
          ),
          Expanded(
            child: Padding(
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
                      if (editingUserId != null) {
                        context.read<UserBloc>().add(
                              UsersUpdatedData(
                                id: editingUserId!,
                                nama: namaController.text,
                                umur: selectedUmur,
                              ),
                            );
                      } else {
                        context.read<UserBloc>().add(
                              UsersAdded(
                                nama: namaController.text,
                                umur: selectedUmur,
                              ),
                            );
                      }
                      setState(() {
                        namaController.clear();
                        selectedUmur = 18;
                        editingUserId = null;
                      });
                    },
                    child: Text(editingUserId != null
                        ? "Update User"
                        : "Kirim Ke Firestore"),
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
                                  icon: const Icon(Icons.edit),
                                  onPressed: () {
                                    _editUser(data);
                                  },
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
          ),
        ],
      ),
    );
  }
}
