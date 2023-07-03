import 'package:flutter/material.dart';
import 'package:food_order_ui/models/category.dart';
import 'package:food_order_ui/view/styles/size_config.dart';

class FoodCategories extends StatefulWidget {
  const FoodCategories({Key? key}) : super(key: key);

  @override
  _FoodCategoriesState createState() => _FoodCategoriesState();
}

class _FoodCategoriesState extends State<FoodCategories> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Category>>(
      // Todo change bringTheCategory
      future: bringTheCategory(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var categoryList = snapshot.data;
          return SizedBox(
            height: SizeConfig.screenHeight! / 8.04,
            // 85.0
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categoryList!.length,
              itemBuilder: (context, index) {
                var category = categoryList[index];
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.fromLTRB(
                          SizeConfig.screenWidth! / 34.25,
                          // 12.0
                          SizeConfig.screenHeight! / 170.75,
                          // 4.0
                          SizeConfig.screenWidth! / 20.55,
                          // 20.0
                          SizeConfig.screenHeight! / 170.75,
                          // 4.0
                        ),
                        height: SizeConfig.screenHeight! / 15.18,
                        // 45.0
                        width: SizeConfig.screenWidth! / 9.14,
                        // 45.0
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(category.categoryImage),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          category.categoryName,
                          style: TextStyle(
                              fontSize: SizeConfig.screenHeight! / 52.54, // 13
                              color: Colors.black45),
                        )
                      ],
                    ),
                  ],
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

  bringTheCategory() {}
}
