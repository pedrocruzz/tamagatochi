import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:tamagatochi/gatochi_cubit.dart';
import 'package:tamagatochi/pages/tamagatochi_main_page.dart';
import 'package:tamagatochi/transition_cubit.dart';
import 'package:tamagatochi/providers/hunger_provider.dart';
import 'package:tamagatochi/providers/bath_provider.dart';
import 'package:tamagatochi/providers/sleep_provider.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(create: (_) => GatochiCubit()),
        BlocProvider(create: (_) => TransitionCubit()),
        ChangeNotifierProvider(create: (_) => HungerProvider()),
        ChangeNotifierProvider(create: (_) => SleepProvider()),
        ChangeNotifierProvider(create: (_) => BathProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TamagatochiMainPage(),
      ),
    );
  }
}
