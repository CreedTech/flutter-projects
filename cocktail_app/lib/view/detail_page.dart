import 'package:cached_network_image/cached_network_image.dart';
import 'package:cocktail_app/controller/cock_tail_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../main.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final CockTailDetailController controller =
      Get.put(CockTailDetailController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: kBackgroundColors,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Obx(
              () => controller.isLoading.isTrue
                  ? Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(35),
                      margin: const EdgeInsets.only(top: 350),
                      child: const CircularProgressIndicator())
                  : Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: size.height,
                          child: Stack(
                            children: [
                              CachedNetworkImage(
                                width: double.infinity,
                                height: size.height * 0.4,
                                fit: BoxFit.fill,
                                imageUrl: controller
                                    .drinkList.value.drinks.strDrinkThumb,
                                placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) =>
                                    const Center(child: Icon(Icons.warning)),
                              ),
                              Positioned(
                                  child: Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                decoration: BoxDecoration(
                                    color: kBackgroundColors,
                                    borderRadius: BorderRadius.circular(10)),
                                child: IconButton(
                                  onPressed: () => Get.back(),
                                  icon: const Icon(Icons.arrow_back_ios),
                                ),
                              )),
                              Positioned(
                                bottom: 0,
                                child: Container(
                                  width: size.width,
                                  height: size.height * 0.6 + 25,
                                  decoration: BoxDecoration(
                                    color: kBackgroundColorII,
                                    borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(30),
                                      topLeft: Radius.circular(30),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 40, left: 20, right: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller
                                              .drinkList.value.drinks.strDrink,
                                          style: const TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1.2),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          controller.drinkList.value.drinks
                                              .strCategory,
                                          style: const TextStyle(
                                              color: Colors.white60,
                                              fontSize: 14,
                                              letterSpacing: 1.2),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        const Text(
                                          'Instructions',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1.2),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          controller.drinkList.value.drinks
                                                  .strInstructions.isEmpty
                                              ? "Instruction Isn't Available"
                                              : controller.drinkList.value
                                                  .drinks.strInstructions,
                                          textAlign: TextAlign.justify,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w100,
                                              letterSpacing: 1.2),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: const [
                                            Text(
                                              'Ingredient',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                  letterSpacing: 1.2),
                                            ),
                                            Text(
                                              'Measurement',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                  letterSpacing: 1.2),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Column(
                                          children: [
                                            IngredientCompo(
                                              measurement: controller.drinkList
                                                  .value.drinks.strMeasure1,
                                              ingredient: controller.drinkList
                                                  .value.drinks.strIngredient1,
                                            ),
                                            IngredientCompo(
                                              measurement: controller.drinkList
                                                  .value.drinks.strMeasure2,
                                              ingredient: controller.drinkList
                                                  .value.drinks.strIngredient2,
                                            ),
                                            IngredientCompo(
                                              measurement: controller.drinkList
                                                  .value.drinks.strMeasure3,
                                              ingredient: controller.drinkList
                                                  .value.drinks.strIngredient3,
                                            ),
                                            IngredientCompo(
                                              measurement: controller.drinkList
                                                  .value.drinks.strMeasure4,
                                              ingredient: controller.drinkList
                                                  .value.drinks.strIngredient4,
                                            ),
                                            IngredientCompo(
                                              measurement: controller.drinkList
                                                  .value.drinks.strMeasure5,
                                              ingredient: controller.drinkList
                                                  .value.drinks.strIngredient5,
                                            ),
                                            IngredientCompo(
                                              measurement: controller.drinkList
                                                  .value.drinks.strMeasure6,
                                              ingredient: controller.drinkList
                                                  .value.drinks.strIngredient6,
                                            ),
                                            IngredientCompo(
                                              measurement: controller.drinkList
                                                  .value.drinks.strMeasure7,
                                              ingredient: controller.drinkList
                                                  .value.drinks.strIngredient7,
                                            ),
                                            IngredientCompo(
                                              measurement: controller.drinkList
                                                  .value.drinks.strMeasure8,
                                              ingredient: controller.drinkList
                                                  .value.drinks.strIngredient8,
                                            ),
                                            IngredientCompo(
                                              measurement: controller.drinkList
                                                  .value.drinks.strMeasure9,
                                              ingredient: controller.drinkList
                                                  .value.drinks.strIngredient9,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ));
  }
}

class IngredientCompo extends StatelessWidget {
  final String ingredient;
  final String measurement;

  const IngredientCompo({
    Key? key,
    required this.ingredient,
    required this.measurement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            ingredient,
            textAlign: TextAlign.justify,
            style: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.w100, letterSpacing: 1.2),
          ),
          Text(
            measurement,
            textAlign: TextAlign.justify,
            style: const TextStyle(
                color: Colors.white60,
                fontSize: 14,
                fontWeight: FontWeight.w100,
                letterSpacing: 1.2),
          ),
        ],
      ),
    );
  }
}
