import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pengayaan_10_bloc/services/user_repository.dart';

import '../logic/counter_bloc/bloc/user_bloc.dart';
import '../model/user_mode.dart';

class MateriBloc extends StatefulWidget {
  const MateriBloc({super.key});

  @override
  State<MateriBloc> createState() => _MateriBlocState();
}

class _MateriBlocState extends State<MateriBloc> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(
          create: (BuildContext context) => UserBloc(UserRepository()),
        ),
       
      ],
      child: Scaffold(
        body: blocBody(),
      ),
    );
  }
}

Widget blocBody(){
  return BlocProvider(
    create: (context) => UserBloc(UserRepository() )..add(LoadUserEvent()),
    
    child: BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }if(state is UserErrorState){
          return const Center(child: Text("Erorr"),);
        }if(state is UserLoadedState){
          List <UserModel> userList = state.users;
          return ListView.builder(
            itemCount: userList.length,
            itemBuilder: (_, index){
              return Padding(padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8,), child: Card(
                color:  Theme.of(context).primaryColor,
                child: ListTile(
                  title: Text("${userList[index].firstName} ${userList[index].lastName}", style: const TextStyle(color: Colors.white), ),
                  subtitle: Text("${userList[index].email} ", style: const TextStyle(color: Colors.white), ),
                  leading:  CircleAvatar(
                    backgroundImage: NetworkImage(userList[index].avatar.toString()),
                  ),
                ),
              ),);
            },
            
          );
        }
       return Container();
      },
    ),

  );
}
