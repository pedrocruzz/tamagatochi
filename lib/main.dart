import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tamagatochi/gatochi_cubit.dart';
import 'package:tamagatochi/pages/tamagatochi_main_page.dart';
import 'package:tamagatochi/transition_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => GatochiCubit()),
        BlocProvider(create: (_) => TransitionCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TamagatochiMainPage(),
      ),
    );
  }
}