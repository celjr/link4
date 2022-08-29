import 'package:flutter/material.dart';
import 'package:link4/src/features/board/domain/presatation/widgets/piece_widget.dart';
import 'package:link4/src/features/game/domain/entities/game_entity.dart';
import 'package:link4/src/features/game/presentation/controller/game_controller.dart';

class BoardWidget extends StatefulWidget {
  final GameController gameController;
  const BoardWidget({Key? key, required this.gameController}) : super(key: key);

  @override
  State<BoardWidget> createState() => _BoardWidgetState();
}

class _BoardWidgetState extends State<BoardWidget> {
  @override
  Widget build(BuildContext context) {
    int columnsNumber = widget.gameController.game.board.columnsNumber;
    //int rowsNumber = widget.gameController.game.board.rowsNumber;
    int totalPieces = widget.gameController.game.board.columnsNumber *
        widget.gameController.game.board.rowsNumber;
    return AnimatedBuilder(
      animation: widget.gameController,
      builder: (context, _) => GridView.builder(
          itemCount: totalPieces,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: widget.gameController.game.board.columnsNumber),
          itemBuilder: (BuildContext context, int index) {
            if (widget.gameController.game.board.get()[(index ~/ columnsNumber)]
                    [(index - (columnsNumber * (index ~/ columnsNumber)))] ==
                1) {
              return GestureDetector(
                onTap: (() {
                  widget.gameController.game.play =
                      (index - (columnsNumber * (index ~/ columnsNumber)));
                  bool isContinue;
                  widget.gameController.canPlay()
                      ? isContinue = widget.gameController.turn()
                      : isContinue = true;
                  if (!isContinue) {
                    Navigator.of(context).popAndPushNamed('/winner');
                  }
                }),
                child: const PieceWidget(color: Colors.purple),
              );
            } else if (widget.gameController.game.board
                        .get()[(index ~/ columnsNumber)]
                    [(index - (columnsNumber * (index ~/ columnsNumber)))] ==
                2) {
              return GestureDetector(
                onTap: (() {
                  widget.gameController.game.play =
                      (index - (columnsNumber * (index ~/ columnsNumber)));
                  bool isContinue;
                  widget.gameController.canPlay()
                      ? isContinue = widget.gameController.turn()
                      : isContinue = true;

                  if (!isContinue) {
                    Navigator.of(context).popAndPushNamed('/winner');
                  }

                }),
                child: const PieceWidget(color: Colors.blue),
              );
            } else {
              {
                return GestureDetector(
                  onTap: (() {
                    widget.gameController.game.play =
                        (index - (columnsNumber * (index ~/ columnsNumber)));
                    bool isContinue;
                    widget.gameController.canPlay()
                        ? isContinue = widget.gameController.turn()
                        : isContinue = true;
                    if (!isContinue) {
                      Navigator.of(context).popAndPushNamed('/winner');
                    }
                  }),
                  child: const PieceWidget(color: Colors.grey),
                );
              }
            }
          }),
    );
  }
}
