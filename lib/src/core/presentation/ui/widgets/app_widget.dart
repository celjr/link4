

import 'package:flutter/material.dart';
import 'package:link4/src/core/presentation/ui/pages/home_page.dart';
import 'package:link4/src/features/game/presentation/ui/pages/winner_page.dart';

import '../../../../features/game/presentation/ui/pages/game_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context) => const HomePage(),
        '/game':(context) => const GamePage(),
        '/winner':(context) => const WinnerPage()
      },
      initialRoute: '/',
    );
  }
}