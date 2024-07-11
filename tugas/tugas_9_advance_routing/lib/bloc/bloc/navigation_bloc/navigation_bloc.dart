import 'package:bloc/bloc.dart';

class DrawerCubit extends Cubit<int> {
  DrawerCubit() : super(0);

  void selectItem(int index) {
    emit(index);
  }
}

class BottomNavCubit extends Cubit<int> {
  BottomNavCubit() : super(0);

  void updateIndex(int index) {
    emit(index);
  }
}
