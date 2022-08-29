import '../../entities/player_entity.dart';

abstract class AddNewPlayerUsecase{
  PlayerEntitty call({required String name,required int player});
}