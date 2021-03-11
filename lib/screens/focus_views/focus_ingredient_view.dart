import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:projectapp/models/recipe_item_model.dart';
import 'package:projectapp/service/fetch_api.dart';
import 'package:projectapp/widgets/appBar_widget.dart';
import 'package:projectapp/widgets/loading_widget.dart';

class FocusIngredients extends StatefulWidget {
  final RecipeItem item;
  FocusIngredients(this.item);

  @override
  _FocusIngredientsState createState() => _FocusIngredientsState();
}

class _FocusIngredientsState extends State<FocusIngredients> {
  var itemInfo;

  void _getRecipeInformation(RecipeItem item) async {
    try {
      var information = await FetchAPI.getRecipeId(item);
      setState(() {
        itemInfo = information;
      });
    } catch (e) {}
  }

  initState() {
    super.initState();
    _getRecipeInformation(widget.item);
  }

  Widget build(BuildContext context) {
    if (itemInfo == null) {
      return Loading();
    } else {
      return Scaffold(
          appBar: CustomAppBar(
            title: itemInfo.item.title,
          ),
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                expandedHeight: 250,
                flexibleSpace: _picture(context),
              ),
              SliverList(
                  delegate: SliverChildListDelegate([
                Column(
                  children: [
                    _recipeTitle(),
                    _ingredientStart(),
                    _ingredientList(),
                    _instructionStart(),
                    _instructionList()
                  ],
                )
              ]))
            ],
          ));
    }
  }

  Widget _picture(context) {
    return Image(
      image: NetworkImage(itemInfo.item.image),
      fit: BoxFit.cover,
    );
  }

  Widget _recipeTitle() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Text(
        itemInfo.item.title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      ),
    );
  }

  Widget _ingredientStart() {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, bottom: 5),
      child: Text(
        'Ingredients',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
    );
  }

  Widget _ingredientList() {
    var ingredient = itemInfo.ingredient;
    return ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemCount: ingredient.length,
        itemBuilder: (context, index) {
          return ListTile(
              title: Text(
            ingredient[index].originalString + '.',
            style: TextStyle(fontSize: 20),
          ));
        });
  }

  Widget _instructionStart() {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, bottom: 10),
      child: Text(
        'Instructions',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
    );
  }

  Widget _instructionList() {
    var instruction = itemInfo.instruction;
    return ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemCount: instruction.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              instruction[index].number.toString() +
                  '. ' +
                  instruction[index].step +
                  '\n',
              style: TextStyle(fontSize: 20),
            ),
          );
        });
  }
}
