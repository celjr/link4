import 'package:link4/src/features/board/domain/entities/board_entity.dart';

abstract class WinVerifyUsecase{
  bool call({required BoardEntity board, required int player});
}