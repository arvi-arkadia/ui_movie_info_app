import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_movie_info_app/constant.dart';
import 'package:ui_movie_info_app/screens/home/components/categories.dart';
import 'package:ui_movie_info_app/screens/home/components/genres.dart';
import 'package:ui_movie_info_app/models/movie.dart';
import 'package:ui_movie_info_app/screens/home/components/movie_card.dart';
import 'dart:math' as math;

import 'package:ui_movie_info_app/screens/home/components/movie_corousel.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // tab menu category
          CategoryList(),
          // tab menu genres
          Genres(),
          // item card
          SizedBox(height: kDefaultPadding),
          MovieCorousel(),
        ],
      ),
    );
  }
}
