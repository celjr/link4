import 'package:flutter_test/flutter_test.dart';
import 'package:link4/src/features/board/domain/entities/board_entity.dart';
import 'package:link4/src/features/board/domain/usecases/put_piece/put_piece_usecase.dart';
import 'package:link4/src/features/board/domain/usecases/put_piece/put_piece_usecase_imp.dart';


main() {
  PutPieceUsecase _putPiece = PutPieceUsecaseImp();
  test('should return a not null', () {
    BoardEntity board = BoardEntity(columnsNumber: 7, rowsNumber: 6);

    var result = _putPiece(board: board, column: 2, player: 1);

    expect(result, isNotNull);
  });
  test('should return true', () {
    BoardEntity board = BoardEntity(columnsNumber: 7, rowsNumber: 6);

    var result = _putPiece(board: board, column: 2, player: 1);

    expect(result, true);
  });
  test('should set player play in board', () {
    BoardEntity board = BoardEntity(columnsNumber: 7, rowsNumber: 6);

    var result = _putPiece(board: board, column: 2, player: 1);

    expect(board.get().last[2], 1);
  });
   test('should set player play in board 2', () {
    BoardEntity board = BoardEntity(columnsNumber: 7, rowsNumber: 6);

    _putPiece(board: board, column: 2, player: 1);
    _putPiece(board: board, column: 2, player: 2);

    expect(board.get()[4][2], 2);
  });
}
