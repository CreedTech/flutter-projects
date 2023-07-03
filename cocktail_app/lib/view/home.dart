import 'package:cached_network_image/cached_network_image.dart';
import 'package:cocktail_app/controller/cock_tail_controller.dart';
import 'package:cocktail_app/main.dart';
import 'package:cocktail_app/view/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> with TickerProviderStateMixin {
  final CockTailController controller = Get.put(CockTailController());
  final CockTailControllerII controllerII = Get.put(CockTailControllerII());
  final AlcoholicController alcoholicController =
      Get.put(AlcoholicController());
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  String returnDay(DateTime date) {
    return DateFormat.yMMMd().format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColors,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 50, left: 20, bottom: 30, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello ' '${box.get('username')}',
                          style: const TextStyle(
                              fontSize: 22,
                              letterSpacing: 1.2,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          returnDay(DateTime.now()),
                          style: const TextStyle(
                              letterSpacing: 1.2,
                              fontSize: 18,
                              fontWeight: FontWeight.w200),
                        ),
                      ],
                    ),
                    Hero(
                      tag: 'a',
                      child: Container(
                        width: 80,
                        height: 120,
                        decoration: BoxDecoration(
                            color: kBackgroundColorII,
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/logo.gif'))),
                      ),
                    )
                  ],
                ),
              ),
              TabBar(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                indicator: BoxDecoration(
                    color: kBackgroundColors,
                    border: Border.all(color: kBackgroundColorII, width: 3.0),
                    borderRadius: BorderRadius.circular(20)),
                isScrollable: true,
                controller: tabController,
                tabs: [
                  Tab(
                    child: Row(
                      children: const [
                        Icon(Icons.local_drink),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Ordinary Drink'),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      children: const [
                        Icon(Icons.local_drink_outlined),
                        SizedBox(
                          width: 10,
                        ),
                        Text('CockTail Drink'),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      children: const [
                        Icon(Icons.local_drink_outlined),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Alcoholic Drink'),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                height: 380,
                child: TabBarView(
                  controller: tabController,
                  children: [
                    SizedBox(
                      height: 380,
                      child: Obx(() {
                        if (controller.isLoading.value) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (controller.drinkList.value.drinks.isEmpty) {
                          return const Center(
                              child: Text('No Drink is available'));
                        } else {
                          return ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: controller.drinkList.value.drinks.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              final connect =
                                  controller.drinkList.value.drinks[index];
                              return GestureDetector(
                                onTap: () {
                                  box.put(
                                      'value',
                                      controller.drinkList.value.drinks[index]
                                          .strDrink);
                                  Get.to(const DetailScreen());
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Stack(children: [
                                          CachedNetworkImage(
                                            filterQuality: FilterQuality.high,
                                            fit: BoxFit.fill,
                                            imageUrl: connect.strDrinkThumb,
                                            placeholder: (context, url) =>
                                                const Center(
                                                    child:
                                                        CircularProgressIndicator()),
                                            errorWidget: (context, url,
                                                    error) =>
                                                const Center(
                                                    child: Icon(Icons.warning)),
                                          ),
                                          Container(
                                            width: 360,
                                            height: 400,
                                            color:
                                                Colors.black.withOpacity(0.5),
                                          ),
                                          Positioned(
                                              left: 15,
                                              bottom: 15,
                                              child: Text(
                                                connect.strDrink,
                                                style: const TextStyle(
                                                    fontSize: 20,
                                                    letterSpacing: 1.2),
                                              ))
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      }),
                    ),
                    SizedBox(
                      height: 380,
                      child: Obx(() {
                        if (controllerII.isLoading.value) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (controllerII
                            .drinkList.value.drinks.isEmpty) {
                          return const Center(
                              child: Text('No Drink is available'));
                        } else {
                          return ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount:
                                controllerII.drinkList.value.drinks.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              final connect =
                                  controllerII.drinkList.value.drinks[index];
                              return GestureDetector(
                                onTap: () {
                                  box.put(
                                      'value',
                                      controllerII.drinkList.value.drinks[index]
                                          .strDrink);
                                  Get.to(const DetailScreen());
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Stack(
                                        children: [
                                          CachedNetworkImage(
                                            filterQuality: FilterQuality.high,
                                            fit: BoxFit.fill,
                                            imageUrl: connect.strDrinkThumb,
                                            placeholder: (context, url) =>
                                                const Center(
                                                    child:
                                                        CircularProgressIndicator()),
                                            errorWidget: (context, url,
                                                    error) =>
                                                const Center(
                                                    child: Icon(Icons.warning)),
                                          ),
                                          Container(
                                            width: 360,
                                            height: 400,
                                            color:
                                                Colors.black.withOpacity(0.5),
                                          ),
                                          Positioned(
                                              left: 15,
                                              bottom: 15,
                                              child: Text(
                                                connect.strDrink,
                                                style: const TextStyle(
                                                    fontSize: 20,
                                                    letterSpacing: 1.2),
                                              ))
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      }),
                    ),
                    SizedBox(
                      height: 380,
                      child: Obx(() {
                        if (alcoholicController.isLoading.value) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (alcoholicController
                            .drinkList.value.drinks.isEmpty) {
                          return const Center(
                              child: Text('No Drink is available'));
                        } else {
                          return ListView.builder(

                            physics: const BouncingScrollPhysics(),
                            itemCount: alcoholicController
                                .drinkList.value.drinks.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              final connect = alcoholicController
                                  .drinkList.value.drinks[index];
                              return GestureDetector(
                                onTap: () {
                                  box.put(
                                      'value',
                                      alcoholicController.drinkList.value.drinks[index]
                                          .strDrink);
                                  Get.to(const DetailScreen());
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Stack(
                                        children: [
                                          CachedNetworkImage(
                                            filterQuality: FilterQuality.high,
                                            fit: BoxFit.fill,
                                            imageUrl: connect.strDrinkThumb,
                                            placeholder: (context, url) =>
                                                const Center(
                                                    child:
                                                        CircularProgressIndicator()),
                                            errorWidget: (context, url,
                                                    error) =>
                                                const Center(
                                                    child: Icon(Icons.warning)),
                                          ),
                                          Container(
                                            width: 360,
                                            height: 400,
                                            color:
                                                Colors.black.withOpacity(0.5),
                                          ),
                                          Positioned(
                                              left: 15,
                                              bottom: 15,
                                              child: Text(
                                                connect.strDrink,
                                                style: const TextStyle(
                                                    fontSize: 20,
                                                    letterSpacing: 1.2),
                                              ))
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
