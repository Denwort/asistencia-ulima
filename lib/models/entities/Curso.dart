import 'dart:convert';

import 'package:ulimagym/models/entities/Carrera.dart';
import 'package:ulimagym/models/entities/Nivel.dart';

Curso cursoFromJson(String str) => Curso.fromJson(json.decode(str));

String cursoToJson(Curso data) => json.encode(data.toJson());

class Curso {
  int id;
  String nombre;
  String color;
  Carrera carreraId;
  Nivel nivelId;

  Curso({
    required this.id,
    required this.nombre,
    required this.color,
    required this.carreraId,
    required this.nivelId,
  });

  Curso.empty()
      : id = 0,
        nombre = '',
        color = '',
        carreraId = Carrera.empty(),
        nivelId = Nivel.empty();


  factory Curso.fromJson(Map<String, dynamic> json) => Curso(
        id: json["id"],
        nombre: json["nombre"],
        color: json["color"],
        carreraId: Carrera.fromJson(json["carrera_id"]),
        nivelId: Nivel.fromJson(json["nivel_id"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "carrera_id": carreraId.toJson(),
        "nivel_id": nivelId.toJson(),
      };
  @override
  String toString() {
    return 'Curso -> nombre: ${id}, nombre: ${this.nombre}, carrera_id: ${this.carreraId}, nivel_id: ${this.nivelId},';
  }
}
