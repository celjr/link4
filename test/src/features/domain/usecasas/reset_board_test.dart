import 'package:flutter_test/flutter_test.dart';
import 'package:link4/src/features/board/domain/entities/board_entity.dart';
import 'package:link4/src/features/board/domain/usecases/put_piece/put_piece_usecase.dart';
import 'package:link4/src/features/board/domain/usecases/put_piece/put_piece_usecase_imp.dart';
import 'package:link4/src/features/board/domain/usecases/reset_board/reset_board_usecase.dart';
import 'package:link4/src/features/board/domain/usecases/reset_board/reset_board_usecase_imp.dart';


main() {
  PutPieceUsecase putPiece = PutPieceUsecaseImp();
  ResetBoardUsecase resetBoard = ResetBoardUsecaseImp();
  test('should return a not null', () {
    BoardEntity board = BoardEntity(columnsNumber: 7, rowsNumber: 6);

    putPiece(board: board, column: 2, player: 1);
    resetBoard(board:board);
    expect(board.get().last[2], 0);
  });
}