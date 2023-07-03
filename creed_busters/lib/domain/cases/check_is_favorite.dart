import 'package:creed_busters/domain/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';

import 'use_case.dart';
import '../entities/app_error.dart';
import '../entities/movie_params.dart';

class CheckIfFavoriteMovie extends UseCase<bool, MovieParams> {
  final MovieRepository movieRepository;

  CheckIfFavoriteMovie(this.movieRepository);

  @override
  Future<Either<AppError, bool>> call(MovieParams movieParams) async {
    return await movieRepository.checkIfMovieFavorite(movieParams.id);
  }
}
