import 'package:flutter_test/flutter_test.dart';
import 'package:link4/src/features/game/domain/entities/game_entity.dart';
import 'package:link4/src/features/game/domain/usecases/init_game_usecase/init_game_usecase.dart';
import 'package:link4/src/features/game/domain/usecases/init_game_usecase/init_game_usecase_imp.dart';
import 'package:link4/src/features/game/domain/usecases/turn/tunr_usecase.dart';
import 'package:link4/src/features/game/domain/usecases/turn/turn_usecase_imp.dart';

void main() {
  test("should return true", () {
    InitGameUsecase initGame = InitGameUsecaseImp();
    GameEntity game;
    game = initGame(namePlayer01: 'play1', namePlayer02: 'play2');
    game.play = 6;
    TurnUsecase turn = TurnUsecaseImp();

    var result = turn(game: game);
    expect(result, true);
  });
}
