import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late Animation widthButton;
  late final animationController;
  late Animation positionLogo;
  late Animation opacityAnimation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
    widthButton = Tween<double>(begin: 50, end: 300).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut));
    opacityAnimation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut));

    animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    positionLogo = Tween<double>(
            begin: -50, end: MediaQuery.of(context).size.height / 2 - 50)
        .animate(CurvedAnimation(
            parent: animationController, curve: Curves.bounceOut));
    animationController.forward();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              width: 300,
              child: Stack(
                alignment: Alignment.topLeft,
                children: [
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.bounceOut,
                    top: positionLogo.value,
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue,
                      ),
                      alignment: Alignment.topCenter,
                      child: const Text(
                        'L',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 40),
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 700),
                    curve: Curves.bounceOut,
                    left: 62.5,
                    top: positionLogo.value,
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue,
                      ),
                      alignment: Alignment.topCenter,
                      child: const Text(
                        'I',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 40),
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 900),
                    curve: Curves.bounceOut,
                    left: 125,
                    top: positionLogo.value,
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue,
                      ),
                      alignment: Alignment.topCenter,
                      child: const Text(
                        'N',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 40),
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 1200),
                    curve: Curves.bounceOut,
                    top: positionLogo.value,
                    left: 187.5,
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue,
                      ),
                      alignment: Alignment.topCenter,
                      child: const Text(
                        'K',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 40),
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 1400),
                    curve: Curves.bounceOut,
                    top: positionLogo.value,
                    left: 250,
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red,
                      ),
                      alignment: Alignment.topCenter,
                      child: const Text(
                        '4',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 40),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                String play01 = 'Player 01';
                String play02 = 'Player 02';
                showDialog(
                    context: context,
                    builder: (context) {
                      return SimpleDialog(
                          elevation: 5,
                          contentPadding: const EdgeInsets.all(20),
                          title: const Text('Digite o Nome dos Jogadores'),
                          children: [
                             TextField(
                              
                              onChanged: ((value) => play01 = value),
                              decoration:  InputDecoration(
                                label: Text(play01),
                              ),
                            ),
                            const SizedBox(height: 20),
                             TextField(onChanged: ((value) => play02 = value),
                              decoration:  InputDecoration(
                                label: Text(play02),
                              ),
                            ),
                            const SizedBox(height: 20),
                            TextButton(
                                onPressed: () {
                                  
                                  Navigator.of(context).popAndPushNamed('/game',arguments: [play01,play02]);
                                },
                                child: const Text('Iniciar Jogo'))
                          ]);
                    });
              },
              child: Container(
                height: 50,
                width: widthButton.value,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(color: Colors.blue, width: 2),
                ),
                child: Opacity(
                  opacity: opacityAnimation.value,
                  child: const Text(
                    'Play',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
