import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gaming_ui/components/game_list.dart';
import 'package:gaming_ui/style/style.dart';
import 'package:gaming_ui/view/details.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: TextFormField(
                decoration: searchInputCompo(),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Divider(
              thickness: 1,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
              child: Column(
                children: [
                  Text(
                    'Found ${gameList.length} results',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: ListView.builder(
                  itemCount: gameList.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    GameList connect = gameList[index];
                    return InkWell(
                      onTap: () => Get.to(Details(
                        rating: '',
                        imageUrl: '',
                        company: '',
                        backgroundImageUrl: connect.backgroundImageUrl,
                        gamePrice: '',
                        title: '',
                      ),),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 30),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.asset(
                                connect.imageUrl,
                                fit: BoxFit.cover,
                                width: 100,
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 110,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20),
                                decoration: const BoxDecoration(
                                    color: Color(0xfff5f5fc),
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        bottomRight: Radius.circular(10))),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      connect.title,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w700),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(connect.company,
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700,
                                        )),
                                    const SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.star,
                                              color: Color(0xff6459d0),
                                            ),
                                            const SizedBox(width: 5),
                                            Text(connect.rating),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 40,
                                        ),
                                        Text(
                                          connect.gamePrice,
                                          style: const TextStyle(
                                              color: Color(0xff766ad8),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
