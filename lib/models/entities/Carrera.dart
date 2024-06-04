import 'dart:convert';

Carrera carreraFromJson(String str) => Carrera.fromJson(json.decode(str));

String carreraToJson(Carrera data) => json.encode(data.toJson());

class Carrera {
  int id;
  String nombre;

  Carrera.empty()
      : id = 0,
        nombre = '';

  Carrera({
    required this.id,
    required this.nombre,
  });

  factory Carrera.fromJson(Map<String, dynamic> json) => Carrera(
        id: json["id"],
        nombre: json["nombre"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
      };

  @override
  String toString() {
    return 'Carrera -> id: ${id}, nombre: ${nombre}';
  }
}
