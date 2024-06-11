import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../gatochi_cubit.dart';

class TamagatochiMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TAMAGATOCHI',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<GatochiCubit, String>(
              builder: (context, imagePath) {
                return Image.asset(imagePath);
              },
            ),
            SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              ElevatedButton(
                child: Icon(
                  Icons.home,
                  color: Colors.white,
                  size: 30,

                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => LoadingScreen(),
                    ),
                  ).then((value) {
                    context.read<GatochiCubit>().changeImage('../assets/gatochi.gif');
                  });
                },
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(20),
                  backgroundColor: Colors.black,
                ),
              ),
              ElevatedButton(
                child: Icon(
                  Icons.fastfood_outlined,
                  color: Colors.white,
                  size: 30,

                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => LoadingScreen(),
                    ),
                  ).then((value) {
                    context.read<GatochiCubit>().changeImage('../assets/gatochi-comer-bocafechada.gif');
                  });
                },
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(20),
                  backgroundColor: Colors.black,
                ),
              ),
              ElevatedButton(
                child: Icon(
                  Icons.shower,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => LoadingScreen(),
                    ),
                  ).then((value) {
                    context.read<GatochiCubit>().changeImage('../assets/gatochi-banho.gif');
                  });
                },
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(20),
                  backgroundColor: Colors.black,
                ),
              ),
              ElevatedButton(
                child: Icon(
                  Icons.bedtime,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => LoadingScreen(),
                    ),
                  ).then((value) {
                    context.read<GatochiCubit>().changeImage('../assets/gatochi-dormindo.gif');
                  });
                },
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(20),
                  backgroundColor: Colors.black,
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(Duration(seconds: 5), () {
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
      body: Center(
        child: Image.asset("../assets/transicao-dormir.gif"),
      ),
    );
  }
}