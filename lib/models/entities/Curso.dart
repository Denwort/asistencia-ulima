import 'dart:convert';

Periodo periodoFromJson(String str) => Periodo.fromJson(json.decode(str));

String periodoToJson(Periodo data) => json.encode(data.toJson());

class Periodo {
  int id;
  String nombre;
  int carreraId;
  int nivelId;

  Periodo({
    required this.id,
    required this.nombre,
    required this.carreraId,
    required this.nivelId,
  });

  factory Periodo.fromJson(Map<String, dynamic> json) => Periodo(
        id: json["id"],
        nombre: json["nombre"],
        carreraId: json["carrera_id"],
        nivelId: json["nivel_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "carrera_id": carreraId,
        "nivel_id": nivelId,
      };
  @override
  String toString() {
    return 'Curso -> nombre: ${id}, nombre: ${this.nombre}, carrera_id: ${this.carreraId}, nivel_id: ${this.nivelId},';
  }
}
