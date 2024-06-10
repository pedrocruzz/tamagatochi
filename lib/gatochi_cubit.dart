import 'package:flutter_bloc/flutter_bloc.dart';

class ImageCubit extends Cubit<String> {
  ImageCubit() : super('../assets/ferro.png'); // Caminho da imagem inicial

  void changeImage(String newPath) {
    emit(newPath);
  }
}
