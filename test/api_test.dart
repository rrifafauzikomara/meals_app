import 'package:mealsapp/network/api/api_provider.dart';
import 'package:mealsapp/network/model/meals.dart';
import 'package:mealsapp/network/model/categories.dart';
import 'package:test_api/test_api.dart';
import 'package:mockito/mockito.dart';

import 'package:http/http.dart' as http;

class ApiTest extends Mock implements http.Client {}

main() {
  MealsApi mealsApi = MealsApi();
  final client = ApiTest();

  group("Request Banner test", () {
    test("should request complete", () async {
      when(client.get("https://www.themealdb.com/api/json/v1/1/categories.php"))
          .thenAnswer((_) async => http.Response(Meals().toString(), 200),
      );

      expect(await mealsApi.categoryList(), isA<CategoriesResult>());
    });

    test("should request failed", () async {
      when(client.get("https://www.themealdb.com/api/json/v1/1/categories.php"))
          .thenAnswer((_) async => http.Response(Meals().toString(), 404),
      );

      expect(await mealsApi.categoryList(), isA<CategoriesResult>());
    });
  });

  group("Request Seafood test", () {
    test("should request complete", () async {
      when(client.get("https://www.themealdb.com/api/json/v1/1/filter.php?c=Seafood"))
          .thenAnswer((_) async => http.Response(Meals().toString(), 200),
      );

      expect(await mealsApi.mealsList("Seafood"), isA<MealsResult>());
    });

    test("should request failed", () async {
      when(client.get("https://www.themealdb.com/api/json/v1/1/filter.php?c=Seafood"))
          .thenAnswer((_) async => http.Response(Meals().toString(), 404),
      );

      expect(await mealsApi.mealsList("Seafood"), isA<MealsResult>());
    });
  });

  group("Request Dessert test", () {
    test("should request complete", () async {
      when(client.get("https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert"))
          .thenAnswer((_) async => http.Response(Meals().toString(), 200),
      );

      expect(await mealsApi.mealsList("Dessert"), isA<MealsResult>());
    });

    test("should request failed", () async {
      when(client.get("https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert"))
          .thenAnswer((_) async => http.Response(Meals().toString(), 404),
      );

      expect(await mealsApi.mealsList("Seafood"), isA<MealsResult>());
    });
  });
}