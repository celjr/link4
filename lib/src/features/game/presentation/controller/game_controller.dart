import 'package:flutter/cupertino.dart';
import 'package:link4/src/features/game/domain/entities/game_entity.dart';
import 'package:link4/src/features/game/domain/usecases/init_game_usecase/init_game_usecase.dart';
import 'package:link4/src/features/game/domain/usecases/turn/tunr_usecase.dart';

class GameController extends ChangeNotifier{
  final InitGameUsecase _initGame ;
  final TurnUsecase _turn;

  late GameEntity game;
  GameController(this._initGame,this._turn);

  void initGame({required String play01,required String play02}){
    game =_initGame(namePlayer01: play01,namePlayer02: play02);
  }
  bool turn(){
    var result =  _turn(game: game,);
    notifyListeners();
    return result;
    
  }
  bool canPlay(){
    return game.board.get().first[game.play] == 0;
  }
}