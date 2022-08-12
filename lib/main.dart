import 'package:flutter/material.dart';
import 'package:tic_tac_toe/utils/tile_state.dart';
import 'package:tic_tac_toe/widgets/board_tile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

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
        title: Text('Tic Tac Toe'),
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
