import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/search_movie/search_movie_cubit.dart';
import '../journey/search_movie/custom_search_movie_delegate.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(
        Duration.zero,
            () => showSearch(
          context: context,
          delegate: CustomSearchDelegate(
            BlocProvider.of<SearchMovieCubit>(context),
          ),
        ));
    return Container();
  }
}
