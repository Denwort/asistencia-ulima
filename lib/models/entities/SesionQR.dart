// To parse this JSON data, do
//
//     final Sesion = SesionFromJson(jsonString);

import 'dart:convert';

import 'package:ulimagym/models/entities/Seccion.dart';

SesionQR SesionFromJson(String str) => SesionQR.fromJson(json.decode(str));


class SesionQR {
    int id;
    bool registro;
    DateTime fechaInicio;
    DateTime fechaFin;
    int seccion_id;

    SesionQR({
        required this.id,
        required this.registro,
        required this.fechaInicio,
        required this.fechaFin,
        required this.seccion_id,
    });

    factory SesionQR.fromJson(Map<String, dynamic> json) => SesionQR(
        id: json["id"],
        registro: json["registro"],
        fechaInicio: DateTime.parse(json["fechaInicio"]),
        fechaFin: DateTime.parse(json["fechaFin"]),
        seccion_id: json["seccion_id"],
    );
    
}
