import 'package:http/http.dart' as http;
import 'package:mealsapp/network/api/api_provider.dart';
import 'package:mealsapp/network/model/categories.dart';
import 'package:mealsapp/network/model/meals.dart';
import 'package:mockito/mockito.dart';
import 'package:test_api/test_api.dart';

class ApiTest extends Mock implements http.Client {}

main() {
  MealsApi mealsApi = MealsApi();
  final client = ApiTest();

  /// Unit testing for banner request
  group("Request Banner test", () {
    test("should request complete", () async {
      when(client.get("https://www.themealdb.com/api/json/v1/1/categories.php"))
          .thenAnswer(
        (_) async => http.Response(Meals().toString(), 200),
      );

      expect(await mealsApi.categoryList(), isA<CategoriesResult>());
    });

    test("should request failed", () async {
      when(client.get("https://www.themealdb.com/api/json/v1/1/categories.php"))
          .thenAnswer(
        (_) async => http.Response(Meals().toString(), 404),
      );

      expect(await mealsApi.categoryList(), isA<CategoriesResult>());
    });
  });

  /// Unit testing for seafood request
  group("Request Seafood test", () {
    test("should request complete", () async {
      when(client.get(
              "https://www.themealdb.com/api/json/v1/1/filter.php?c=Seafood"))
          .thenAnswer(
        (_) async => http.Response(Meals().toString(), 200),
      );

      expect(await mealsApi.mealsList("Seafood"), isA<MealsResult>());
    });

    test("should request failed", () async {
      when(client.get(
              "https://www.themealdb.com/api/json/v1/1/filter.php?c=Seafood"))
          .thenAnswer(
        (_) async => http.Response(Meals().toString(), 404),
      );

      expect(await mealsApi.mealsList("Seafood"), isA<MealsResult>());
    });
  });

  /// Unit testing for dessert request
  group("Request Dessert test", () {
    test("should request complete", () async {
      when(client.get(
              "https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert"))
          .thenAnswer(
        (_) async => http.Response(Meals().toString(), 200),
      );

      expect(await mealsApi.mealsList("Dessert"), isA<MealsResult>());
    });

    test("should request failed", () async {
      when(client.get(
              "https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert"))
          .thenAnswer(
        (_) async => http.Response(Meals().toString(), 404),
      );

      expect(await mealsApi.mealsList("Seafood"), isA<MealsResult>());
    });
  });
}
