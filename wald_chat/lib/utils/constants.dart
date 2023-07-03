// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class Constants {
//   // App related strings
//   static String appName = "Wald";
//
//   // theme colors
//   static Color lightPrimary = const Color(0xfff3f4f9);
//   static Color darkPrimary = const Color(0xff2b2b2b);
//
//   static Color lightAccent = const Color(0xff886ee4);
//
//   static Color darkAccent = const Color(0xff886ee4);
//
//   static Color lightBG = const Color(0xfff3f4f9);
//   static Color darkBG = const Color(0xff2b2b2b);
//
//   static ThemeData lightTheme = ThemeData(
//     fontFamily: 'Poppins',
//     backgroundColor: lightBG,
//     primaryColor: lightPrimary,
//     colorScheme: ColorScheme.fromSwatch().copyWith(secondary: lightAccent),
//     textSelectionTheme: TextSelectionThemeData(
//       cursorColor: lightAccent,
//     ),
//     scaffoldBackgroundColor: lightBG,
//     bottomAppBarTheme: BottomAppBarTheme(
//       elevation: 0,
//       color: lightBG,
//     ),
//     appBarTheme: AppBarTheme(
//       elevation: 0,
//       toolbarTextStyle: const TextTheme(
//         headline6: TextStyle(
//           color: Colors.black,
//           fontSize: 20,
//           fontWeight: FontWeight.w600,
//           fontFamily: 'Poppins',
//         ),
//       ).bodyText2,
//       titleTextStyle: const TextTheme(
//         headline6: TextStyle(
//           color: Colors.black,
//           fontSize: 20,
//           fontWeight: FontWeight.w600,
//           fontFamily: 'Poppins',
//         ),
//       ).headline6,
//     ),
//   );
//
//   static ThemeData darkTheme = ThemeData(
//     fontFamily: 'Poppins',
//     backgroundColor: darkBG,
//     primaryColor: darkPrimary,
//     scaffoldBackgroundColor: darkBG,
//     colorScheme: ColorScheme.fromSwatch().copyWith(secondary: darkAccent),
//     textSelectionTheme: TextSelectionThemeData(
//       cursorColor: darkAccent,
//     ),
//     bottomAppBarTheme: BottomAppBarTheme(
//       elevation: 0,
//       color: darkBG,
//     ),
//     appBarTheme: AppBarTheme(
//       elevation: 0,
//       toolbarTextStyle: TextTheme(
//         headline6: TextStyle(
//           color: lightBG,
//           fontSize: 20,
//           fontWeight: FontWeight.w600,
//           fontFamily: 'Poppins',
//         ),
//       ).bodyText2,
//       titleTextStyle: TextTheme(
//         headline6: TextStyle(
//           color: lightBG,
//           fontSize: 20,
//           fontWeight: FontWeight.w600,
//           fontFamily: 'Poppins',
//         ),
//       ).headline6,
//     ),
//   );
//
//   static List<T> map<T>(List list, Function handler){
//     List<T> result = [];
//     for(var i = 0; i < list.length; i++){
//       result.add(handler(i, list[i]));
//     }
//     return result;
//   }
// }
//
// class ThemeNotifier extends ChangeNotifier {
//   final String key = 'theme';
//   SharedPreferences? _prefs;
//   late bool _darkTheme;
//   bool get dark => _darkTheme;
//
//   ThemeNotifier() {
//     _darkTheme = true;
//     _loadFromPrefs();
//   }
//   toggleTheme() {
//     _darkTheme = !_darkTheme;
//     _saveToPrefs();
//     notifyListeners();
//   }
//
//   _initPrefs() async {
//     _prefs ??= await SharedPreferences.getInstance();
//   }
//
//   _loadFromPrefs() async {
//     await _initPrefs();
//     _darkTheme = _prefs?.getBool(key) ?? true;
//     notifyListeners();
//   }
//
//   _saveToPrefs() async {
//     await _initPrefs();
//     _prefs?.setBool(key, _darkTheme);
//   }
// }

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Constants {
  //App related strings
  static String appName = "Social App";

  //Colors for theme
  static Color lightPrimary = Color(0xfff3f4f9);
  static Color darkPrimary = Color(0xff2B2B2B);

  static Color lightAccent = Color(0xff886EE4);

  static Color darkAccent = Color(0xff886EE4);

  static Color lightBG = Color(0xfff3f4f9);
  static Color darkBG = Color(0xff2B2B2B);

  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Lato-Regular',
    backgroundColor: lightBG,
    primaryColor: lightPrimary,
    accentColor: lightAccent,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: lightAccent,
    ),
    scaffoldBackgroundColor: lightBG,
    bottomAppBarTheme: BottomAppBarTheme(
      elevation: 0,
      color: lightBG,
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      textTheme: TextTheme(
        headline6: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          fontFamily: 'Lato-Regular',
        ),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: 'Lato-Regular',
    brightness: Brightness.dark,
    backgroundColor: darkBG,
    primaryColor: darkPrimary,
    accentColor: darkAccent,
    scaffoldBackgroundColor: darkBG,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: darkAccent,
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      elevation: 0,
      color: darkBG,
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      textTheme: TextTheme(
        headline6: TextStyle(
          color: lightBG,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          fontFamily: 'Lato-Regular',
        ),
      ),
    ),
  );

  static List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }
}

class ThemeNotifier extends ChangeNotifier {
  final String key = 'theme';
  late SharedPreferences _prefs;
  late bool _darkTheme;
  bool get dark => _darkTheme;

  ThemeNotifier() {
    _darkTheme = true;
    _loadfromPrefs();
  }
  toggleTheme() {
    _darkTheme = !_darkTheme;
    _saveToPrefs();
    notifyListeners();
  }

  _initPrefs() async {
    if (_prefs == null) _prefs = await SharedPreferences.getInstance();
  }

  _loadfromPrefs() async {
    await _initPrefs();
    _darkTheme = _prefs.getBool(key) ?? true;
    notifyListeners();
  }

  _saveToPrefs() async {
    await _initPrefs();
    _prefs.setBool(key, _darkTheme);
  }
}

