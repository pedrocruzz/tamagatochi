import 'package:flutter_bloc/flutter_bloc.dart';

class GatochiCubit extends Cubit<String> {
  GatochiCubit() : super('../assets/gatochi.gif'); // Caminho da imagem inicial

  void changeImage(String newImagePath) {
    emit(newImagePath);
  }
}
