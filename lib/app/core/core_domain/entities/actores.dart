part of './entites.dart';

class Actor {
  Actor({
    required this.id,
    required this.name,
    required this.alias,
  });
  int? id;
  String name;
  String alias;

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "alias": alias,
      };
}
