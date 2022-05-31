part of './models.dart';

class ProducerModel extends Producer {
  ProducerModel({
    required int id,
    required String name,
  }) : super(
          id: id,
          name: name,
        );

  factory ProducerModel.fromJson(Map<String, dynamic> json) => ProducerModel(
        id: json["id"],
        name: json["name"],
      );
}
