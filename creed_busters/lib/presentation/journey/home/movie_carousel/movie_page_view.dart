import 'package:creed_busters/common/constants/size_constants.dart';
import 'package:creed_busters/common/extensions/size_extensions.dart';
import 'package:creed_busters/common/screen_util/screen_util.dart';
import 'package:creed_busters/domain/entities/movie_entity.dart';
import 'package:creed_busters/presentation/blocs/movie_backdrop/movie_backdrop_cubit.dart';
import 'package:creed_busters/presentation/journey/home/movie_carousel/animated_movie_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviePageView extends StatefulWidget {
  final List<MovieEntity> movies;
  final int initialPage;
  const MoviePageView(
      {Key? key, required this.movies, this.initialPage = 0})
      : assert(initialPage >= 0, 'initialPage cannot be less than 0') ,super(key: key);

  @override
  State<MoviePageView> createState() => _MoviePageViewState();
}

class _MoviePageViewState extends State<MoviePageView> {
  late PageController? _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: widget.initialPage,
      keepPage: false,
      viewportFraction: 0.7,
    );
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Sizes.dimen_10.h),
      height: ScreenUtil.screenHeight * 0.3,
      child: PageView.builder(
        controller: _pageController,
        itemBuilder: (context, index){
          final MovieEntity movie = widget.movies[index];
          return AnimatedMovieCardWidget(
              index: index,
              movieId: movie.id,
              posterPath: movie.posterPath,
              pageController: _pageController!,
          );
        },
        pageSnapping: true,
        itemCount: widget.movies.length,
        onPageChanged: (index){
          BlocProvider.of<MovieBackdropCubit>(context)
              .backdropChanged(widget.movies[index]);
        },
      ),
    );
  }
}
