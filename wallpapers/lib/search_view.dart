import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wallpapers/album.dart';
import 'package:http/http.dart' as http;
import 'package:wallpapers/image_ui.dart';
import 'package:wallpapers/main_ui.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key, required this.search}) : super(key: key);
  final String search;

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  TextEditingController searchController = TextEditingController();

  List<PhotoList> _photos = [];

  Future<List<PhotoList>> fetchJson(String searchQuery) async{
    String apiKEY = "563492ad6f917000010000012c86b620b42240f8928c3f44f2447e54";
    _photos = [];

    int noOfImageToLoad = 200;
    var response = await http.get(
      Uri.parse(
          "https://api.pexels.com/v1/search?query=$searchQuery&per_page=$noOfImageToLoad&page=1"),
        headers: {"Authorization": apiKEY}
    );

    List<PhotoList> pList = [];
    if(response.statusCode == 200){
      var urJson = json.decode(response.body);
      urJson["photos"].forEach((element) async{
        pList.add(PhotoList.fromJson(element));
      });
    }
    
    return pList;
  }

  @override
  void initState() {
    fetchJson(widget.search).then((value) {
      setState(() {
        _photos.addAll(value);
        searchController.text = widget.search;
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
              )
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
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
                        border: InputBorder.none
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      FocusManager.instance.primaryFocus?.unfocus();
                      fetchJson(searchController.text).then((value) {
                        setState(() {
                          _photos = [];
                          _photos.addAll(value);
                        });
                      });
                    },
                    child: const Icon(Icons.search),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SingleChildScrollView(
              child: GridView.count(
                childAspectRatio: 0.6,
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(4.0),
                  mainAxisSpacing: 6.0,
                  crossAxisSpacing: 6.0,
                  crossAxisCount: 2,
                children: List.generate(
                    _photos.length,
                        (index)  {
                      return GridTile(
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context, MaterialPageRoute(
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
                            ),
                          ),
                        ),
                      );
                        }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
