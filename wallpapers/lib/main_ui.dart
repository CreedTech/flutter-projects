import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpapers/album_controller.dart';
import 'package:wallpapers/category_model.dart';
import 'package:wallpapers/search_view.dart';
import 'package:shimmer/shimmer.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:wallpapers/services/connection_util.dart';
import 'categories_tile.dart';
import 'image_ui.dart';

class MainUI extends StatefulWidget {
  const MainUI({Key? key}) : super(key: key);

  @override
  _MainUIState createState() => _MainUIState();
}

class _MainUIState extends State<MainUI> with TickerProviderStateMixin {
  bool hasInterNetConnection = false;
  // late StreamSubscription<InternetConnectionStatus> listener;
  final AlbumController albumController = Get.put(AlbumController());
  var internetStatus = "Unknown";

  // late String internetStatus = "";
  // late String contentMessage = "";

  // checkConnection(BuildContext context) async {
  //   var listener = InternetConnectionChecker().onStatusChange.listen((status) {
  //     switch (status) {
  //       case InternetConnectionStatus.connected:
  //         internetStatus = 'Connected to the Internet';
  //         contentMessage = 'Connected to the Internet';
  //         showDialog(
  //           context: context,
  //           builder: (ctx) => AlertDialog(
  //             title: Text("Connect"),
  //             content: Text("Connected to the Internet"),
  //             actions: <Widget>[
  //               TextButton(
  //                 onPressed: () {
  //                   Navigator.of(ctx).pop();
  //                 },
  //                 child: Text("Ok"),
  //               ),
  //             ],
  //           ),
  //         );
  //         break;
  //       case InternetConnectionStatus.disconnected:
  //         internetStatus = 'Not Connected to the Internet';
  //         contentMessage = 'Not Connected to the Internet';
  //         // _showDialog(internetStatus, contentMessage,context);
  //         showDialog(
  //           context: context,
  //           builder: (ctx) => AlertDialog(
  //             title: Text("Not Connect"),
  //             content: Text("Not Connected to the Internet"),
  //             actions: <Widget>[
  //               TextButton(
  //                 onPressed: () {
  //                   Navigator.of(ctx).pop();
  //                 },
  //                 child: Text("Ok"),
  //               ),
  //             ],
  //           ),
  //         );
  //         break;
  //     }
  //   });
  //   return await InternetConnectionChecker().connectionStatus;
  // }

  // bool _loading = false;
  int offset = 0;
  int time = 800;
  // final Dio _dio = Dio();
  List<CategoriesModel> categories = [];

  TextEditingController searchController = TextEditingController();

  // final ScrollController _scrollController = ScrollController();

  // bool hasInternet = await InternetConnectionChecker().hasConnection;

  @override
  initState() {
    //Create instance
    ConnectionUtil connectionStatus = ConnectionUtil.getInstance();
    //Initialize
    connectionStatus.initialize();
    //Listen for connection change
    connectionStatus.connectionChange.listen(connectionChanged);

    super.initState();
  }

  void connectionChanged(dynamic hasConnection) {
    setState(() {
      hasInterNetConnection = hasConnection;
      //print(isOffline);
    });
  }

  // @override
  // void initState() {
  //   super.initState();
  //   checkInternet();
  //   // checkConnection(context);
  //   categories = getCategories();
  //   Timer(
  //       const Duration(seconds: 5),
  //       () => {
  //             albumController.photoList.value.photos.length,
  //             setState(() {
  //               // albumController.isLoading = false.obs;
  //             })
  //           });
  //
  //   // _scrollController.addListener(() {
  //   //   if (_scrollController.position.pixels ==
  //   //       _scrollController.position.maxScrollExtent) {
  //   //   }
  //   // });
  // }

  // @override
  // void dispose() {
  //   listener.cancel();
  //   super.dispose();
  // }

  // checkInternet() async {
  //   // Simple check to see if we have internet
  //   if (kDebugMode) {
  //     print("The statement 'this machine is connected to the Internet' is: ");
  //   }
  //   if (kDebugMode) {
  //     print(await InternetConnectionChecker().hasConnection);
  //   }
  //   // returns a bool
  //
  //   // We can also get an enum instead of a bool
  //   if (kDebugMode) {
  //     print(
  //         "Current status: ${await InternetConnectionChecker().connectionStatus}");
  //   }
  //
  //   // actively listen for status updates
  //   listener = InternetConnectionChecker().onStatusChange.listen((status) {
  //     switch (status) {
  //       case InternetConnectionStatus.connected:
  //         internetStatus = "Connected To The Internet";
  //         if (kDebugMode) {
  //           print('Data connection is available.');
  //         }
  //         setState(() {});
  //         break;
  //       case InternetConnectionStatus.disconnected:
  //         internetStatus = "No Data Connection";
  //         if (kDebugMode) {
  //           print('You are disconnected from the internet.');
  //         }
  //         setState(() {});
  //         break;
  //     }
  //   });
  //
  //   // close listener after 30 seconds, so the program doesn't run forever
  //   // await Future.delayed(Duration(seconds: 30));
  //   // await listener.cancel().then((value) => CircularProgressIndicator());
  //   return await InternetConnectionChecker().connectionStatus;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                Color(0xffcc2b5e),
                Color(0xff753a88),
              ],
            ),
          ),
        ),
        title: brandName(),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color(0xfff5f8fd),
                borderRadius: BorderRadius.circular(30),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 24),
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: searchController,
                      decoration: const InputDecoration(
                        hintText: "search wallpapers",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      if (searchController.text != "") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SearchView(
                              search: searchController.text,
                            ),
                          ),
                        );
                      }
                    },
                    child: const Icon(Icons.search),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 80,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                itemCount: categories.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CategoriesTile(
                    imgUrls: categories[index].imgUrl,
                    categoriesName: categories[index].categoryName,
                  );
                },
              ),
            ),
            GestureDetector(
              onPanEnd: (context) {
                albumController.fetchPhotoList();
              },
              child: hasInterNetConnection
                  ? Container(
                      color: Colors.white,
                      child: SingleChildScrollView(
                        child: GridView.count(
                          physics: const ClampingScrollPhysics(),
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(5),
                          children: List.generate(
                            50,
                            (index) {
                              // final connect =
                              //     albumController.photoList.value.photos[index];
                              return GridTile(
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Shimmer.fromColors(
                                    highlightColor: Colors.grey,
                                    baseColor: Colors.grey,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: Container(
                                        // margin: const EdgeInsets.only(right: 0),
                                        height: 350,
                                        width: 270,
                                        decoration: BoxDecoration(
                                          color: Colors.black26,
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        child: Center(
                                          child: Text("No Internet"),
                                        ),
                                      ),
                                    ),
                                    period: Duration(milliseconds: time),
                                  ),
                                ),
                              );
                            },
                          ),
                          childAspectRatio: 0.6,
                          crossAxisCount: 2,
                          mainAxisSpacing: 6.0,
                          crossAxisSpacing: 6.0,
                        ),
                      ),
                    )
                  : GridView.count(
                      childAspectRatio: 0.6,
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(4.0),
                      mainAxisSpacing: 6.0,
                      crossAxisSpacing: 6.0,
                      crossAxisCount: 2,
                      children: List.generate(
                          albumController.photoList.value.photos.length,
                          (index) {
                        final connect =
                            albumController.photoList.value.photos[index];
                        return GridTile(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ImageUI(
                                    imageObject: albumController
                                        .photoList.value.photos[index],
                                  ),
                                ),
                              );
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: CachedNetworkImage(
                                filterQuality: FilterQuality.high,
                                imageUrl: connect.src.portrait,
                                placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator(),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Center(
                                  child: Icon(Icons.warning),
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
              // Obx(
              //   () {
              //     if (!hasInterNetConnection) {
              //       // checkConnection(context);
              //       return
              //       Container(
              //         color: Colors.white,
              //         child: SingleChildScrollView(
              //           child: GridView.builder(
              //             physics: const ClampingScrollPhysics(),
              //             shrinkWrap: true,
              //             padding: const EdgeInsets.all(5),
              //             itemCount: 50,
              //             itemBuilder: (BuildContext context, int index) {
              //               offset += 5;
              //               time = 800 + offset;
              //               return GridTile(
              //                 child: GestureDetector(
              //                   onTap: () {},
              //                   child: Shimmer.fromColors(
              //                     highlightColor: Colors.grey,
              //                     baseColor: Colors.grey,
              //                     child: ClipRRect(
              //                       borderRadius: BorderRadius.circular(16),
              //                       child: Container(
              //                         // margin: const EdgeInsets.only(right: 0),
              //                         height: 350,
              //                         width: 270,
              //                         decoration: BoxDecoration(
              //                           color: Colors.black26,
              //                           borderRadius: BorderRadius.circular(16),
              //                         ),
              //                         child: Center(
              //                           child: Text(
              //                               "No Internet"
              //                           ),
              //                         ),
              //                       ),
              //                     ),
              //                     period: Duration(milliseconds: time),
              //                   ),
              //                 ),
              //               );
              //             },
              //             gridDelegate:
              //                 const SliverGridDelegateWithFixedCrossAxisCount(
              //               crossAxisCount: 2,
              //               childAspectRatio: 0.6,
              //               crossAxisSpacing: 6.0,
              //               mainAxisSpacing: 6.0,
              //             ),
              //           ),
              //         ),
              //       );
              //     }
              //     // else if (albumController.photoList.value.photos.isEmpty) {
              //     //   return
              //     Container(
              //     //     color: Colors.white,
              //     //     child: SingleChildScrollView(
              //     //       child: GridView.builder(
              //     //         physics: const ClampingScrollPhysics(),
              //     //         shrinkWrap: true,
              //     //         padding: const EdgeInsets.all(5),
              //     //         itemCount: 50,
              //     //         itemBuilder: (BuildContext context, int index) {
              //     //           offset += 5;
              //     //           time = 800 + offset;
              //     //           return GridTile(
              //     //             child: GestureDetector(
              //     //               onTap: () {},
              //     //               child: Shimmer.fromColors(
              //     //                 highlightColor: Colors.grey,
              //     //                 baseColor: Colors.grey,
              //     //                 child: ClipRRect(
              //     //                   borderRadius: BorderRadius.circular(16),
              //     //                   child: Container(
              //     //                     // margin: const EdgeInsets.only(right: 0),
              //     //                     height: 350,
              //     //                     width: 270,
              //     //                     decoration: BoxDecoration(
              //     //                       color: Colors.black26,
              //     //                       borderRadius: BorderRadius.circular(16),
              //     //                     ),
              //     //                     child: Center(
              //     //                       child: Text(
              //     //                         "No Internet"
              //     //                       ),
              //     //                     ),
              //     //                   ),
              //     //                 ),
              //     //                 period: Duration(milliseconds: time),
              //     //               ),
              //     //             ),
              //     //           );
              //     //         },
              //     //         gridDelegate:
              //     //             const SliverGridDelegateWithFixedCrossAxisCount(
              //     //           crossAxisCount: 2,
              //     //           childAspectRatio: 0.6,
              //     //           crossAxisSpacing: 6.0,
              //     //           mainAxisSpacing: 6.0,
              //     //         ),
              //     //       ),
              //     //     ),
              //     //   );
              //     // }
              //     else {
              //       return
              //       GridView.count(
              //         childAspectRatio: 0.6,
              //         physics: const ClampingScrollPhysics(),
              //         shrinkWrap: true,
              //         padding: const EdgeInsets.all(4.0),
              //         mainAxisSpacing: 6.0,
              //         crossAxisSpacing: 6.0,
              //         crossAxisCount: 2,
              //         children: List.generate(
              //             albumController.photoList.value.photos.length,
              //             (index) {
              //           final connect =
              //               albumController.photoList.value.photos[index];
              //           return GridTile(
              //             child: GestureDetector(
              //               onTap: () {
              //                 Navigator.push(
              //                   context,
              //                   MaterialPageRoute(
              //                     builder: (context) => ImageUI(
              //                       imageObject: albumController
              //                           .photoList.value.photos[index],
              //                     ),
              //                   ),
              //                 );
              //               },
              //               child: ClipRRect(
              //                 borderRadius: BorderRadius.circular(16),
              //                 child: CachedNetworkImage(
              //                   filterQuality: FilterQuality.high,
              //                   imageUrl: connect.src.portrait,
              //                   placeholder: (context, url) => const Center(
              //                     child: CircularProgressIndicator(),
              //                   ),
              //                   errorWidget: (context, url, error) =>
              //                       const Center(
              //                     child: Icon(Icons.warning),
              //                   ),
              //                   fit: BoxFit.cover,
              //                 ),
              //               ),
              //             ),
              //           );
              //         }),
              //       );
              //     }
              //   },
              // ),
            ),
            // const SizedBox(
            //   height: 8,
            // ),
          ],
        ),
      ),
    );
  }
}

Widget brandName() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: const [
      Text(
        'Wallpaper',
        style: TextStyle(color: Colors.white, fontFamily: 'Overpass'),
      ),
      Text(
        'Store',
        style: TextStyle(color: Colors.deepOrange, fontFamily: 'OverPass'),
      ),
    ],
  );
}
