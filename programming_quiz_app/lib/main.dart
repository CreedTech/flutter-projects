import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:programming_quiz_app/config/constants/palettes.dart';
import 'package:programming_quiz_app/domain/repositories/quiz_repository.dart';
import 'package:programming_quiz_app/domain/repositories/score_store_repository.dart';
import 'package:programming_quiz_app/domain/repositories/server_repository.dart';
import 'package:programming_quiz_app/domain/repositories/share_preferences_store.dart';
import 'package:programming_quiz_app/domain/services/get_it/index.dart';
import 'package:programming_quiz_app/domain/services/navigation/index.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'logic/counter_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GetIt getIt = GetIt.instance;
  setupLocator(getIt);

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: AppPalette.transparentColor,
  ));
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
    overlays: [SystemUiOverlay.top]
  );
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]
  ).then((_) {
    runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => getIt.get<CounterCubit>(),)
        ],
        child: MultiProvider(
            providers: [
              Provider(create: (_) => getIt.get<NavigationService>()),
              Provider(create: (_) => getIt.get<ServerRepository>()),
              Provider(create: (_) => getIt.get<SharedPreferencesStore>()),
              ChangeNotifierProvider(create: (_) => getIt.get<QuizRepository>()),
              Provider(create: (_) => getIt.get<ScoreStoreRepository>()),
            ],
        child: const MyApp(),
      ),
      ),
    );
  });
}


