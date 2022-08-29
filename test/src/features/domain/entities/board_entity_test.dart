import 'package:flutter_test/flutter_test.dart';
import 'package:link4/src/features/board/domain/entities/board_entity.dart';


void main() {
  test('should return a board', (){
    BoardEntity board = BoardEntity(columnsNumber: 7, rowsNumber: 6);

    expect(board, isNotNull);
  });
  test('should return a board with length equals 7', (){
    BoardEntity board = BoardEntity(columnsNumber: 7, rowsNumber: 6);

    expect(board.get().length , 6);
  });
  test('should return a board a list of 0', (){
    BoardEntity board = BoardEntity(columnsNumber: 7, rowsNumber: 6);

    expect(board.get()[0] , [0,0,0,0,0,0,0]);
  });
}