import 'package:link4/src/features/board/domain/entities/board_entity.dart';
import 'package:link4/src/features/game/domain/usecases/win_verify/win_varify_usecase.dart';

class WinVerifyUsecaseImp implements WinVerifyUsecase{
  @override
  bool call({required BoardEntity board, required int player}) {
    for(int i = 0; i<board.get().length;i++){
      for(int j = 0; j<board.get()[i].length;j++){
        //vertical verify
        if( i < board.rowsNumber - 3){
          if(board.get()[i][j] == player && board.get()[i+1][j] == player && board.get()[i+2][j] == player && board.get()[i+3][j] == player) return true;
        }
        //horizontal verify
        if( j < board.columnsNumber - 3){ 
          if(board.get()[i][j] == player && board.get()[i][j+1] == player && board.get()[i][j+2] == player && board.get()[i][j+3] == player) return true;
        }
         if( i < board.rowsNumber - 3 && j < board.columnsNumber - 3){
          if(board.get()[i][j] == player && board.get()[i+1][j+1] == player && board.get()[i+2][j+2] == player && board.get()[i+3][j+3] == player) return true;
        }
        if( i < board.rowsNumber - 3 && j >= board.columnsNumber - 4){
          if(board.get()[i][j] == player && board.get()[i+1][j-1] == player && board.get()[i+2][j-2] == player && board.get()[i+3][j-3] == player) return true;
        }
      }
      }
      return false;
    }

  }

