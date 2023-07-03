import 'package:bloc/bloc.dart';
import 'package:creed_busters/common/constants/translation_constants.dart';
import 'package:creed_busters/domain/cases/login_user.dart';
import 'package:creed_busters/domain/cases/logout_user.dart';
import 'package:creed_busters/domain/entities/app_error.dart';
import 'package:creed_busters/domain/entities/login_request_params.dart';
import 'package:creed_busters/domain/entities/no_params.dart';
import 'package:creed_busters/presentation/blocs/loading/loading_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUser loginUser;
  final LogoutUser logoutUser;
  final LoadingCubit loadingCubit;

  LoginCubit({
    required this.loginUser,
    required this.logoutUser,
    required this.loadingCubit,
  }) : super(LoginInitial());

  void initiateLogin(String userName, String password) async {
    loadingCubit.show();
    final Either<AppError, bool> eitherResponse = await loginUser(
      LoginRequestParams(
        userName: userName,
        password: password,
      ),
    );

    emit(eitherResponse.fold(
      (l) {
        var message = getErrorMessage(l.appErrorType);
        print(message);
        return LoginError(message);
      },
      (r) => LoginSuccess(),
    ));
    loadingCubit.hide();
  }

  void initiateGuestLogin() async {
    emit(LoginSuccess());
  }

  void logout() async {
    await logoutUser(NoParams());
    emit(LogoutSuccess());
  }

  String getErrorMessage(AppErrorType appErrorType) {
    switch (appErrorType) {
      case AppErrorType.network:
        return TranslationConstants.noNetwork;
      case AppErrorType.api:
      case AppErrorType.database:
        return TranslationConstants.somethingWentWrong;
      case AppErrorType.sessionDenied:
        return TranslationConstants.sessionDenied;
      default:
        return TranslationConstants.wrongUsernamePassword;
    }
  }
}
