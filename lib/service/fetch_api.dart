import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:projectapp/models/ingredient_model.dart';
import 'package:projectapp/models/instruction_model.dart';
import 'package:projectapp/models/joke_model.dart';
import 'package:projectapp/models/recipe_item_info.dart';
import 'package:projectapp/models/recipe_item_model.dart';
import 'package:projectapp/models/trivia_model.dart';

const APIURL = 'https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com';
Map<String, String> keyHeader = {
  'X-RapidAPI-Key': "60e8154215mshb154a16e630ef85p138ab7jsna8e33460c705"
};

class FetchAPI {
  static Future<List<RecipeItem>> getRecipeSearch(String query) async {
    var response = await http.get('$APIURL/recipes/search?query=$query',
        headers: keyHeader);
    var json = jsonDecode(utf8.decode(response.bodyBytes));
    if (response.statusCode == 200) {
      return json['results'].map<RecipeItem>((data) {
        return RecipeItem.fromJson(data);
      }).toList();
    } else {
      throw Exception('Failed to search recipes');
    }
  }

  static Future<List<RecipeItem>> getIngredientsSearch(
      String ingredients) async {
    var response = await http.get(
        '$APIURL/recipes/findByIngredients?ingredients=$ingredients',
        headers: keyHeader);
    var json = jsonDecode(utf8.decode(response.bodyBytes));
    if (response.statusCode == 200) {
      return json.map<RecipeItem>((data) {
        return RecipeItem.fromJson(data);
      }).toList();
    } else {
      throw Exception('Failed to search ingredients');
    }
  }

  static Future<List<Ingredients>> getRecipeIngredients(int id) async {
    var response =
        await http.get('$APIURL/recipes/$id/information', headers: keyHeader);
    var json = jsonDecode(utf8.decode(response.bodyBytes));
    if (response.statusCode == 200) {
      return json['extendedIngredients'].map<Ingredients>((data) {
        return Ingredients.fromJson(data);
      }).toList();
    } else {
      throw Exception('Failed to load ingredients');
    }
  }

  static Future<List<Instructions>> getRecipeInstructions(int id) async {
    var response = await http.get('$APIURL/recipes/$id/analyzedInstructions',
        headers: keyHeader);
    var json = jsonDecode(utf8.decode(response.bodyBytes));
    if (response.statusCode == 200) {
      return json[0]['steps'].map<Instructions>((data) {
        return Instructions.fromJson(data);
      }).toList();
    } else {
      throw Exception('Failed to load recipe instructions');
    }
  }

  static Future getRecipeId(RecipeItem item) async {
    var ingredient = await getRecipeIngredients(item.id);
    var instruction = await getRecipeInstructions(item.id);
    return RecipeItemInfo(
        ingredient: ingredient, instruction: instruction, item: item);
  }

  static Future<JokeItem> getJokesList() async {
    final response =
        await http.get('$APIURL/food/jokes/random', headers: keyHeader);
    var json = jsonDecode(utf8.decode(response.bodyBytes));
    if (response.statusCode == 200) {
      return JokeItem.fromJson(json);
    } else {
      throw Exception('Failed to load joke');
    }
  }

  static Future<TriviaItem> getTriviaList() async {
    final response =
        await http.get('$APIURL/food/trivia/random', headers: keyHeader);
    var json = jsonDecode(utf8.decode(response.bodyBytes));
    if (response.statusCode == 200) {
      return TriviaItem.fromJson(json);
    } else {
      throw Exception('Failed to load trivia');
    }
  }
}
