// To parse this JSON data, do
//
//     final Matricula = MatriculaFromJson(jsonString);

import 'dart:convert';

import 'package:ulimagym/models/entities/Seccion.dart';
import 'package:ulimagym/models/entities/Usuario.dart';

Matricula MatriculaFromJson(String str) => Matricula.fromJson(json.decode(str));

String MatriculaToJson(Matricula data) => json.encode(data.toJson());

class Matricula {
    int id;
    Usuario alumno;
    Seccion seccion;

    Matricula({
        required this.id,
        required this.alumno,
        required this.seccion,
    });

    Matricula.empty()
      : id = 0,
        alumno = Usuario.empty(),
        seccion = Seccion.empty();

    factory Matricula.fromJson(Map<String, dynamic> json) => Matricula(
        id: json["id"],
        alumno: Usuario.fromJson(json["usuario"]),
        seccion: Seccion.fromJson(json["seccion"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "alumno": alumno.toJson(),
        "seccion": seccion.toJson(),
    };
    @override
    String toString() {
      return 'Matricula -> id: ${id}, alumno: ${this.alumno}, seccion: ${this.seccion}';
    }
    static List<Matricula> lista = [
      // Mateo esta en los 3 cursos: 2 de pepe y 1 de nina. Cliff en 2 de pepe
      Matricula(
        id: 0,
        alumno: Usuario.lista[2],
        seccion: Seccion.lista[0],
      ),
      Matricula(
        id: 1,
        alumno: Usuario.lista[2],
        seccion: Seccion.lista[1],
      ),
      Matricula(
        id: 1,
        alumno: Usuario.lista[2],
        seccion: Seccion.lista[2],
      ),
      Matricula(
        id: 1,
        alumno: Usuario.lista[3],
        seccion: Seccion.lista[0],
      ),
      Matricula(
        id: 1,
        alumno: Usuario.lista[3],
        seccion: Seccion.lista[1],
      )
    ];
}
