import 'package:projectapp/models/ingredient_model.dart';
import 'package:projectapp/models/instruction_model.dart';
import 'package:projectapp/models/recipe_item_model.dart';

class RecipeItemInfo {
  RecipeItem item;
  List<Ingredients> ingredient;
  List<Instructions> instruction;

  RecipeItemInfo({this.item, this.ingredient, this.instruction});
}
