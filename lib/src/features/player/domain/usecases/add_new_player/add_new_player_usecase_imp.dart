import '../../entities/player_entity.dart';
import 'add_new_player_usecase.dart';

class AddNewPlayerUsecaseImp implements AddNewPlayerUsecase{
  @override
  PlayerEntitty call({required String name, required int player}) {
    return PlayerEntitty(name, player);
  }
}