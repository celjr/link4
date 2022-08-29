import '../../entities/board_entity.dart';
import 'put_piece_usecase.dart';

class PutPieceUsecaseImp implements PutPieceUsecase {
  @override
  bool call({required int column,required int player, required BoardEntity board}) {
      for(int i =board.get().length - 1; i>=0; i--){
        if(board.get()[i][column] ==0)  {
          board.set(column: column, row: i, player: player);
          return true;
        }
      }
    return false;
  }  
}