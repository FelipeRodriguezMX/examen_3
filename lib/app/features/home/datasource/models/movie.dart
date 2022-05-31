part of './models.dart';

class MovieModel extends Movie {
  MovieModel({
    required int id,
    required String title,
    required String resume,
    required Producer producer,
    required List<Actor> actors,
  }) : super(
          id: id,
          title: title,
          resume: resume,
          producer: producer,
          actors: actors,
        );
  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        id: json["id"],
        title: json["title"],
        resume: json["resume"],
        producer: ProducerModel.fromJson(json["producer"]),
        actors:
            List<Actor>.from(json["actors"].map((x) => ActorModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "resume": resume,
        "producer": producer.toJson(),
        "actors": List<dynamic>.from(actors.map((x) => x.toJson())),
      };
}
