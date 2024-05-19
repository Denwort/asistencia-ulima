// To parse this JSON data, do
//
//     final asistencia = asistenciaFromJson(jsonString);

import 'dart:convert';

import 'package:ulimagym/models/entities/Sesion.dart';
import 'package:ulimagym/models/entities/Usuario.dart';

Asistencia asistenciaFromJson(String str) => Asistencia.fromJson(json.decode(str));

String asistenciaToJson(Asistencia data) => json.encode(data.toJson());

class Asistencia {
    int id;
    bool asistio;
    Usuario alumno;
    Sesion session;

    Asistencia({
        required this.id,
        required this.asistio,
        required this.alumno,
        required this.session,
    });

    Asistencia.empty()
      : id = 0,
        asistio = false,
        alumno = Usuario.empty(),
        session = Sesion.empty();

    factory Asistencia.fromJson(Map<String, dynamic> json) => Asistencia(
        id: json["id"],
        asistio: json["asistio"],
        alumno: Usuario.fromJson(json["usuario"]),
        session: Sesion.fromJson(json["sesion"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "asistio": asistio,
        "alumno": alumno.toJson(),
        "session": session.toJson(),
    };
    @override
    String toString() {
      return 'Asistencia -> id: ${id}, asistio: ${this.asistio}, alumno: ${this.alumno}, session: ${this.session}';
    }

    static List<Asistencia> lista = [
      // Fue a las sesiones 1, 3 y 4.
      Asistencia(
        id: 0,
        asistio: true,
        alumno: Usuario.lista[1],
        session: Sesion.lista[0],
      ),
      Asistencia(
        id: 1,
        asistio: false,
        alumno: Usuario.lista[1],
        session: Sesion.lista[1],
      ),
      Asistencia(
        id: 2,
        asistio: true,
        alumno: Usuario.lista[1],
        session: Sesion.lista[2],
      ),
      Asistencia(
        id: 3,
        asistio: true,
        alumno: Usuario.lista[1],
        session: Sesion.lista[3],
      ),
    ];
}
