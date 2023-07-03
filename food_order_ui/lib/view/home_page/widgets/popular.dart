import 'package:flutter/material.dart';
import 'package:food_order_ui/models/food.dart';
import 'package:food_order_ui/models/food_list.dart';
import 'package:food_order_ui/view/styles/colors.dart';
import '../../styles/size_config.dart';

class PopularFoods extends StatefulWidget {
  const PopularFoods({Key? key}) : super(key: key);

  @override
  _PopularFoodsState createState() => _PopularFoodsState();
}

class _PopularFoodsState extends State<PopularFoods> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Food>>(
      future: bringTheFoods(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var foodList = snapshot.data;
          return SizedBox(
            height: SizeConfig.screenHeight! / 2.28, // 300
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: foodList!.length,
              itemBuilder: (context, index) {
                var food = foodList[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            // Todo change FoodDetailsView
                            builder: (context) => FoodDetailView(food: food)));
                  },
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(
                          SizeConfig.screenWidth! / 34.25, // 12.0
                          SizeConfig.screenHeight! / 170.75, // 4.0
                          SizeConfig.screenWidth! / 41.1, // 10.0
                          SizeConfig.screenHeight! / 170.75, // 4.0
                        ),
                        height: SizeConfig.screenHeight! / 2.73, // 250.0
                        width: SizeConfig.screenWidth! / 2.055, // 200
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(4, 6),
                                blurRadius: 6,
                                color: Colors.black.withOpacity(0.3),
                              )
                            ]),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height:
                                      SizeConfig.screenHeight! / 6.83, // 100.0
                                  // width: SizeConfig.screenWidth!/2.74,           // 150.0
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(food.foodImageName),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20.0),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        food.foodName,
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: SizeConfig.screenHeight! /
                                                34.15, // 20
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        food.foodCategory,
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: SizeConfig.screenHeight! /
                                                42.69, // 16
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: SizeConfig.screenHeight! /
                                                136.6), // 5.0
                                        child: Text(
                                          "\$${food.foodPrice}",
                                          style: TextStyle(
                                              color: buttonColor,
                                              fontSize:
                                                  SizeConfig.screenHeight! /
                                                      37.95, // 18
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                height: SizeConfig.screenHeight! / 13.66, // 50
                                width: SizeConfig.screenWidth! / 8.22, // 50
                                decoration: BoxDecoration(
                                    color: buttonColor,
                                    borderRadius: const BorderRadius.only(
                                      bottomRight: Radius.circular(20.0),
                                      topLeft: Radius.circular(20.0),
                                    )),
                                child: const Icon(
                                  Icons.shopping_cart_rounded,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        } else {
          return const Center();
        }
      },
    );
  }

  FoodDetailView({required Food food}) {}
}
