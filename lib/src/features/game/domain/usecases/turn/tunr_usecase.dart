
import 'package:link4/src/features/game/domain/entities/game_entity.dart';

abstract class TurnUsecase {
  bool call({required GameEntity game});
}