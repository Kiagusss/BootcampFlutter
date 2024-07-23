import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'users_event.dart';
part 'users_state.dart';

class UserBloc extends Bloc<UsersEvent, UsersState> {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  StreamSubscription<QuerySnapshot<Map<String, dynamic>>>? streamSubscription;

  UserBloc() : super(const UsersState()) {
    on<UsersFetch>((event, emit) {
      final col = db.collection('users');

      streamSubscription = col.snapshots().listen((data) {
        final users = data.docs.map((e) {
          final userData = e.data();
          userData['id'] = int.tryParse(e.id) ??
              0; 
          return userData;
        }).toList();
        add(UsersUpdated(users: users));
      });
    });

    on<UsersAdded>((event, emit) async {
      final querySnapshot = await db
          .collection('users')
          .orderBy('id', descending: true)
          .limit(1)
          .get();
      int newId = 1;
      if (querySnapshot.docs.isNotEmpty) {
        final maxId = querySnapshot.docs.first['id'];
        newId = maxId + 1;
      }

      await db.collection('users').doc(newId.toString()).set({
        'id': newId,
        'nama': event.nama,
        'umur': event.umur,
      });
    });

    on<UsersUpdated>((event, emit) {
      emit(UsersState(users: event.users));
    });

    on<UsersDeleted>((event, emit) async {
      await db.collection('users').doc(event.id.toString()).delete();
    });
  }

  @override
  Future<void> close() {
    streamSubscription?.cancel();
    return super.close();
  }
}
