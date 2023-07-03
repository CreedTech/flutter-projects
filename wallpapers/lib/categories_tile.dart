import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'categories_screen.dart';

class CategoriesTile extends StatelessWidget {
  const CategoriesTile(
      {Key? key, required this.imgUrls, required this.categoriesName})
      : super(key: key);
  final String imgUrls, categoriesName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context, MaterialPageRoute(
          builder: (context) => CategoriesScreen(
            categories: categoriesName,
          ),
        ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: imgUrls,
                    height: 80,
                    width: 120,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  width: 100,
                  alignment: Alignment.center,
                  child: Center(
                    child: Text(
                      categoriesName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Overpass'
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
