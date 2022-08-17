import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/utils/theme_number.dart';



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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 250.0),
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
            ),

            const SizedBox(height: 30.0,),
            const Center(
              child: Text("Choose Theme",
              style: TextStyle(
                color: Colors.white,
                decoration: TextDecoration.none
              ),
              ),

            ),
            const SizedBox(height: 20.0,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 50.0,),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      Provider.of<ThemeNumber>(context, listen: false).themeNumber = 1;
                      Fluttertoast.showToast(
                          msg: "Theme 1 Chosen",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.white,
                          textColor: Colors.black,
                          fontSize: 16.0
                      );
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 3.0,
                        color: Colors.white,
                      ),
                      borderRadius: const BorderRadius.all(
                          Radius.circular(5.0) //                 <--- border radius here
                      ),
                    ),
                    width: 120.0,
                    height: 100.0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset('assets/images/theme1.png'),
                    ),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      Provider.of<ThemeNumber>(context, listen: false).themeNumber = 2;
                      Fluttertoast.showToast(
                          msg: "Theme 2 Chosen",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.white,
                          textColor: Colors.black,
                          fontSize: 16.0
                      );
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 3.0,
                        color: Colors.white,
                      ),
                      borderRadius: const BorderRadius.all(
                          Radius.circular(5.0) //                 <--- border radius here
                      ),
                    ),
                    width: 120.0,
                    height: 100.0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset('assets/images/theme2.png'),
                    ),
                  ),
                ),
                const SizedBox(width: 50.0,),
              ],
            )
          ],
        )

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
