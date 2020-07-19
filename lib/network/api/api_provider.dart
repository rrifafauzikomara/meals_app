import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:mealsapp/network/model/categories.dart';
import 'package:mealsapp/network/model/meals.dart';

class MealsApiProvider {
  Client client = Client();

  static final String _baseUrl = 'https://www.themealdb.com/api/json/v1/1/';

  Future<MealsResult> mealsList(String mealsType) async {
    final response = await client.get(_baseUrl + "filter.php?c=$mealsType");
    if (response.statusCode == 200) {
      return MealsResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load meals');
    }
  }

  Future<CategoriesResult> categoryList() async {
    final response = await client.get(_baseUrl + "categories.php");
    if (response.statusCode == 200) {
      return CategoriesResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load category');
    }
  }

  /// For detail, u can use this URL
  /// https://www.themealdb.com/api/json/v1/1/lookup.php?i=52772
  /// just send id from the meals list (seafood or dessert
}
