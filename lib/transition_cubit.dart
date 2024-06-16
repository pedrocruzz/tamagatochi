import 'package:flutter_bloc/flutter_bloc.dart';

class TransitionCubit extends Cubit<String> {
  TransitionCubit() : super('');

  void changeTransition(String newImagePath) {
    emit(newImagePath);
  }
}
