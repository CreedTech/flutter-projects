part of get_it;

// void setupLocator(GetIt getIt) {
//   // Providers
//   getIt.registerLazySingleton(() => const NavigationService());
//   getIt.registerLazySingleton(() => ServerRepository());
//   getIt.registerLazySingleton(() => SharedPreferencesStore());
//   getIt.registerLazySingleton(() => ScoreStoreRepository(
//     GetIt.I.get<SharedPreferencesStore>(),
//   ));
//   //ChangeNotifierProvider
//   getIt.registerLazySingleton(() => QuizRepository(
//     GetIt.I.get<ServerRepository>()));
//   // cubits
//   getIt.registerLazySingleton(() => CounterCubit());
// }


void setupLocator(GetIt getIt) {
  //Providers
  getIt.registerLazySingleton(() => const NavigationService());
  getIt.registerLazySingleton(() => ServerRepository());
  getIt.registerLazySingleton(() => SharedPreferencesStore());
  getIt.registerLazySingleton(
          () => ScoreStoreRepository(GetIt.I.get<SharedPreferencesStore>()));
  //ChangeNotifierProviders
  getIt.registerLazySingleton(
          () => QuizRepository(GetIt.I.get<ServerRepository>()));
  //Cubits
  getIt.registerLazySingleton(() => CounterCubit());
}