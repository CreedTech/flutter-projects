import 'package:creed_busters/domain/cases/use_case.dart';
import 'package:creed_busters/domain/entities/movie_entity.dart';
import 'package:creed_busters/domain/entities/app_error.dart';
import 'package:creed_busters/domain/entities/no_params.dart';
import 'package:creed_busters/domain/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';

class GetComingSoon extends UseCase<List<MovieEntity>, NoParams> {
  final MovieRepository movieRepository;

  GetComingSoon(this.movieRepository);

  Future<Either<AppError, List<MovieEntity>>> call(NoParams noParams) async {
    return await movieRepository.getComingSoon();
  }
}
