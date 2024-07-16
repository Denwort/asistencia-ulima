// To parse this JSON data, do
//
//     final asistencia = asistenciaFromJson(jsonString);

import 'dart:convert';

import 'package:get/get.dart';
import 'package:ulimagym/models/entities/Sesion.dart';
import 'package:ulimagym/models/entities/SesionQR.dart';
import 'package:ulimagym/models/entities/Usuario.dart';

AsistenciaQR asistenciaFromJson(String str) => AsistenciaQR.fromJson(json.decode(str));

class AsistenciaQR {
    int id;
    bool asistio;
    Usuario alumno;
    SesionQR sesion;

    AsistenciaQR({
        required this.id,
        required this.asistio,
        required this.alumno,
        required this.sesion,
    });

    factory AsistenciaQR.fromJson(Map<String, dynamic> json) => AsistenciaQR(
        id: json["id"],
        asistio: json["asistio"],
        alumno: Usuario.fromJson(json["alumno"]),
        sesion: SesionQR.fromJson(json["sesion"]),
    );

}
