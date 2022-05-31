part of './entites.dart';

class Movie {
  Movie({
    required this.id,
    required this.title,
    required this.resume,
    required this.producer,
    required this.actors,
  });
  int id;
  String title;
  String resume;
  Producer producer;
  List<Actor> actors;
}
