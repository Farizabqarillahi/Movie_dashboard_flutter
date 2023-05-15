import 'package:flutter/foundation.dart';
import 'genre.dart';
import 'merchant.dart';

class Movie {
  List<Result> results;

  Movie({required this.results});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      results: (json['results'] as List)
          .map((result) => Result.fromJson(result as Map<String, dynamic>))
          .toList(),
    );
  }
}

class Result {
  final String id;
  final String title;
  final String movie_id;
  final String synopsis;
  final String production_company;
  final String actor;
  final List<Genre> genre_ids;
  final int duration;
  final String poster_path;
  final String age_category;
  final String trailer_path;
  final String trailer_thumbnail_path;
  final String producer;
  final String director;
  final int presale_flag;
  final bool is_custom_event;
  final num rating;
  final bool score_home_display;
  final List<Merchant> merchant;

  Result({
    required this.id,
    required this.title,
    required this.movie_id,
    required this.synopsis,
    required this.production_company,
    required this.actor,
    required List<dynamic> genre_ids,
    required this.duration,
    required this.poster_path,
    required this.age_category,
    required this.trailer_path,
    required this.trailer_thumbnail_path,
    required this.producer,
    required this.director,
    required this.presale_flag,
    required this.is_custom_event,
    required this.rating,
    required this.score_home_display,
    required List<dynamic> merchant,
  })  : genre_ids =
            List<Genre>.from(genre_ids.map((genre) => Genre.fromJson(genre))),
        merchant = List<Merchant>.from(
            merchant.map((merchant) => Merchant.fromJson(merchant)));

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      id: json['id'] as String,
      title: json['title'] as String,
      movie_id: json['movie_id'] as String,
      synopsis: json['synopsis'] as String,
      production_company: json['production_company'] as String,
      actor: json['actor'] as String,
      genre_ids: json['genre_ids'] as List<dynamic>,
      duration: json['duration'] as int,
      poster_path: json['poster_path'] as String,
      age_category: json['age_category'] as String,
      trailer_path: json['trailer_path'] as String,
      trailer_thumbnail_path: json['trailer_thumbnail_path'] as String,
      producer: json['producer'] as String,
      director: json['director'] as String,
      presale_flag: json['presale_flag'] as int,
      is_custom_event: json['is_custom_event'] as bool,
      rating: json['rating'] as num,
      score_home_display: json['score_home_display'] as bool,
      merchant: json['merchant'] as List<dynamic>,
    );
  }
}
