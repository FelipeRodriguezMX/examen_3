part of './entites.dart';

class Producer {
  Producer({
    required this.id,
    required this.name,
  });
  int id;
  String name;

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
