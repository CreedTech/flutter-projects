import 'package:cocktail_app/model/cock_tail_model.dart';
import 'package:cocktail_app/model/cocktail_detail_model.dart';
import 'package:cocktail_app/services/cock_tail_api_service.dart';
import 'package:get/get.dart';

class CockTailController extends GetxController {
  var isLoading = true.obs;
  var drinkList = CocktailModel(drinks: []).obs;

  @override
  void onInit() {
    super.onInit();
    fetchDrinkMenuList();
  }

  void fetchDrinkMenuList() async {
    try {
      isLoading(true);
      CocktailModel drinks = await ApiService.getDrink();
      if (drinks.drinks.isNotEmpty) {
        drinkList.value = drinks;
      } else {
        return null;
      }
    } finally {
      isLoading(false);
    }
  }
}

class CockTailControllerII extends GetxController {
  var isLoading = true.obs;
  var drinkList = CocktailModel(drinks: []).obs;

  @override
  void onInit() {
    super.onInit();
    fetchDrinkMenuList();
  }

  void fetchDrinkMenuList() async {
    try {
      isLoading(true);
      CocktailModel drinks = await ApiService.getDrinkII();
      if (drinks.drinks.isNotEmpty) {
        drinkList.value = drinks;
      } else {
        return null;
      }
    } finally {
      isLoading(false);
    }
  }
}

class AlcoholicController extends GetxController {
  var isLoading = true.obs;
  var drinkList = CocktailModel(drinks: []).obs;

  @override
  void onInit() {
    super.onInit();
    fetchDrinkMenuList();
  }

  void fetchDrinkMenuList() async {
    try {
      isLoading(true);
      CocktailModel drinks = await ApiService.getAlcoholic();
      if (drinks.drinks.isNotEmpty) {
        drinkList.value = drinks;
      } else {
        return null;
      }
    } finally {
      isLoading(false);
    }
  }
}

class CockTailDetailController extends GetxController {
  var isLoading = true.obs;
  var drinkList = CockDetailModel(
          drinks: Drinks(
              strIngredient4: '',
              strIngredient10: '',
              strIngredient13: '',
              strMeasure10: '',
              strInstructionsZHHANT: '',
              strVideo: '',
              strMeasure14: '',
              strInstructionsIT: '',
              strMeasure15: '',
              strDrinkAlternate: '',
              strIngredient3: '',
              strImageSource: '',
              strMeasure2: '',
              strIngredient1: '',
              strMeasure1: '',
              strIngredient14: '',
              strDrink: '',
              strIngredient2: '',
              strIngredient5: '',
              strIngredient8: '',
              strMeasure12: '',
              strMeasure5: '',
              strInstructionsES: '',
              strMeasure4: '',
              strAlcoholic: '',
              strMeasure13: '',
              strMeasure6: '',
              strIngredient12: '',
              strTags: '',
              strInstructionsZHHANS: '',
              strIngredient9: '',
              strMeasure9: '',
              idDrink: '',
              strGlass: '',
              strImageAttribution: '',
              strIngredient11: '',
              strIngredient6: '',
              strCategory: '',
              strDrinkThumb: '',
              strInstructions: '',
              strInstructionsFR: '',
              strIBA: '',
              strInstructionsDE: '',
              strMeasure11: '',
              strMeasure7: '',
              dateModified: '',
              strIngredient15: '',
              strMeasure3: '',
              strCreativeCommonsConfirmed: '',
              strMeasure8: '',
              strIngredient7: ''))
      .obs;

  @override
  void onInit() {
    super.onInit();
    fetchDrinkMenuList();
  }

  void fetchDrinkMenuList() async {
    try {
      isLoading(true);
      CockDetailModel drinks = await ApiService.getDrinkFullDetails();
      drinkList.value = drinks;
    }

    finally {
      isLoading(false);
    }
  }
}
