

import '../../entities/board_entity.dart';

abstract class ResetBoardUsecase{
  void call({required BoardEntity board});
}