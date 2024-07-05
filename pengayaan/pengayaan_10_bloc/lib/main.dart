import 'package:flutter/material.dart';
import 'package:pengayaan_10_bloc/logic/counter_bloc/bloc/user_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pengayaan_10_bloc/screens/materi_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Bloc",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Bloc"),
        ),
        body: const MateriBloc(),
      ),
    );
  }
}
