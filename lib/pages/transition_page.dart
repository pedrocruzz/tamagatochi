import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tamagatochi/transition_cubit.dart';


class TransitionPage extends StatefulWidget {
  @override
  _TransitionPageState createState() => _TransitionPageState();
}

class _TransitionPageState extends State<TransitionPage> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(Duration(seconds: 4), () {
      Navigator.pop(context);
    });
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<TransitionCubit, String>(
          builder: (context, imagePath) {
            return Center(
              child: Image(image: AssetImage(imagePath), fit: BoxFit.cover, width: 100, height: 100),
            );
          },
        )
    );
  }
}