import 'package:flutter/material.dart';



class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: TextButton(
          child: const Text('play'),
          onPressed: () {
            Navigator.pushNamed(context, '/game_board');
          },
        ),
      ),
    );
  }
}
