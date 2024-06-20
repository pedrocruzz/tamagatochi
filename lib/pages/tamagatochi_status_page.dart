import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tamagatochi/theme/theme.dart';
import 'package:tamagatochi/providers/hunger_provider.dart';
import 'package:tamagatochi/providers/sleep_provider.dart';
import 'package:tamagatochi/providers/bath_provider.dart';
import 'tamagatochi_dead_page.dart';

class TamagatochiStatusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final hungerProvider = Provider.of<HungerProvider>(context);
    final sleepProvider = Provider.of<SleepProvider>(context);
    final bathProvider = Provider.of<BathProvider>(context);

    int zeroCount = 0;
    if (hungerProvider.hunger == 0) zeroCount++;
    if (sleepProvider.sleep == 0) zeroCount++;
    if (bathProvider.bath == 0) zeroCount++;

    if (zeroCount >= 2) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => GatochiDeadPage()),
        );
      });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: TamagatochiTheme.deepPurple,
        title: Text('TAMAGATOCHI', style: TamagatochiTheme.appBarTitleStyle),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: Colors.black87,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Status ',
                            style: TamagatochiTheme.regularTextStyle,
                          ),
                          Image.asset("assets/patinha.png")
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            Card(
              color: Colors.black,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Consumer<HungerProvider>(
                          builder: (context, hungerProvider, child) {
                            return Column(
                              children: [
                                Text(
                                  'Fome: ${hungerProvider.hunger.toStringAsFixed(1)}%',
                                  style: TamagatochiTheme.regularTextStyle,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(25.0),
                                  child: LinearProgressIndicator(
                                    value: hungerProvider.hunger / 100,
                                    valueColor: AlwaysStoppedAnimation(_getStateColor(hungerProvider.hunger)),
                                    minHeight: 60,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                        Consumer<SleepProvider>(
                          builder: (context, sleepProvider, child) {
                            return Column(
                              children: [
                                Text(
                                  'Sono: ${sleepProvider.sleep.toStringAsFixed(1)}%',
                                  style: TamagatochiTheme.regularTextStyle,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(25.0),
                                  child: LinearProgressIndicator(
                                    value: sleepProvider.sleep / 100,
                                    valueColor: AlwaysStoppedAnimation(_getStateColor(sleepProvider.sleep)),
                                    minHeight: 60,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                        Consumer<BathProvider>(
                          builder: (context, bathProvider, child) {
                            return Column(
                              children: [
                                Text(
                                  'Banho: ${bathProvider.bath.toStringAsFixed(1)}%',
                                  style: TamagatochiTheme.regularTextStyle,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(25.0),
                                  child: LinearProgressIndicator(
                                    value: bathProvider.bath / 100,
                                    valueColor: AlwaysStoppedAnimation(_getStateColor(bathProvider.bath)),
                                    minHeight: 60,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getStateColor(double status) {
    if (status > 50) return TamagatochiTheme.deepPurple;
    if (status >= 50) return TamagatochiTheme.regularPurple;
    if (status >= 25) return TamagatochiTheme.lightPurple;
    return Colors.white;
  }
}
