import 'package:flutter/material.dart';

class DisplayPlayer extends StatelessWidget {
  final String playerName;
  final bool isYourTurn;
  final Color playerColor;
  const DisplayPlayer(
      {Key? key,
      required this.playerName,
      required this.isYourTurn,
      required this.playerColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 800),
      opacity: isYourTurn ? 1 : 0.3,
      child: Container(
        padding: const EdgeInsets.all(5),
        alignment: Alignment.topCenter,
        margin: const EdgeInsets.all(5),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.4,
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: playerColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(playerName,
                style: const TextStyle(fontSize: 20, color: Colors.white)),
            if (isYourTurn)
              const Text("SUA VEZ",
                  style: TextStyle(fontSize: 30, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
