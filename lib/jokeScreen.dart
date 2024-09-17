import 'package:flutter/material.dart';
import 'package:joemama/Provider/providerServices.dart';
import 'package:provider/provider.dart';

class JokeScreen extends StatelessWidget {
  const JokeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Center(
            child: Text(
          'Joemama',
          style: TextStyle(
            color: Colors.yellow,
            fontWeight: FontWeight.bold,
            fontSize: 25,
            shadows: [
              Shadow(
                offset: Offset(
                    2.0, 2.0),
                blurRadius: 3.0,
                color: Colors.black,
              ),
            ],
          ),
        )),
      ),
      body: Consumer<JokeProviderService>(
        builder: (context, jokeController, _) {  //jokeController is the most critical part. It provides access to the data (jokes) and functions (getData) from the JokeProviderService.
          return Center(                         //In this case, the child parameter is not used, so it's replaced with _ to signal that it's intentionally ignored.
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (jokeController.jokes != null) ...[
                    Image.network(jokeController.jokes!.iconUrl),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        jokeController.jokes!.value,
                        style: TextStyle(
                          color: Colors.yellow,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          shadows: [
                            Shadow(
                              offset: Offset(2.0, 2.0),
                              blurRadius: 3.0,
                              color: Colors.black,
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        jokeController.getData(); //when pressed it call getData making Text(jokeController.jokes == null) FALSE
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.yellow),
                        foregroundColor: MaterialStateProperty.all(
                            Colors.black), // Text color
                        shadowColor: MaterialStateProperty.all(
                            Colors.yellow), // Shadow color
                        elevation: MaterialStateProperty.all(20), // Elevation
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(30), // Rounded corners
                          ),
                        ),
                      ),
                      child: Text(jokeController.jokes == null
                          ? "Start Reading Jokes"
                          : "Next")),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// Without child (like in this code):

// Consumer<JokeProviderService>(builder: (context, jokeController, _) {
//       UI that depends on jokeController
//    },
// );




// With child:

// Consumer<JokeProviderService>(builder: (context, jokeController, child) {
//    return Column(
//       children: [
//             child, // Use the static child here
//             other UI that depends on jokeController
//       ],
//    );
//  },
//  child: Text('This part is static and does not rebuild'),
// );
