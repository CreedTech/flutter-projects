import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Details extends StatelessWidget {
  const Details(
      {Key? key,
      required this.title,
      required this.company,
      required this.rating,
      required this.gamePrice,
      required this.imageUrl,
      required this.backgroundImageUrl})
      : super(key: key);
  final String title;
  final String company;
  final String rating;
  final String gamePrice;
  final String imageUrl;
  final String backgroundImageUrl;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: size.height * 0.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                          image: AssetImage(backgroundImageUrl),
                          fit: BoxFit.cover),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () => Get.back(),
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 50, horizontal: 20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: const EdgeInsets.all(10),
                            child: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.black,
                              size: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: size.height * 0.45,
                    left: 0,
                    right: 0,
                    child: Container(
                      // margin: EdgeInsets.all(10),
                      height: size.height,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(26),
                          topRight: Radius.circular(26),
                        ),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
