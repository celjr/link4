import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:link4/src/features/game/domain/usecases/init_game_usecase/init_game_usecase.dart';
import 'package:link4/src/features/game/domain/usecases/init_game_usecase/init_game_usecase_imp.dart';
import 'package:link4/src/features/game/domain/usecases/turn/tunr_usecase.dart';
import 'package:link4/src/features/game/domain/usecases/turn/turn_usecase_imp.dart';
import 'package:link4/src/features/game/presentation/controller/game_controller.dart';
import 'package:link4/src/features/game/presentation/ui/components/display_player.dart';

import '../../../../board/domain/presatation/widgets/board_widget.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  InitGameUsecase initGame = InitGameUsecaseImp();
  TurnUsecase turn = TurnUsecaseImp();
  late GameController gameController;
  var args;

  @override
  void initState() {
    super.initState();
    gameController = GameController(initGame, turn);
    
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
  }

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)?.settings.arguments;
    gameController.initGame(play01: args[0], play02: args[1]);
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Flex(direction: Axis.horizontal, children: [
            AnimatedBuilder(
              animation: gameController,
              builder: (context, _) {
                return Flexible(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DisplayPlayer(
                            playerName: gameController.game.players[0].name,
                            isYourTurn: gameController.game.turn==1,
                            playerColor: Colors.purple),
                        DisplayPlayer(
                            playerName: gameController.game.players[1].name,
                            isYourTurn: gameController.game.turn==2,
                            playerColor: Colors.blue),
                      ],
                    ));
              }
            ),
            Flexible(
              flex: 6,
              child: BoardWidget(gameController: gameController,)
            ),
            Flexible(
                flex: 1,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      Positioned(
                          right: 5,
                          child: IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: const Icon(Icons.settings))),
                      Center(
                        child: Container(
                          padding:const  EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.blue, width: 2),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                "Round",
                                style: TextStyle(fontSize: 10),
                              ),
                              AnimatedBuilder(
                                animation: gameController,
                                builder: (context, _) {
                                  return Text(' ${gameController.game.round}',
                                    style: const TextStyle(fontSize: 20),
                                  );
                                }
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )),
          ]),
        ),
      ),
    );
  }
}
