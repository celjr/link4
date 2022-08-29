import 'package:link4/src/features/board/domain/usecases/put_piece/put_piece_usecase.dart';
import 'package:link4/src/features/board/domain/usecases/put_piece/put_piece_usecase_imp.dart';
import 'package:link4/src/features/game/domain/entities/game_entity.dart';
import 'package:link4/src/features/game/domain/usecases/turn/tunr_usecase.dart';
import 'package:link4/src/features/game/domain/usecases/win_verify/win_varify_usecase.dart';
import 'package:link4/src/features/game/domain/usecases/win_verify/win_verify_usecase_imp.dart';

class TurnUsecaseImp implements TurnUsecase {
  final PutPieceUsecase _putPiece = PutPieceUsecaseImp();
  final WinVerifyUsecase _winVerify = WinVerifyUsecaseImp();
  @override
  bool call({required GameEntity game}) {
    _putPiece(board: game.board, player: game.turn, column: game.play);
    if (game.round >= 3) {
      if (_winVerify(board: game.board, player: game.turn)) {
        return false;
      } else {
        game.turn == 2 ? game.round++ : game.round;
        game.turn == 1 ? game.turn = 2 : game.turn = 1;
        return true;
      }
    } else {
      game.turn == 2 ? game.round++ : game.round;
      game.turn == 1 ? game.turn = 2 : game.turn = 1;
      return true;
    }
  }
}
