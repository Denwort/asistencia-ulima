// To parse this JSON data, do
//
//     final Sesion = SesionFromJson(jsonString);

import 'dart:convert';

import 'package:ulimagym/models/entities/Seccion.dart';

Sesion SesionFromJson(String str) => Sesion.fromJson(json.decode(str));

String SesionToJson(Sesion data) => json.encode(data.toJson());

class Sesion {
    int id;
    bool registro;
    DateTime fechaInicio;
    DateTime fechaFin;
    int seccion_id;

    Sesion.empty()
    : id = 0,
      registro = false,
      fechaInicio = DateTime(1),
      fechaFin = DateTime(1),
      seccion_id = 0;

    Sesion({
        required this.id,
        required this.registro,
        required this.fechaInicio,
        required this.fechaFin,
        required this.seccion_id,
    });

    factory Sesion.fromJson(Map<String, dynamic> json) => Sesion(
        id: json["id"],
        registro: json["registro"],
        fechaInicio: DateTime.parse(json["fechaInicio"]),
        fechaFin: DateTime.parse(json["fechaFin"]),
        seccion_id: json["seccion_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "registro": registro,
        "fecha_inicio": fechaInicio,
        "fecha_fin": fechaFin,
        "seccion_id": seccion_id,
    };
    @override
    String toString() {
      return 'Sesion -> id: ${id}, registro: ${this.registro}, fecha_inicio: ${this.fechaInicio}, fecha_fin: ${this.fechaFin}, seccion_id: ${this.seccion_id}';
    }

    static List<Sesion> lista = [
      // hay 4 sesiones para movil, 2 para tpi, 3 para sw2
      // Movil
      Sesion(
        id: 0,
        registro: false,
        fechaInicio: DateTime(2024, 05, 23, 7),
        fechaFin: DateTime(2024, 05, 23, 9),
        seccion_id: 1,
      ),
      Sesion(
        id: 1,
        registro: false,
        fechaInicio: DateTime(2024, 05, 24, 7),
        fechaFin: DateTime(2024, 05, 24, 10),
        seccion_id: 1,
      ),
      Sesion(
        id: 2,
        registro: false,
        fechaInicio: DateTime(2024, 05, 28, 7),
        fechaFin: DateTime(2024, 05, 28, 9),
        seccion_id: 1,
      ),
      Sesion(
        id: 3,
        registro: false,
        fechaInicio: DateTime(2024, 05, 31, 7),
        fechaFin: DateTime(2024, 05, 31, 10),
        seccion_id: 1,
      ),
      // TPI
      Sesion(
        id: 4,
        registro: false,
        fechaInicio: DateTime(2024, 05, 29, 16),
        fechaFin: DateTime(2024, 05, 29, 18),
        seccion_id: 2,
      ),
      Sesion(
        id: 5,
        registro: false,
        fechaInicio: DateTime(2024, 05, 31, 11),
        fechaFin: DateTime(2024, 05, 31, 13),
        seccion_id: 2,
      ),
      // SW2
      Sesion(
        id: 6,
        registro: false,
        fechaInicio: DateTime(2024, 05, 22, 14),
        fechaFin: DateTime(2024, 05, 22, 16),
        seccion_id: 3,
      ),
      Sesion(
        id: 7,
        registro: false,
        fechaInicio: DateTime(2024, 05, 25, 14),
        fechaFin: DateTime(2024, 05, 25, 17),
        seccion_id: 3,
      ),
      Sesion(
        id: 8,
        registro: false,
        fechaInicio: DateTime(2024, 05, 29, 14),
        fechaFin: DateTime(2024, 05, 29, 16),
        seccion_id: 3,
      )
    ];
    
}
