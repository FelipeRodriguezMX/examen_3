part of './entites.dart';

class Movie {
  Movie({
    required this.id,
    required this.name,
    required this.description,
    required this.producer,
    // required this.actors,
    required this.producer_id,
  });
  int id;
  String name;
  String description;
  Producer? producer;
  // List<Actor>? actors;
  int? producer_id;
}
