import 'package:link4/src/features/board/domain/entities/board_entity.dart';
import 'package:link4/src/features/player/domain/entities/player_entity.dart';

class GameEntity{
  final BoardEntity board;
  final List<PlayerEntitty> players;
  late int round;
  late int turn;
  late int play;

  GameEntity({required this.board, required this.players}){
    round = 0;
    turn = players[0].player;
  }

}