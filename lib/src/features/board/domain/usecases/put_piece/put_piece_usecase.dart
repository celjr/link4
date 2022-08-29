


import '../../entities/board_entity.dart';

abstract class PutPieceUsecase{
  bool call({required int column, required int player, required BoardEntity board});
}