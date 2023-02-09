import 'package:flutter/material.dart';
import 'package:ui_movie_info_app/constant.dart';

class Genres extends StatefulWidget {
  const Genres({super.key});

  @override
  State<Genres> createState() => _GenresState();
}

class _GenresState extends State<Genres> {
  List<String> genres = [
    'Action',
    'Crime',
    'Comedy',
    'Drama',
    'Horror',
    'Animation'
  ];
  int selectedGenre = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      height: 36,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: genres.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              selectedGenre = index;
            });
          },
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: kDefaultPadding),
            padding: EdgeInsets.symmetric(
              horizontal: kDefaultPadding,
              vertical: kDefaultPadding / 4,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                  color: index == selectedGenre
                      ? Colors.black26
                      : Colors.transparent),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              genres[index],
              style: TextStyle(
                color: index == selectedGenre
                    ? kTextColor.withOpacity(0.8)
                    : Colors.black.withOpacity(.4),
                fontSize: 16,
                fontWeight: index == selectedGenre
                    ? FontWeight.bold
                    : FontWeight.normal,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
