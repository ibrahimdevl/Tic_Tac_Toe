import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/utils/tile_state.dart';

import '../utils/theme_number.dart';



class BoardTile extends StatelessWidget {

  final TileState tileState;
  final double dimension;
  final VoidCallback onPressed;



  BoardTile({Key? key, required this.dimension, required this.onPressed, required this.tileState}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int theme  = Provider.of<ThemeNumber>(context, listen: false).themeNumber;
    return Container(
      height: dimension,
      width: dimension,
      child: TextButton(onPressed: onPressed,
        child: WidgetForTileState(theme),
      ),
    );
  }
  Widget WidgetForTileState(int theme) {
    Widget widget = Container();

    switch (tileState) {
      case TileState.EMPTY:
        {
          widget = Container();
        }
        break;
      case TileState.CROSS:
        {
          widget = Image.asset('assets/images/x$theme.png');
        }
        break;
      case TileState.CIRCLE:
        {
          widget = Image.asset('assets/images/o$theme.png');
        }
        break;
    }
    return widget;
  }
}
