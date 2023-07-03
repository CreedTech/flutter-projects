import 'package:flutter/material.dart';

import '../common/constants/route_constants.dart';
import 'journey/favorite/favorite_screen.dart';
import 'journey/home/home_screen.dart';
import 'journey/login/login_screen.dart';
import 'journey/movie_detail/movie_detail_argument.dart';
import 'journey/movie_detail/movie_detail_screen.dart';
import 'journey/watch_video/watch_video_arguments.dart';
import 'journey/watch_video/watch_video_screen.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoutes(RouteSettings setting) => {
    RouteList.initial: (context) => LoginScreen(),
    RouteList.home: (context) => HomeScreen(),
    RouteList.movieDetail: (context) => MovieDetailScreen(
      movieDetailArguments: setting.arguments as MovieDetailArguments,
    ),
    RouteList.watchTrailer: (context) => WatchVideoScreen(
      watchVideoArguments: setting.arguments as WatchVideoArguments,
    ),
    RouteList.favorite: (context) => FavoriteScreen(),
  };
}
