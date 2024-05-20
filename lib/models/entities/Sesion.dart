// To parse this JSON data, do
//
//     final Sesion = SesionFromJson(jsonString);

import 'dart:convert';

import 'package:ulimagym/models/entities/Seccion.dart';

Sesion SesionFromJson(String str) => Sesion.fromJson(json.decode(str));

String SesionToJson(Sesion data) => json.encode(data.toJson());

class Sesion {
    int id;
    DateTime fechaInicio;
    DateTime fechaFin;
    Seccion seccion;

    Sesion.empty()
    : id = 0,
      fechaInicio = DateTime(1),
      fechaFin = DateTime(1),
      seccion = Seccion.empty();

    Sesion({
        required this.id,
        required this.fechaInicio,
        required this.fechaFin,
        required this.seccion,
    });

    factory Sesion.fromJson(Map<String, dynamic> json) => Sesion(
        id: json["id"],
        fechaInicio: json["fecha_inicio"],
        fechaFin: json["fecha_fin"],
        seccion: Seccion.fromJson(json["seccion"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "fecha_inicio": fechaInicio,
        "fecha_fin": fechaFin,
        "seccion": seccion,
    };
    @override
    String toString() {
      return 'Sesion -> id: ${id}, fecha_inicio: ${this.fechaInicio}, fecha_fin: ${this.fechaFin}, seccion: ${this.seccion}';
    }

    static List<Sesion> lista = [
      // hay 4 sesiones para movil, 2 para tpi, 3 para sw2
      // Movil
      Sesion(
        id: 0,
        fechaInicio: DateTime(2024, 05, 21, 7),
        fechaFin: DateTime(2024, 05, 21, 9),
        seccion: Seccion.lista[0],
      ),
      Sesion(
        id: 1,
        fechaInicio: DateTime(2024, 05, 24, 7),
        fechaFin: DateTime(2024, 05, 24, 10),
        seccion: Seccion.lista[0],
      ),
      Sesion(
        id: 2,
        fechaInicio: DateTime(2024, 05, 28, 7),
        fechaFin: DateTime(2024, 05, 28, 9),
        seccion: Seccion.lista[0],
      ),
      Sesion(
        id: 3,
        fechaInicio: DateTime(2024, 05, 31, 7),
        fechaFin: DateTime(2024, 05, 31, 10),
        seccion: Seccion.lista[0],
      ),
      // TPI
      Sesion(
        id: 4,
        fechaInicio: DateTime(2024, 05, 29, 16),
        fechaFin: DateTime(2024, 05, 29, 18),
        seccion: Seccion.lista[1],
      ),
      Sesion(
        id: 5,
        fechaInicio: DateTime(2024, 05, 31, 11),
        fechaFin: DateTime(2024, 05, 31, 13),
        seccion: Seccion.lista[1],
      ),
      // SW2
      Sesion(
        id: 6,
        fechaInicio: DateTime(2024, 05, 22, 14),
        fechaFin: DateTime(2024, 05, 22, 16),
        seccion: Seccion.lista[2],
      ),
      Sesion(
        id: 7,
        fechaInicio: DateTime(2024, 05, 25, 14),
        fechaFin: DateTime(2024, 05, 25, 17),
        seccion: Seccion.lista[2],
      ),
      Sesion(
        id: 8,
        fechaInicio: DateTime(2024, 05, 29, 14),
        fechaFin: DateTime(2024, 05, 29, 16),
        seccion: Seccion.lista[2],
      )
    ];
    
}
