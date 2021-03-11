import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';

import 'package:projectapp/screens/search_views/ingredient_search_view.dart';
import 'package:projectapp/screens/joke_trivia_view/jokes_and_trivia_view.dart';
import 'package:projectapp/screens/search_views/recipe_search_view.dart';

class Homeview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.greenAccent[100],
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _introText(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _inspirationButton(context),
                    Container(
                      width: 14,
                    ),
                    _jokeButton(context),
                  ],
                ),
                Container(height: 10),
                _recipeViewButton(context),
              ]),
        ));
  }

  Widget _introText() {
    return Column(children: [
      Text(
        'Welcome to',
        style: TextStyle(fontSize: 18),
      ),
      Container(height: 10),
      Text(
        'FOODIES',
        style: TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          shadows: [
            Shadow(
                offset: Offset(3, 3),
                color: Colors.black.withOpacity(0.70),
                blurRadius: 10),
            Shadow(
                offset: Offset(-3, -3),
                color: Colors.greenAccent[100].withOpacity(0.85),
                blurRadius: 10)
          ],
        ),
      ),
      Container(height: 40),
      Text(
        'Search through hundreds of different recipes',
        style: TextStyle(fontSize: 18),
      ),
      Container(
        height: 50,
      ),
    ]);
  }

  Widget _inspirationButton(context) {
    return Row(children: [
      BouncingWidget(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => IngredientSearch()));
          },
          child: Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              width: 185,
              height: 185,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  border: Border.all(color: Colors.black, width: 2),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 5),
                        color: Colors.black,
                        blurRadius: 15),
                  ],
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.blueGrey[500], Colors.cyan])),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Icon(Icons.shuffle, size: 40, color: Colors.yellow[700]),
                Text(' Inspiration',
                    style: TextStyle(
                      fontSize: 22,
                      shadows: [
                        Shadow(
                            offset: Offset(3, 3),
                            color: Colors.black.withOpacity(0.70),
                            blurRadius: 10),
                        Shadow(
                            offset: Offset(-3, -3),
                            color: Colors.blueGrey.withOpacity(0.85),
                            blurRadius: 10)
                      ],
                    ))
              ])))
    ]);
  }

  Widget _jokeButton(context) {
    return Row(children: [
      BouncingWidget(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => JokesView()));
          },
          child: Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              width: 185,
              height: 185,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  border: Border.all(color: Colors.black, width: 2),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 5),
                        color: Colors.black,
                        blurRadius: 15),
                  ],
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.blueGrey[500], Colors.cyan])),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Icon(Icons.campaign, size: 40, color: Colors.yellow[700]),
                Text(' Joke/Trivia',
                    style: TextStyle(
                      fontSize: 22,
                      shadows: [
                        Shadow(
                            offset: Offset(3, 3),
                            color: Colors.black.withOpacity(0.70),
                            blurRadius: 10),
                        Shadow(
                            offset: Offset(-3, -3),
                            color: Colors.blueGrey.withOpacity(0.85),
                            blurRadius: 10)
                      ],
                    ))
              ])))
    ]);
  }

  Widget _recipeViewButton(context) {
    return Column(children: [
      BouncingWidget(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => RecipeSearch()));
          },
          child: Container(
              width: 385,
              height: 220,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 5),
                        color: Colors.black,
                        blurRadius: 15),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  border: Border.all(color: Colors.black, width: 2),
                  image: DecorationImage(
                      image: AssetImage('assets/FoodPic.png'),
                      fit: BoxFit.cover)),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Row(children: [
                    Text(' Explore Recipes',
                        style: TextStyle(
                          fontSize: 30,
                          shadows: [
                            Shadow(
                                offset: Offset(3, 3),
                                color: Colors.black.withOpacity(0.70),
                                blurRadius: 10),
                            Shadow(
                                offset: Offset(-3, -3),
                                color: Colors.blueGrey.withOpacity(0.85),
                                blurRadius: 10)
                          ],
                        ))
                  ]))))
    ]);
  }
}
