import 'package:flutter/material.dart';
import 'package:tic_tac_toe/widgets/board_tile.dart';

import '../utils/tile_state.dart';



class GameBoard extends StatefulWidget {
  const GameBoard({Key? key}) : super(key: key);

  @override
  State<GameBoard> createState() => _GameBoardState();
}


class _GameBoardState extends State<GameBoard> {

  var _boardState = List.filled(9, TileState.EMPTY);

  var _currentTurn = TileState.CROSS;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('Tic Tac Toe'),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Stack(
          children: [
            Image.asset('assets/images/board.png'),
            _boardTiles()
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }


  Widget _boardTiles() {
    return Builder(builder: (context) {
      final boardDimension = MediaQuery.of(context).size.width;
      final tileDimension = boardDimension / 3;
      return Container(
          width: boardDimension,
          height: boardDimension,
          child: Column(
              children: chunk(_boardState, 3).asMap().entries.map((entry) {
                final chunckIndex = entry.key;
                final tileStateChunk = entry.value;

                return Row(
                  children: tileStateChunk.asMap().entries.map((innerEntry) {
                    final innerIndex = innerEntry.key;
                    final tileState = innerEntry.value;
                    final tileIndex = (chunckIndex * 3) + innerIndex;
                    return BoardTile(dimension: tileDimension,
                        onPressed: () => _updateTilesStateForInde(tileIndex) ,
                        tileState: tileState
                    );
                  }).toList(),
                );
              }).toList()));
    });
  }


  void _updateTilesStateForInde(int selectedIndex) {
    if(_boardState[selectedIndex] == TileState.EMPTY) {
      setState(() {
        _boardState[selectedIndex] = _currentTurn;
        _currentTurn  = _currentTurn == TileState.CROSS ? TileState.CIRCLE :  TileState.CROSS;
      });
      final winner = _findWinner();
      if(winner!= null && winner != TileState.NULL) {
        print('Winner is: $winner');
        _showWinnerDialog(winner);
      }
    }
  }

  TileState _findWinner() {
    TileState Function(int, int, int) winnerForMatch = (a, b, c) {
      if(_boardState[a] != TileState.EMPTY && _boardState[a] != TileState.NULL) {
        if((_boardState[a] == _boardState[b]) && (_boardState[a] == _boardState[c])) {
          return _boardState[a];
        }
      }
      return TileState.NULL;
    };

    final checks = [
      winnerForMatch(0, 1, 2),
      winnerForMatch(3, 4, 5),
      winnerForMatch(6, 7, 8),
      winnerForMatch(0, 3, 6),
      winnerForMatch(1, 4, 7),
      winnerForMatch(2, 5, 8),
      winnerForMatch(0, 4, 8),
      winnerForMatch(2, 4, 6),
    ];

    TileState winner = TileState.NULL;
    for(int i =0; i<checks.length; i++) {
      if(checks[i] != TileState.NULL) {
        winner = checks[i];
        break;
      }
    }
    return winner;
  }


  void _showWinnerDialog(TileState tileState) {
    showDialog(context: context,
        builder: (_){
          return AlertDialog(
            title: Text('Winner'),
            content: Image.asset(tileState == TileState.CROSS ? 'assets/images/x.png' : 'assets/images/o.png'),
            actions: [TextButton(onPressed: () {
              _resetGame();
              Navigator.of(context).pop();
            },
                child: Text('New Game'))],
          );
        });
  }

  void _resetGame() {
    setState(() {
      _boardState = List.filled(9, TileState.EMPTY);
      _currentTurn = TileState.CROSS;
    });
  }

}
