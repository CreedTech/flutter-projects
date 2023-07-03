import 'package:creed_busters/data/core/api_clients.dart';
import 'package:creed_busters/data/repositories/app_repository_implementation.dart';
import 'package:creed_busters/data/repositories/authentication_repository_implementation.dart';
import 'package:creed_busters/data/repositories/movie_repository_implementation.dart';
import 'package:creed_busters/data/sources/movie_local_data_source.dart';
import 'package:creed_busters/data/sources/movie_remote_data_source.dart';
import 'package:creed_busters/domain/cases/get_coming_soon.dart';
import 'package:creed_busters/domain/cases/get_playing_now.dart';
import 'package:creed_busters/domain/cases/get_popular.dart';
import 'package:creed_busters/domain/cases/get_trending.dart';
import 'package:creed_busters/domain/repositories/movie_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

import '../data/sources/authentication_local_data_source.dart';
import '../data/sources/authentication_remote_data_source.dart';
import '../data/sources/language_local_data_source.dart';
import '../domain/cases/check_is_favorite.dart';
import '../domain/cases/delete_favorite_movie.dart';
import '../domain/cases/get_cast.dart';
import '../domain/cases/get_favorite_movies.dart';
import '../domain/cases/get_movie_detail.dart';
import '../domain/cases/get_preferred_language.dart';
import '../domain/cases/get_preferred_theme.dart';
import '../domain/cases/get_videos.dart';
import '../domain/cases/login_user.dart';
import '../domain/cases/logout_user.dart';
import '../domain/cases/save_movie.dart';
import '../domain/cases/search_movie.dart';
import '../domain/cases/update_language.dart';
import '../domain/cases/update_theme.dart';
import '../domain/repositories/app_repository.dart';
import '../domain/repositories/authentication_repository.dart';
import '../presentation/blocs/cast/cast_cubit.dart';
import '../presentation/blocs/favorite/favorite_cubit.dart';
import '../presentation/blocs/language/language_cubit.dart';
import '../presentation/blocs/loading/loading_cubit.dart';
import '../presentation/blocs/login/login_cubit.dart';
import '../presentation/blocs/movie_backdrop/movie_backdrop_cubit.dart';
import '../presentation/blocs/movie_carousel/movie_carousel_cubit.dart';
import '../presentation/blocs/movie_details/movie_details_cubit.dart';
import '../presentation/blocs/movie_tabbed/movie_tabbed_cubit.dart';
import '../presentation/blocs/search_movie/search_movie_cubit.dart';
import '../presentation/blocs/theme/theme_cubit.dart';
import '../presentation/blocs/videos/videos_cubit.dart';

final getItInstance = GetIt.I;

Future init() async {
  getItInstance.registerLazySingleton<Client>(() => Client());
  getItInstance
      .registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()));
  getItInstance.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImplementation(getItInstance()));
  getItInstance.registerLazySingleton<MovieLocalDataSource>(
      () => MovieLocalDataSourceImplementation());
  getItInstance.registerLazySingleton<LanguageLocalDataSource>(
          () => LanguageLocalDataSourceImplementation());
  getItInstance.registerLazySingleton<AuthenticationRemoteDataSource>(
          () => AuthenticationRemoteDataSourceImplementation(getItInstance()));
  getItInstance.registerLazySingleton<AuthenticationLocalDataSource>(
          () => AuthenticationLocalDataSourceImplementation());
  getItInstance
      .registerLazySingleton<GetTrending>(() => GetTrending(getItInstance()));
  getItInstance
      .registerLazySingleton<GetPopular>(() => GetPopular(getItInstance()));
  getItInstance.registerLazySingleton<GetPlayingNow>(
      () => GetPlayingNow(getItInstance()));
  getItInstance.registerLazySingleton<GetComingSoon>(
      () => GetComingSoon(getItInstance()));
  getItInstance.registerLazySingleton<GetMovieDetail>(
          () => GetMovieDetail(getItInstance()));

  getItInstance.registerLazySingleton<GetCast>(() => GetCast(getItInstance()));

  getItInstance
      .registerLazySingleton<SearchMovies>(() => SearchMovies(getItInstance()));

  getItInstance
      .registerLazySingleton<GetVideos>(() => GetVideos(getItInstance()));

  getItInstance
      .registerLazySingleton<SaveMovie>(() => SaveMovie(getItInstance()));

  getItInstance.registerLazySingleton<GetFavoriteMovies>(
          () => GetFavoriteMovies(getItInstance()));

  getItInstance.registerLazySingleton<DeleteFavoriteMovie>(
          () => DeleteFavoriteMovie(getItInstance()));

  getItInstance.registerLazySingleton<CheckIfFavoriteMovie>(
          () => CheckIfFavoriteMovie(getItInstance()));

  getItInstance.registerLazySingleton<UpdateLanguage>(
          () => UpdateLanguage(getItInstance()));

  getItInstance.registerLazySingleton<GetPreferredLanguage>(
          () => GetPreferredLanguage(getItInstance()));

  getItInstance
      .registerLazySingleton<UpdateTheme>(() => UpdateTheme(getItInstance()));

  getItInstance.registerLazySingleton<GetPreferredTheme>(
          () => GetPreferredTheme(getItInstance()));

  getItInstance
      .registerLazySingleton<LoginUser>(() => LoginUser(getItInstance()));

  getItInstance
      .registerLazySingleton<LogoutUser>(() => LogoutUser(getItInstance()));

  getItInstance.registerLazySingleton<MovieRepository>(() => MovieRepositoryImplementation(getItInstance(), getItInstance(),));
  getItInstance.registerLazySingleton<AppRepository>(() => AppRepositoryImplementation(
    getItInstance(),
  ));

  getItInstance.registerLazySingleton<AuthenticationRepository>(
          () => AuthenticationRepositoryImplementation(getItInstance(), getItInstance()));

  getItInstance.registerFactory(() => MovieBackdropCubit());

  getItInstance.registerFactory(
        () => MovieCarouselCubit(
      loadingCubit: getItInstance(),
      getTrending: getItInstance(),
      movieBackdropCubit: getItInstance(),
    ),
  );

  getItInstance.registerFactory(
        () => MovieTabbedCubit(
      getPopular: getItInstance(),
      getComingSoon: getItInstance(),
      getPlayingNow: getItInstance(),
    ),
  );

  getItInstance.registerFactory(
        () => MovieDetailCubit(
      loadingCubit: getItInstance(),
      getMovieDetail: getItInstance(),
      castBloc: getItInstance(),
      videosCubit: getItInstance(),
      favoriteCubit: getItInstance(),
    ),
  );

  getItInstance.registerFactory(
        () => CastCubit(
      getCast: getItInstance(),
    ),
  );

  getItInstance.registerFactory(
        () => VideosCubit(
      getVideos: getItInstance(),
    ),
  );

  getItInstance.registerFactory(
        () => SearchMovieCubit(
      loadingCubit: getItInstance(),
      searchMovies: getItInstance(),
    ),
  );

  getItInstance.registerSingleton<LanguageCubit>(LanguageCubit(
    updateLanguage: getItInstance(),
    getPreferredLanguage: getItInstance(),
  ));

  getItInstance.registerFactory(() => FavoriteCubit(
    saveMovie: getItInstance(),
    checkIfFavoriteMovie: getItInstance(),
    deleteFavoriteMovie: getItInstance(),
    getFavoriteMovies: getItInstance(),
  ));

  getItInstance.registerFactory(() => LoginCubit(
    loginUser: getItInstance(),
    logoutUser: getItInstance(),
    loadingCubit: getItInstance(),
  ));

  getItInstance.registerSingleton<LoadingCubit>(LoadingCubit());
  getItInstance.registerSingleton<ThemeCubit>(ThemeCubit(
    getPreferredTheme: getItInstance(),
    updateTheme: getItInstance(),
  ));
}
