import 'dart:convert';

BodyPart bodyPartFromJson(String str) => BodyPart.fromJson(json.decode(str));
String bodyPartToJson(BodyPart data) => json.encode(data.toJson());

class BodyPart {
  int id;
  String name;

  BodyPart({
    required this.id,
    required this.name,
  });

  factory BodyPart.fromJson(Map<String, dynamic> json) => BodyPart(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };

  @override
  String toString() {
    return 'BodyPart -> id: ${id}, name: ${this.name}';
  }
}
