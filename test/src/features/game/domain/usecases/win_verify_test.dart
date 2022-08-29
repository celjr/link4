import 'package:flutter_test/flutter_test.dart';
import 'package:link4/src/features/board/domain/entities/board_entity.dart';
import 'package:link4/src/features/board/domain/usecases/put_piece/put_piece_usecase.dart';
import 'package:link4/src/features/board/domain/usecases/put_piece/put_piece_usecase_imp.dart';
import 'package:link4/src/features/board/domain/usecases/reset_board/reset_board_usecase.dart';
import 'package:link4/src/features/board/domain/usecases/reset_board/reset_board_usecase_imp.dart';
import 'package:link4/src/features/game/domain/usecases/win_verify/win_varify_usecase.dart';
import 'package:link4/src/features/game/domain/usecases/win_verify/win_verify_usecase_imp.dart';
import 'dart:math';

void main() {
  test("should return true for vertical winner", () {
    BoardEntity board = BoardEntity(columnsNumber: 7, rowsNumber: 6);
    PutPieceUsecase putPiece = PutPieceUsecaseImp();
    WinVerifyUsecase winVerify = WinVerifyUsecaseImp();

    putPiece(column: 1, player: 1, board: board);
    putPiece(column: 1, player: 1, board: board);
    putPiece(column: 1, player: 1, board: board);
    putPiece(column: 1, player: 1, board: board);

    var result = winVerify(board: board, player: 1);
    expect(result, true);
  });
  test("should return true for horizontal winner", () {
    BoardEntity board = BoardEntity(columnsNumber: 7, rowsNumber: 6);
    PutPieceUsecase putPiece = PutPieceUsecaseImp();
    WinVerifyUsecase winVerify = WinVerifyUsecaseImp();

    board.get()[5] = [0, 1, 1, 1, 1, 0, 0];

    var result = winVerify(board: board, player: 1);
    expect(result, true);
  });
  test("should return true for secondary diagonal winner", () {
    BoardEntity board = BoardEntity(columnsNumber: 7, rowsNumber: 6);
    PutPieceUsecase putPiece = PutPieceUsecaseImp();
    WinVerifyUsecase winVerify = WinVerifyUsecaseImp();

    board.get()[2] = [0, 0, 0, 0, 1, 0, 0];
    board.get()[3] = [0, 0, 0, 1, 0, 0, 0];
    board.get()[4] = [0, 0, 1, 0, 0, 0, 0];
    board.get()[5] = [0, 1, 0, 0, 0, 0, 0];

    var result = winVerify(board: board, player: 1);
    expect(result, true);
  });
  test("should return true for principal diagonal winner", () {
    BoardEntity board = BoardEntity(columnsNumber: 7, rowsNumber: 6);
    PutPieceUsecase putPiece = PutPieceUsecaseImp();
    WinVerifyUsecase winVerify = WinVerifyUsecaseImp();

    board.get()[5] = [0, 0, 0, 0, 1, 0, 0];
    board.get()[4] = [0, 0, 0, 1, 0, 0, 0];
    board.get()[3] = [0, 0, 1, 0, 0, 0, 0];
    board.get()[2] = [0, 1, 0, 0, 0, 0, 0];

    var result = winVerify(board: board, player: 1);
    expect(result, true);
  });
  test("should return a  winner", () {
    BoardEntity board = BoardEntity(columnsNumber: 7, rowsNumber: 6);
    PutPieceUsecase putPiece = PutPieceUsecaseImp();
    WinVerifyUsecase winVerify = WinVerifyUsecaseImp();
    ResetBoardUsecase resteBoard = ResetBoardUsecaseImp();
    var rng = Random();
    var result01 = winVerify(board: board, player: 1);
    var result02 = winVerify(board: board, player: 2);
    var round = 0;
    var player01Win = 0;
    var player02Win = 0;
    for (int i = 0; i < 100; i++) {
      while ((!result01 && !result02) || round < 30) {
        putPiece(column: rng.nextInt(7), player: 1, board: board);
        putPiece(column: rng.nextInt(7), player: 2, board: board);
        round++;
        result01 = winVerify(board: board, player: 1);
        result02 = winVerify(board: board, player: 2);
      }
      result01 ? player01Win++ : null;
      result02 ? player02Win++ : null;
      print(board.toString());
      resteBoard(board: board);
      result01 = false;
      result02 = false;
    }
    print(player01Win);
    print(player02Win);


  });
}
