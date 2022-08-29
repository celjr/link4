import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class WinnerPage extends StatefulWidget {
  const WinnerPage({Key? key}) : super(key: key);

  @override
  State<WinnerPage> createState() => _WinnerPageState();
}

class _WinnerPageState extends State<WinnerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
           const  Text('Parabens você ganhou',style: TextStyle(color: Colors.blue,fontSize: 100),),
            GestureDetector(
              onTap: (() => Navigator.of(context).popAndPushNamed('/')),
              child: Container(
                height: 50,
                width: 500,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(color: Colors.blue, width: 2),
                ),
                child: const Opacity(
                  opacity: 1,
                  child:  Text(
                    'Voltar',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
