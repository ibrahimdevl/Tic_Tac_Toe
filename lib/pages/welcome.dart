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
      color: Colors.white30,
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/game_board');
          }, // This child can be everything. I want to choose a beautiful Text Widget
          style: ElevatedButton.styleFrom(
            textStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            minimumSize: Size(200, 100), //change size of this beautiful button
            // We can change style of this beautiful elevated button thanks to style prop
            primary: Colors.amber, // we can set primary color
            onPrimary: Colors.white, // change color of child prop
            onSurface: Colors.blue, // surface color
            shadowColor: Colors
                .grey, //shadow prop is a very nice prop for every button or card widgets.
            elevation: 5, // we can set elevation of this beautiful button
            side: const BorderSide(
                color: Colors.white, //change border color
                width: 2, //change border width
                style: BorderStyle
                    .solid), // change border side of this beautiful button
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  30), //change border radius of this beautiful button thanks to BorderRadius.circular function
            ),
            tapTargetSize: MaterialTapTargetSize.padded,
          ), //This prop for beautiful expressions
          child: const Text(
              "Play X/O"),
        ),

        /*TextButton(
          child: const Text('play'),
          onPressed: () {
            Navigator.pushNamed(context, '/game_board');
          },
        ),*/
      ),
    );
  }
}
