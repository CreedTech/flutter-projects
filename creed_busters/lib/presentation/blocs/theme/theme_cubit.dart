import 'package:bloc/bloc.dart';

import '../../../domain/cases/get_preferred_theme.dart';
import '../../../domain/cases/update_theme.dart';
import '../../../domain/entities/no_params.dart';

enum Themes { light, dark }

class ThemeCubit extends Cubit<Themes> {
  final GetPreferredTheme getPreferredTheme;
  final UpdateTheme updateTheme;

  ThemeCubit({
    required this.getPreferredTheme,
    required this.updateTheme,
  }) : super(Themes.dark);

  Future<void> toggleTheme() async {
    await updateTheme(state == Themes.dark ? 'light' : 'dark');
    loadPreferredTheme();
  }

  void loadPreferredTheme() async {
    final response = await getPreferredTheme(NoParams());
    emit(
      response.fold(
            (l) => Themes.dark,
            (r) => r == 'dark' ? Themes.dark : Themes.light,
      ),
    );
  }
}
