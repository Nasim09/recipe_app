import 'dart:convert';
import 'package:recipe_app/widgets/recipe.dart';

import 'package:http/http.dart' as http;

class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https(
      "yummly2.p.rapidapi.com",
      '/feeds/list',
      {"limit": "24", "start": "0","tag": "list.recipe.popular"},
     );

     final response = await http.get(uri, headers: {
      "X-RapidAPI-Key": "ca59ae92d5mshba43dd602e5d535p1e5cc5jsn22b0785e6d74",
      	"X-RapidAPI-Host": "yummly2.p.rapidapi.com",
        	"useQueryString": "true"
     });

      Map data = jsonDecode(response.body);
      List _temp = [];
      
      for (var i in data['feed']){
        _temp.add(i['content']['details']);
      }

      return Recipe.recipesFromSnapshot(_temp);
     }
  }