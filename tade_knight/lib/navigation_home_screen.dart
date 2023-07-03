import 'package:flutter/material.dart';
import 'package:tade_knight/custom_drawer/home_drawer.dart';

import 'custom_drawer/drawer_user_controller.dart';
import 'home_page.dart';

class NavigationHomeScreen extends StatefulWidget {
  const NavigationHomeScreen({Key? key}) : super(key: key);

  @override
  _NavigationHomeScreenState createState() => _NavigationHomeScreenState();
}

class _NavigationHomeScreenState extends State<NavigationHomeScreen> {
  Widget screenView = const MyHomePage();
  DrawerIndex drawerIndex = DrawerIndex.home;

  @override
  Widget build(BuildContext context) {
    return DrawerUserController(
      screenIndex: drawerIndex,
      drawerWidth: MediaQuery.of(context).size.width * 0.75,
      onDrawerCall: (DrawerIndex drawerIndexData){
        changeIndex(drawerIndexData);
        // callback from drawer for replace screen as user need with passing DrawerIndex(Enum Index)
      },
      screenView: screenView,
      // we replace screen view as we need on navigate starting screens like HomePage and other screens
    );
  }

  void changeIndex(DrawerIndex drawerIndexData){
    if(drawerIndex != drawerIndexData){
      drawerIndex =drawerIndexData;
      if(drawerIndex == DrawerIndex.home){
        if(mounted){
          setState(() {
            screenView = const MyHomePage();
          });
        }
      }
      else if(drawerIndex == DrawerIndex.help){
        if(mounted){
          setState(() {
            screenView = const MyHomePage();
          });
        }
      }
      else if(drawerIndex == DrawerIndex.feedback){
        if(mounted){
          setState(() {
            screenView = const MyHomePage();
          });
        }
      }
      else if(drawerIndex == DrawerIndex.invite){
        if(mounted){
          setState(() {
            screenView = const MyHomePage();
          });
        }
      }
      else if(drawerIndex == DrawerIndex.about){
        if(mounted){
          setState(() {
            screenView = const MyHomePage();
          });
        }
      }
    }
  }

}
