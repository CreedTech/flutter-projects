import 'dart:async';
import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart';
import 'package:wallpapers/image_ui.dart';
import 'album.dart';
import 'main_ui.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key, required this.categories})
      : super(key: key);
  final String categories;

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  bool _loading = false;
  int offset = 0;
  int time = 800;
  List<PhotoList> _photos = [];

  Future<List<PhotoList>> fetchJson() async {
    String apiKEY = "563492ad6f917000010000012c86b620b42240f8928c3f44f2447e54";
    _photos = [];

    int noOfImageToLoad = 300;
    var response = await http.get(
        Uri.parse(
            "https://api.pexels.com/v1/search?query=${widget.categories}&per_page=$noOfImageToLoad&page=1"),
        headers: {"Authorization": apiKEY});

    List<PhotoList> pList = [];
    if (response.statusCode == 200) {
      var urJson = json.decode(response.body);
      urJson["photos"].forEach((element) async {
        pList.add(PhotoList.fromJson(element));
      });
    }

    return pList;
  }

  @override
  void initState() {
    fetchJson().then((value) {
      setState(() {
        _loading = true;
        _photos.addAll(value);
      });
      Timer(
          const Duration(seconds: 5),
          () => {
                _photos[0],
                setState(() {
                  _loading = false;
                })
              });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: brandName(),
        elevation: 0.0,
        actions: [
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const Icon(
                Icons.add,
                color: Colors.white,
              )),
        ],
      ),
      body: (_loading)
          ? Container(
              color: Colors.white,
              child: SingleChildScrollView(
                child: GridView.builder(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(5),
                  itemCount: _photos.length,
                  itemBuilder: (BuildContext context, int index) {
                    offset += 5;
                    time = 800 + offset;
                    return GridTile(
                      child: GestureDetector(
                        onTap: () {},
                        child: Shimmer.fromColors(
                          highlightColor: Colors.white,
                          baseColor: Colors.grey,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Container(
                              margin: const EdgeInsets.only(right: 0),
                              height: 350,
                              width: 270,
                              decoration: BoxDecoration(
                                color: Colors.black26,
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          ),
                          period: Duration(milliseconds: time),
                        ),
                      ),
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.6,
                    crossAxisSpacing: 6.0,
                    mainAxisSpacing: 6.0,
                  ),
                ),
              ),
            )
          : SingleChildScrollView(
              child: GridView.count(
                childAspectRatio: 0.6,
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.all(4.0),
                mainAxisSpacing: 6.0,
                crossAxisCount: 2,
                crossAxisSpacing: 6.0,
                children: List.generate(
                  _photos.length,
                  (index) {
                    return GridTile(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ImageUI(
                                imageObject: _photos[index],
                              ),
                            ),
                          );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: CachedNetworkImage(
                            imageUrl: _photos[index].src.portrait,
                            placeholder: (context, url) => Container(
                              color: const Color(0xfff5f8fd),
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
    );
  }
}
