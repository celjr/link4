import 'package:flutter/cupertino.dart';
import 'package:link4/src/features/board/domain/entities/board_entity.dart';
import 'package:link4/src/features/game/domain/entities/game_entity.dart';
import 'package:link4/src/features/player/domain/usecases/add_new_player/add_new_player_usecase.dart';
import 'package:link4/src/features/player/domain/usecases/add_new_player/add_new_player_usecase_imp.dart';

import 'init_game_usecase.dart';

class InitGameUsecaseImp implements InitGameUsecase {
  final AddNewPlayerUsecase _addNewPlayerUsecase = AddNewPlayerUsecaseImp();

  @override
  GameEntity call(
      {required String namePlayer01,
      required String namePlayer02,
      bool is2Players = true}) {
    BoardEntity board = BoardEntity(columnsNumber: 7, rowsNumber: 6);
    var player01 = _addNewPlayerUsecase(name: namePlayer01, player: 1);
    var player02 = _addNewPlayerUsecase(name: namePlayer02, player: 2);
    return GameEntity(board: board, players: [player01, player02]);
  }
}
