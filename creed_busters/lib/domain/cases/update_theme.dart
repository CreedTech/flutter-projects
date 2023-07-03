import 'package:dartz/dartz.dart';
import '../entities/app_error.dart';
import '../repositories/app_repository.dart';
import 'use_case.dart';

class UpdateTheme extends UseCase<void, String> {
  final AppRepository appRepository;

  UpdateTheme(this.appRepository);

  @override
  Future<Either<AppError, void>> call(String themeName) async {
    return await appRepository.updateTheme(themeName);
  }
}
