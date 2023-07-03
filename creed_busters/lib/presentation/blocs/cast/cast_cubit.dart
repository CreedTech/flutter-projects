import 'package:creed_busters/domain/entities/app_error.dart';
import 'package:creed_busters/domain/entities/movie_params.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';

import '../../../domain/cases/get_cast.dart';
import '../../../domain/entities/cast_entity.dart';

part 'cast_state.dart';

class CastCubit extends Cubit<CastState>{
  final GetCast getCast;
  CastCubit({required this.getCast}): super(CastInitial());

  void loadCast(int movieId) async {
    Either<AppError, List<CastEntity>> eitherResponse = await  getCast(MovieParams(movieId));

    emit(eitherResponse.fold(
    (l) => CastError(),
    (r) => CastLoaded(casts: r),
    ));
  }
}