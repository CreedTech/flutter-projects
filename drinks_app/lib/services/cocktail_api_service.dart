import 'package:dio/dio.dart';
import 'package:drinks_app/model/cocktail_model.dart';
import 'package:drinks_app/model/cocktail_detail_model.dart';

import '../main.dart';

var apiLink =
    'https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Ordinary_Drink';
var apiLinkII =
    'https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail';
var apiLinkAlcoholic =
    'https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Alcoholic';
var apiLinkNonAlcoholic =
    'www.thecocktaildb.com/api/json/v1/1/filter.php?a=Non_Alcoholic';

var apiLinkDetails =
    'https://www.thecocktaildb.com/api/json/v1/1/search.php?s=';
final Dio _dio = Dio();

class ApiService {
  static Future getDrink() async {
    var request = await _dio.get(apiLink);
    if (request.statusCode == 200) {
      final data = request.data;
      CocktailModel cocktailModel = CocktailModel.fromJson(data);
      return cocktailModel;
    } else {
      return null;
    }
  }

  static Future getDrinkII() async {
    var request = await _dio.get(apiLinkII);
    if (request.statusCode == 200) {
      final data = request.data;
      CocktailModel cocktailModel = CocktailModel.fromJson(data);
      return cocktailModel;
    } else {
      return null;
    }
  }

  static Future getAlcoholic() async {
    var request = await _dio.get(apiLinkAlcoholic);
    if (request.statusCode == 200) {
      final data = request.data;
      CocktailModel cocktailModel = CocktailModel.fromJson(data);
      return cocktailModel;
    } else {
      return null;
    }
  }

  static Future getDrinkFullDetails() async {
    final Dio _dio = Dio();
    var request = await _dio.get(
        'https://www.thecocktaildb.com/api/json/v1/1/search.php?s=' +
            box.get('value'));
    if (request.statusCode == 200) {
      final data = request.data;
      print(data['drinks']);
      return CockDetailModel(
        drinks: Drinks(
          strIngredient4: data['drinks'][0]['strIngredient4'] ?? '',
          strIngredient10: data['drinks'][0]['strIngredient10'] ?? '',
          strIngredient13: data['drinks'][0]['strIngredient13'] ?? '',
          strMeasure10: data['drinks'][0]['strMeasure10'] ?? '',
          strInstructionsZHHANT:
          data['drinks'][0]['strInstructionsZHHANT'] ?? '',
          strVideo: data['drinks'][0]['strVideo'] ?? '',
          strMeasure14: data['drinks'][0]['strMeasure14'] ?? '',
          strInstructionsIT: data['drinks'][0]['strInstructionsIT'] ?? '',
          strMeasure15: data['drinks'][0]['strMeasure15'] ?? '',
          strDrinkAlternate: data['drinks'][0]['strDrinkAlternate'] ?? '',
          strIngredient3: data['drinks'][0]['strIngredient3'] ?? '',
          strImageSource: data['drinks'][0]['strImageSource'] ?? '',
          strMeasure2: data['drinks'][0]['strMeasure2'] ?? '',
          strIngredient1: data['drinks'][0]['strIngredient1'] ?? '',
          strMeasure1: data['drinks'][0]['strMeasure1'] ?? '',
          strIngredient14: data['drinks'][0]['strIngredient14'] ?? '',
          strDrink: data['drinks'][0]['strDrink'] ?? '',
          strIngredient2: data['drinks'][0]['strIngredient2'] ?? '',
          strIngredient5: data['drinks'][0]['strIngredient5'] ?? '',
          strIngredient8: data['drinks'][0]['strIngredient8'] ?? '',
          strMeasure12: data['drinks'][0]['strMeasure12'] ?? '',
          strMeasure5: data['drinks'][0]['strMeasure5'] ?? '',
          strInstructionsES: data['drinks'][0]['strInstructionsES'] ?? '',
          strMeasure4: data['drinks'][0]['strMeasure4'] ?? '',
          strAlcoholic: data['drinks'][0]['strAlcoholic'] ?? '',
          strMeasure13: data['drinks'][0]['strMeasure13'] ?? '',
          strMeasure6: data['drinks'][0]['strMeasure6'] ?? '',
          strIngredient12: data['drinks'][0]['strIngredient12'] ?? '',
          strTags: data['drinks'][0]['strTags'] ?? '',
          strInstructionsZHHANS:
          data['drinks'][0]['strInstructionsZHHANS'] ?? '',
          strIngredient9: data['drinks'][0]['strIngredient9'] ?? '',
          strMeasure9: data['drinks'][0]['strMeasure9'] ?? '',
          idDrink: data['drinks'][0]['idDrink'] ?? '',
          strGlass: data['drinks'][0]['strGlass'],
          strImageAttribution:
          data['drinks'][0]['strImageAttribution'] ?? '' ?? '',
          strIngredient11: data['drinks'][0]['strIngredient11'] ?? '',
          strIngredient6: data['drinks'][0]['strIngredient6'] ?? '',
          strCategory: data['drinks'][0]['strCategory'] ?? '',
          strDrinkThumb: data['drinks'][0]['strDrinkThumb'] ?? '',
          strInstructions: data['drinks'][0]['strInstructions'] ?? '',
          strInstructionsFR: data['drinks'][0]['strInstructionsFR'] ?? '',
          strIBA: data['drinks'][0]['strIBA'] ?? '',
          strInstructionsDE: data['drinks'][0]['strInstructionsDE'] ?? '',
          strMeasure11: data['drinks'][0]['strMeasure11'] ?? '',
          strMeasure7: data['drinks'][0]['strMeasure7'] ?? '',
          dateModified: data['drinks'][0]['dateModified'] ?? '',
          strIngredient15: data['drinks'][0]['strIngredient15'] ?? '',
          strMeasure3: data['drinks'][0]['strMeasure3'] ?? '',
          strCreativeCommonsConfirmed:
          data['drinks'][0]['strCreativeCommonsConfirmed'] ?? '',
          strMeasure8: data['drinks'][0]['strMeasure8'] ?? '',
          strIngredient7: data['drinks'][0]['strIngredient7'] ?? '',
        ),
      );
    } else {
      return null;
    }
  }
}