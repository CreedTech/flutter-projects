import 'package:flutter/material.dart';
import 'package:food_order_ui/view/login/login_page.dart';
import '../../styles/size_config.dart';

class SearchFood extends StatefulWidget {
  const SearchFood({Key? key}) : super(key: key);

  @override
  _SearchFoodState createState() => _SearchFoodState();
}

class _SearchFoodState extends State<SearchFood> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          SizeConfig.screenWidth! / 34.25, // 12.0
          SizeConfig.screenHeight! / 170.75, // 4.0
          SizeConfig.screenWidth! / 41.1, // 10.0
          SizeConfig.screenHeight! / 170.75, // 4.0
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
                // Todo change later to search page
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()));
            print("hello");
          },
          child: Container(
            height: SizeConfig.screenHeight! / 13.66, // 50
            width: SizeConfig.screenHeight! / 1.068, // 385
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(20.0),
              ),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 4),
                  blurRadius: 6,
                  color: Colors.black.withOpacity(0.6),
                ),
              ],
            ),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Icon(
                    Icons.search,
                    color: Colors.black26,
                  ),
                ),
                Text(
                  "Search",
                  style: TextStyle(
                    color: Colors.black26,
                    fontSize: SizeConfig.screenHeight! / 42.69, // 16
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
