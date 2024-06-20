import 'package:flutter/material.dart';
import 'package:tamagatochi/theme/theme.dart';

class GatochiDeadPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TamagatochiTheme.deepPurple,
        title: Text('TAMAGATOCHI', style: TamagatochiTheme.appBarTitleStyle),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.black87,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/tumulo-gatochi.png'), // Imagem do Gatochi morto
              SizedBox(height: 20),
              Text(
                'Gatochi está morto.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
