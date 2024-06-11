import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tamagatochi/pages/TamagatochiMainPage.dart';
import 'gatochi_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => GatochiCubit(),
        child: TamagatochiMainPage(),
      ),
    );
  }
}

