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
    int seccionId;
    String seccionCodigo;
    String periodo;
    String curso;

    SesionQR({
        required this.id,
        required this.registro,
        required this.fechaInicio,
        required this.fechaFin,
        required this.seccionId,
        required this.seccionCodigo,
        required this.periodo,
        required this.curso,
    });

    factory SesionQR.fromJson(Map<String, dynamic> json) => SesionQR(
        id: json["id"],
        registro: json["registro"],
        fechaInicio: DateTime.parse(json["fechaInicio"]),
        fechaFin: DateTime.parse(json["fechaFin"]),
        seccionId: json["seccionId"],
        seccionCodigo: json["seccionCodigo"],
        periodo: json["periodo"],
        curso: json["curso"]
    );
    
}
