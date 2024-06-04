import 'dart:convert';

Nivel nivelFromJson(String str) => Nivel.fromJson(json.decode(str));

String nivelToJson(Nivel data) => json.encode(data.toJson());

class Nivel {
  int id;
  int nombre;

  Nivel.empty()
      : id = 0,
        nombre = '';

  Nivel({
    required this.id,
    required this.nombre,
  });

  factory Nivel.fromJson(Map<String, dynamic> json) => Nivel(
        id: json["id"],
        nombre: json["nombre"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
      };

  @override
  String toString() {
    return 'Nivel -> id: ${id}, nombre: ${nombre}';
  }
}
