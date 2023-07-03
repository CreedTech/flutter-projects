import 'package:flutter/material.dart';
import 'package:food_order_ui/view/home_page/widgets/categories_screen.dart';
import 'package:food_order_ui/view/home_page/widgets/discount_card.dart';
import 'package:food_order_ui/view/home_page/widgets/popular.dart';
import 'package:food_order_ui/view/home_page/widgets/recommend.dart';
import 'package:food_order_ui/view/home_page/widgets/search_foods.dart';
import 'package:food_order_ui/view/home_page/widgets/username_text.dart';

import '../styles/size_config.dart';
import 'component/food_part.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: const [
            UserNameText(),
            SearchFood(),
            DiscountCard(),
            FoodPart(partName: "Categories"),
            FoodCategories(),
            FoodPart(partName: "Recommend"),
            RecommendFoods(),
            FoodPart(partName: "Popular"),
            PopularFoods(),
          ],
        ),
      ),
    );
  }
}
