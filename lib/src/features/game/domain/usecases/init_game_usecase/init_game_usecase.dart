import 'package:link4/src/features/game/domain/entities/game_entity.dart';

abstract class InitGameUsecase{
  GameEntity call({required String namePlayer01, required String namePlayer02, bool is2Players = true});
}