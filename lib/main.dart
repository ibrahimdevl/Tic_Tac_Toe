import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/utils/routes.dart';
import 'package:tic_tac_toe/utils/theme_number.dart';
import 'package:tic_tac_toe/utils/tile_state.dart';
import 'package:tic_tac_toe/widgets/board_tile.dart';

void main() {
  runApp(MultiProvider(
      providers: [
    ChangeNotifierProvider(
        create: (_) => ThemeNumber(0)
    ),
  ],
      child: const MyApp()
  ),

  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/welcome',
      onGenerateRoute: RouteGenerator.generateRoute,
      title: 'Tic Tac Toe',
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
    );
  }
}
