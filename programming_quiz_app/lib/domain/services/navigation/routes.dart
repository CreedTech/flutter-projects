part of navigation;

// class NavigationRoutes {
//   static const String splash = '/';
//   static const String home = '/home';
//   static const String intro = '/intro';
//   static const String counter = '/counter';
//   static const String topicSelection = '/topicSelection';
//   static const String difficulty = '/difficulty';
//   static const String quizPage = '/quizPage';
//   static const String scorePage = '/scorePage';
//   static const String errorPage = '/errorPage';
// }

// Route<dynamic> generateRoute(RouteSettings settings) {
//   switch (settings.name) {
//     case NavigationRoutes.splash:
//       return MaterialPageRoute(builder: (_) => SplashPage());
//     case NavigationRoutes.home:
//       return MaterialPageRoute(builder: (_) => HomePage());
//     case NavigationRoutes.intro:
//       return MaterialPageRoute(builder: (_) => IntroPage());
//     case NavigationRoutes.counter:
//       return MaterialPageRoute(builder: (_) => CounterPage());
//     case NavigationRoutes.topicSelection:
//       return MaterialPageRoute(builder: (_) => TopicSelectionPage());
//     case NavigationRoutes.difficulty:
//       return MaterialPageRoute(builder: (_) => DifficultyPage());
//     case NavigationRoutes.quizPage:
//       return MaterialPageRoute(builder: (_) => QuizPage());
//     case NavigationRoutes.scorePage:
//       return MaterialPageRoute(builder: (_) => ScorePage());
//     case NavigationRoutes.errorPage:
//       return MaterialPageRoute(builder: (_) => ErrorPage());
//     default:
//       return MaterialPageRoute(
//         builder: (_) => Scaffold(
//           body: Center(
//             child: Text('No route defined for ${settings.name}'),
//           ),
//         ),
//       );
//   }
// }


class NavigationRoutes {
  static const String splash = '/';
  static const String home = '/home';
  static const String intro = '/intro';
  static const String counter = '/counter';
  static const String topicSelection = '/topicSelection';
  static const String difficulty = '/difficulty';
  static const String quizPage = '/quizpage';
  static const String scorePage = '/scorepage';
  static const String errorPage = '/errorpage';
}

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case NavigationRoutes.splash:
      return MaterialPageRoute(builder: (_) => const SplashPage());
    case NavigationRoutes.intro:
      return MaterialPageRoute(builder: (_) => const IntroPage());
    case NavigationRoutes.home:
      return MaterialPageRoute(builder: (_) => const HomePage());
    case NavigationRoutes.counter:
      return MaterialPageRoute(builder: (_) => const CounterPage());
    case NavigationRoutes.topicSelection:
      return MaterialPageRoute(builder: (_) => const TopicSelectionPage());
    case NavigationRoutes.difficulty:
      return MaterialPageRoute(builder: (_) => const DifficultyPage());
    case NavigationRoutes.quizPage:
      return MaterialPageRoute(builder: (_) => const QuizPage());
    case NavigationRoutes.scorePage:
      return MaterialPageRoute(builder: (_) => const ScorePage());
    case NavigationRoutes.errorPage:
      return MaterialPageRoute(builder: (_) => const ErrorPage());
    default:
      throw 'Invalid route';
  }
}