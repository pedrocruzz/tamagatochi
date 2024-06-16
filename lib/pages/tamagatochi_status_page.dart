import 'package:flutter/material.dart';
import 'package:tamagatochi/theme/theme.dart';

class TamagatochiStatusPage extends StatefulWidget {
  @override
  _TamagatochiStatusPageState createState() => _TamagatochiStatusPageState();
}

class _TamagatochiStatusPageState extends State<TamagatochiStatusPage> {
  double _fome = 75;
  double _sono = 50;
  double _higiene = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: TamagatochiTheme.deepPurple,
          title: Text('TAMAGATOCHI', style: TamagatochiTheme.appBarTitleStyle),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white), // Cor branca
            onPressed: () {
              Navigator.pop(context);
            },
          )),
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
                        Text(
                          'Fome: ${_fome.round()}%',
                          style: TamagatochiTheme.regularTextStyle,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: LinearProgressIndicator(
                            value: _fome / 100,
                            valueColor:
                                AlwaysStoppedAnimation(_getStateColor(_fome)),
                            minHeight: 60,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Card(
              color: Colors.black,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Sono: ${_sono.round()}%',
                          style: TamagatochiTheme.regularTextStyle,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: LinearProgressIndicator(
                            value: _sono / 100,
                            valueColor:
                                AlwaysStoppedAnimation(_getStateColor(_sono)),
                            minHeight: 60,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Card(
              color: Colors.black,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Higiene: ${_higiene.round()}%',
                          style: TamagatochiTheme.regularTextStyle,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: LinearProgressIndicator(
                            value: _higiene / 100,
                            valueColor:
                                AlwaysStoppedAnimation(_getStateColor(_higiene)),
                            minHeight: 60,
                          ),
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

  Color _getStateColor(status) {
    if (status > 50) return TamagatochiTheme.deepPurple;
    if (status >= 50) return TamagatochiTheme.regularPurple;
    if (status >= 25) return TamagatochiTheme.lightPurple;
    return Colors.white;
  }
}
