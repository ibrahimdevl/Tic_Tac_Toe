import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/pages/game_board.dart';
import '../pages/welcome.dart';


class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/welcome':
        return MaterialPageRoute(builder: (_) => WelcomePage());
      case '/game_board':
        return MaterialPageRoute(builder: (_) => GameBoard());


    // case '/NFC':
    //   return MaterialPageRoute(builder: (_) => NFC());

    // If args is not of the correct type, return an error page.
    // You can also throw an exception while in development.

      default:
        return MaterialPageRoute(builder: (_) => WelcomePage());
    }
  }


}