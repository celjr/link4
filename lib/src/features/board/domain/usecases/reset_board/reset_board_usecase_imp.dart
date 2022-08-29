import '../../entities/board_entity.dart';
import 'reset_board_usecase.dart';

class ResetBoardUsecaseImp implements ResetBoardUsecase{
  @override
  void call({required BoardEntity board}) {
    for(int i = 0; i < board.get().length;i++){
    board.get()[i] = List.generate(board.columnsNumber, (int i) => 0);
    }
  }

}