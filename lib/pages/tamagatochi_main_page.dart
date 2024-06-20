import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tamagatochi/pages/tamagatochi_status_page.dart';
import 'package:tamagatochi/theme/theme.dart';
import 'package:tamagatochi/transition_cubit.dart';
import 'package:tamagatochi/providers/hunger_provider.dart';
import 'package:tamagatochi/providers/bath_provider.dart';
import 'package:tamagatochi/providers/sleep_provider.dart';
import '../gatochi_cubit.dart';
import 'transition_page.dart';

class TamagatochiMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: TamagatochiTheme.deepPurple,
          title: Text('TAMAGATOCHI', style: TamagatochiTheme.appBarTitleStyle),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Image.asset("assets/patinha.png"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TamagatochiStatusPage()),
                );
              },
            ),
          ],
        ),
        body: Container(
          color: Colors.black87,
          child: Center(
            child: Expanded(child: BlocBuilder<GatochiCubit, String>(
              builder: (context, imagePath) {
                return Image(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                    width: 300,
                    height: 300);
              },
            )),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: TamagatochiTheme.deepPurple,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            ElevatedButton(
              child: Image.asset("assets/home.png",
                  height: 30, width: 30, fit: BoxFit.cover),
              onPressed: () {
                context
                    .read<TransitionCubit>()
                    .changeTransition('assets/transicao-home.gif');
                Navigator.of(context)
                    .push(
                  MaterialPageRoute(
                    builder: (context) => TransitionPage(),
                  ),
                )
                    .then((value) {
                  context
                      .read<GatochiCubit>()
                      .changeGatochi('assets/gatochi.gif');
                });
              },
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                fixedSize: Size(85, 85),
                backgroundColor: TamagatochiTheme.lightPurple,
              ),
            ),
            ElevatedButton(
              child: Image.asset("assets/peixe.png",
                  height: 30, width: 30, fit: BoxFit.cover),
              onPressed: () {
                context
                    .read<TransitionCubit>()
                    .changeTransition('assets/transicao-comer.gif');
                Navigator.of(context)
                    .push(
                  MaterialPageRoute(
                    builder: (context) => TransitionPage(),
                  ),
                )
                    .then((value) {
                  context
                      .read<GatochiCubit>()
                      .changeGatochi('assets/gatochi-comer-bocafechada.gif');

                  // Aumentar o status de fome em 25% usando o Provider
                  context.read<HungerProvider>().increaseHunger(25);
                });
              },
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                fixedSize: Size(85, 85),
                backgroundColor: TamagatochiTheme.regularBlue,
                textStyle: TextStyle(),
              ),
            ),
            ElevatedButton(
              child: Image.asset("assets/banho.png",
                  height: 30, width: 30, fit: BoxFit.cover),
              onPressed: () {
                context
                    .read<TransitionCubit>()
                    .changeTransition('assets/transicao-banho.gif');
                Navigator.of(context)
                    .push(
                  MaterialPageRoute(
                    builder: (context) => TransitionPage(),
                  ),
                )
                    .then((value) {
                  context
                      .read<GatochiCubit>()
                      .changeGatochi('assets/gatochi-banho.gif');

                  context.read<BathProvider>().increaseBath(25);
                });
              },
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                fixedSize: Size(85, 85),
                backgroundColor: TamagatochiTheme.regularPurple,
              ),
            ),
            ElevatedButton(
              child: Image.asset("assets/dormir.png",
                  height: 30, width: 30, fit: BoxFit.cover),
              onPressed: () {
                context
                    .read<TransitionCubit>()
                    .changeTransition('assets/transicao-dormir.gif');
                Navigator.of(context)
                    .push(
                  MaterialPageRoute(
                    builder: (context) => TransitionPage(),
                  ),
                )
                    .then((value) {
                  context
                      .read<GatochiCubit>()
                      .changeGatochi('assets/gatochi-dormindo.gif');
                  context.read<SleepProvider>().increaseSleep(25);
                });
              },
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                fixedSize: Size(85, 85),
                backgroundColor: TamagatochiTheme.lightBlue,
              ),
            ),
          ]),
        ));
  }
}
