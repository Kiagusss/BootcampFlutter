part of 'users_bloc.dart';

sealed class UsersEvent extends Equatable {
  const UsersEvent();

  @override
  List<Object?> get props => [];
}

class UsersFetch extends UsersEvent {}

class UsersAdded extends UsersEvent {
  final String nama;
  final int umur;

  const UsersAdded({required this.nama, required this.umur});

  @override
  List<Object> get props => [nama, umur];
}

class UsersUpdated extends UsersEvent {
  final List<Map<String, dynamic>> users;

  const UsersUpdated({required this.users});

  @override
  List<Object> get props => [users];
}

class UsersDeleted extends UsersEvent {
  final int id;

  const UsersDeleted({required this.id});

  @override
  List<Object> get props => [id];
}
