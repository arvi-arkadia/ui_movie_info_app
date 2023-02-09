import 'package:flutter/material.dart';
import 'package:ui_movie_info_app/constant.dart';
import 'package:ui_movie_info_app/models/movie.dart';
import 'package:ui_movie_info_app/screens/home/components/movie_card.dart';
import 'dart:math' as math;

class MovieCorousel extends StatefulWidget {
  const MovieCorousel({super.key});

  @override
  State<MovieCorousel> createState() => _MovieCorouselState();
}

class _MovieCorouselState extends State<MovieCorousel> {
  late PageController _pageController;
  int initialPage = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(
      // so that we can have samll portion shown on left and right side
      viewportFraction: 0.8,
      //  by default our movie poster
      initialPage: initialPage,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: AspectRatio(
        aspectRatio: 0.85,
        child: PageView.builder(
          onPageChanged: (value) {
            setState(() {
              initialPage = value;
            });
          },
          controller: _pageController,
          physics: ClampingScrollPhysics(),
          itemCount: movies.length,
          itemBuilder: (context, index) => buildMovieSlider(index),
        ),
      ),
    );
  }

  Widget buildMovieSlider(int index) => AnimatedBuilder(
        animation: _pageController,
        builder: (context, child) {
          double value = 0;
          if (_pageController.position.haveDimensions) {
            value = index - _pageController.page!.toDouble();
            // we use value cause 180*0.038 = 7 almost and we need to rotate our poster 7 degree
            // we use clamp so thar our value vary from -1 to 1
            value = (value * 0.038).clamp(-1, 1);
          }
          return AnimatedOpacity(
            duration: Duration(milliseconds: 350),
            opacity: initialPage == index ? 1 : 0.4,
            child: Transform.rotate(
              angle: math.pi * value,
              child: MovieCards(
                movie: movies[index],
              ),
            ),
          );
        },
      );
}
