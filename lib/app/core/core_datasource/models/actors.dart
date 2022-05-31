part of './models.dart';

class ActorModel extends Actor {
  ActorModel({
    required int? id,
    required String name,
    required String alias,
  }) : super(
          id: id,
          name: name,
          alias: alias,
        );

  factory ActorModel.fromJson(Map<String, dynamic> json) => ActorModel(
        id: json["id"],
        name: json["name"],
        alias: json["alias"],
      );
}
