import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'gatochi_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => ImageCubit(),
        child: ImageChangerPage(),
      ),
    );
  }
}

class ImageChangerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trocar Imagem com Bloc Cubit'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<ImageCubit, String>(
              builder: (context, imagePath) {
                return Image.asset(imagePath);
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Altere o caminho da imagem ao clicar no botão
                context.read<ImageCubit>().changeImage('../assets/diamante.png');
              },
              child: Text('Trocar Imagem'),
            ),
          ],
        ),
      ),
    );
  }
}
