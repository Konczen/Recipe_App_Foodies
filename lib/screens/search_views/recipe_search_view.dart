import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:projectapp/screens/search_views/widgets/card.dart';
import 'package:projectapp/screens/search_views/widgets/textfield.dart';
import 'package:projectapp/service/fetch_api.dart';
import 'package:projectapp/screens/focus_views/focus_recipe_view.dart';
import 'package:projectapp/widgets/appBar_widget.dart';
import 'package:projectapp/widgets/loading_widget.dart';

TextEditingController _textEditingController = TextEditingController();

class RecipeSearch extends StatefulWidget {
  @override
  _RecipeSearchState createState() => _RecipeSearchState();
}

class _RecipeSearchState extends State<RecipeSearch> {
  var items;
  Future _getRecipes(String query) async {
    try {
      var item = await FetchAPI.getRecipeSearch(query);
      setState(() {
        items = item;
      });
    } catch (e) {}
  }

  initState() {
    super.initState();
    _getRecipes(_textEditingController.text);
  }

  Widget build(BuildContext context) {
    if (items == null) {
      return Loading();
    } else {
      return Scaffold(
          appBar: CustomAppBar(title: 'Find a Recipe'),
          body: CustomScrollView(slivers: [
            SliverAppBar(
              pinned: false,
              floating: true,
              snap: false,
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              expandedHeight: 80,
              flexibleSpace: CustomTextField(
                  _textEditingController, 'Search dish...', onChanged: () {
                _getRecipes(_textEditingController.text);
              }),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              Column(children: [
                _recipesText(),
                _dividerLine(),
                _listBuilder(),
              ])
            ]))
          ]));
    }
  }

  Widget _recipesText() {
    return Text(
      'Recipes',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    );
  }

  Widget _dividerLine() {
    return Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        child: Divider(thickness: 2, color: Colors.grey[700]));
  }

  Widget _listBuilder() {
    return ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return CustomCard(
              'https://spoonacular.com/recipeImages/' + items[index].image,
              items[index].title, onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FocusRecipeView(items[index]),
                ));
          });
        });
  }
}
