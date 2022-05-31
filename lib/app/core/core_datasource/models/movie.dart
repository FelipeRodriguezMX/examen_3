part of './models.dart';

class MovieModel extends Movie {
  MovieModel({
    required int id,
    required String name,
    required String description,
    required Producer? producer,
    // required List<Actor>? actors,
    required int? producer_id,
  }) : super(
          id: id,
          name: name,
          description: description,
          producer: producer,
          // actors: actors,
          producer_id: producer_id,
        );
  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        producer: null,
        // actors: null,
        producer_id: json['producer_id'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "producer": producer!.toJson(),
        // "actors": List<dynamic>.from(actors!.map((x) => x.toJson())),
        "producer_id": producer_id,
      };
}
