import 'package:cached_network_image/cached_network_image.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:drinks_app/controller/cocktail_controller.dart';
import 'package:drinks_app/main.dart';
import 'package:drinks_app/view/details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  final CockTailController cockTailController = Get.put(CockTailController());
  final CockTailControllerII cockTailControllerII = Get.put(CockTailControllerII());
  final AlcoholicController alcoholicController = Get.put(AlcoholicController());

  late TabController tabController;
  late String? internetStatus = "";
  late String? contentMessage = "";

  checkConnection(BuildContext context) async{
    var listener = DataConnectionChecker().onStatusChange.listen((status){
      switch(status){
        case DataConnectionStatus.connected:
          internetStatus = 'Connected to the Internet';
          contentMessage = 'Connected to the Internet';
          // _showDialog(internetStatus, contentMessage,context);
          break;
        case DataConnectionStatus.disconnected:
          internetStatus = 'Not Connected to the Internet';
          contentMessage = 'Not Connected to the Internet';
          // _showDialog(internetStatus, contentMessage,context);
          break;
      }
    });
    return await DataConnectionChecker().connectionStatus;
  }

  @override
  void initState() {
    super.initState();
    checkConnection(context);
    tabController = TabController(length: 3, vsync: this);
  }

  String returnDay(DateTime date) {
    return DateFormat.yMMMd().format(date);
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
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
                          'Hello ${box.get(userName)}',
                          style: const TextStyle(
                            fontSize: 22,
                            letterSpacing: 1.2,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          returnDay(DateTime.now()),
                          style: const TextStyle(
                            letterSpacing: 1.2,
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                    Hero(
                      tag: 'Logo',
                      child: Container(
                        width: 80,
                        height: 120,
                        decoration: BoxDecoration(
                          color: kBackgroundColorII,
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/logo.gif'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              TabBar(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                indicator: BoxDecoration(
                  color: kBackgroundColor,
                  border: Border.all(color: kBackgroundColorII, width: 3.0),
                  borderRadius: BorderRadius.circular(20),
                ),
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
                height: 300,
                child: TabBarView(
                  controller: tabController,
                  children: [
                    SizedBox(
                      height: 300,
                      child: Obx((){
                        if(cockTailController.isLoading.value){
                          return const Center(
                              child: CircularProgressIndicator(),
                            // child: Text(
                            //   internetStatus!,
                            //   style: const TextStyle(
                            //     color: Colors.white,
                            //     fontWeight: FontWeight.bold,
                            //     fontSize: 20
                            //   ),
                            // ),
                        );
                        } else if(cockTailController.drinkList.value.drinks.isEmpty){
                          return const Center(
                              child: Text('No Drink is available'));
                        } else {
                          return ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: cockTailController.drinkList.value.drinks.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index){
                              final connect = cockTailController.drinkList.value.drinks[index];
                              return GestureDetector(
                                onTap: (){
                                  box.put(
                                    'value',
                                      cockTailController.drinkList.value.drinks[index].strDrink
                                  );
                                  Get.to(const DetailsScreen());
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
                                              child: CircularProgressIndicator(),
                                            ),
                                            errorWidget: (context, url, error) =>
                                            const Center(
                                              child: Icon(Icons.warning),
                                            ),
                                          ),
                                          Container(
                                            width: 360,
                                            height: 400,
                                            color: Colors.black.withOpacity(0.5),
                                          ),
                                          Positioned(
                                            left: 15,
                                            bottom: 15,
                                            child: Text(
                                              connect.strDrink,
                                              style: const TextStyle(
                                                fontSize: 20,
                                                letterSpacing: 1.2
                                              ),
                                            ),
                                          ),
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
                      child: Obx((){
                        if(cockTailControllerII.isLoading.value){
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if(cockTailControllerII.drinkList.value.drinks.isEmpty){
                          return const Center(
                            child: Text('No Drink is available'),
                          );
                        } else {
                          return ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: cockTailControllerII.drinkList.value.drinks.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index){
                              final connect = cockTailControllerII.drinkList.value.drinks[index];
                              return GestureDetector(
                                onTap: (){
                                  box.put(
                                    'value',cockTailControllerII.drinkList.value.drinks[index].strDrink
                                  );
                                  Get.to(const DetailsScreen());
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
                                              child: CircularProgressIndicator(),
                                            ),
                                            errorWidget: (context, url, error) =>
                                            const Center(
                                              child: Icon(Icons.warning),
                                            ),
                                          ),
                                          Container(
                                            width: 360,
                                            height: 400,
                                            color: Colors.black.withOpacity(0.5),
                                          ),
                                          Positioned(
                                            left: 15,
                                            bottom: 15,
                                            child: Text(
                                              connect.strDrink,
                                              style: const TextStyle(
                                                fontSize: 20,
                                                letterSpacing: 1.2,
                                              ),
                                            ),
                                          ),
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
                      child: Obx((){
                        if(alcoholicController.isLoading.value){
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if(alcoholicController.drinkList.value.drinks.isEmpty){
                          return const Center(
                            child: Text('No Drink is available'),
                          );
                        } else {
                          return ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: alcoholicController.drinkList.value.drinks.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index){
                              final connect = alcoholicController.drinkList.value.drinks[index];
                              return GestureDetector(
                                onTap: (){
                                  box.put(
                                      'value',alcoholicController.drinkList.value.drinks[index].strDrink
                                  );
                                  Get.to(const DetailsScreen());
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
                                              child: CircularProgressIndicator(),
                                            ),
                                            errorWidget: (context, url, error) =>
                                            const Center(
                                              child: Icon(Icons.warning),
                                            ),
                                          ),
                                          Container(
                                            width: 360,
                                            height: 400,
                                            color: Colors.black.withOpacity(0.5),
                                          ),
                                          Positioned(
                                            left: 15,
                                            bottom: 15,
                                            child: Text(
                                              connect.strDrink,
                                              style: const TextStyle(
                                                fontSize: 20,
                                                letterSpacing: 1.2,
                                              ),
                                            ),
                                          ),
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