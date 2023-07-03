import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_icons_null_safety/flutter_icons_null_safety.dart';
import 'package:flutter_icons/flutter_icons.dart';
// import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:wald_chat/components/fab_container.dart';

import '../pages/feeds.dart';
import '../pages/notification.dart';
import '../pages/profile.dart';
import '../pages/search.dart';
import '../utils/firebase.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _page = 0;

  List pages = [
    {
      'title': 'Home',
      'icon': Feather.home,
      'page': const Timeline(),
      'index': 0,
    },
    {
      'title': 'Search',
      'icon': Feather.search,
      'page': const Search(),
      'index': 1,
    },
    {
      'title': 'unseen',
      'icon': Feather.plus_circle,
      'page': const Text('Post'),
      'index': 2,
    },
    {
      'title': 'Notification',
      'icon': CupertinoIcons.bell_solid,
      'page': const Activities(),
      'index': 3,
    },
    {
    'title': 'Profile',
    'icon': CupertinoIcons.person,
    'page': Profile(profileId: firebaseAuth.currentUser!.uid),
    'index': 4,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTransitionSwitcher(
        transitionBuilder: (
          Widget child,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
        ) {
          return FadeThroughTransition(
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            child: child,
          );
        },
        child: pages[_page]['page'],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 5,
            ),
            for (Map item in pages)
              item['index'] == 2
                  ? buildFab()
                  : Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: IconButton(
                        icon: Icon(
                          item['icon'],
                          color: item['index'] != _page
                              ? Colors.grey
                              : Theme.of(context).colorScheme.secondary,
                          size: 20.0,
                        ),
                        onPressed: () => navigation(item['index']),
                      ),
                    ),
            const SizedBox(
              width: 5,
            ),
          ],
        ),
      ),
    );
  }

  buildFab() {
    return const SizedBox(
      height: 45.0,
      width: 45.0,
      child: FabContainer(
        icon: Feather.plus,
        mini: true,
      ),
    );
  }

  void navigation(int page) {
    setState(() {
      _page = page;
    });
  }
}
