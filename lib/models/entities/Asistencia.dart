// To parse this JSON data, do
//
//     final asistencia = asistenciaFromJson(jsonString);

import 'dart:convert';

import 'package:get/get.dart';
import 'package:ulimagym/models/entities/Sesion.dart';
import 'package:ulimagym/models/entities/Usuario.dart';

Asistencia asistenciaFromJson(String str) => Asistencia.fromJson(json.decode(str));

String asistenciaToJson(Asistencia data) => json.encode(data.toJson());

class Asistencia {
    int id;
    RxBool asistio;
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
        asistio = false.obs,
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
      // Mateo fue a las sesiones 1, 3 y 4 de movil. solo la 2 de tpi. a la 1 y 3 de sw2.
      // Cliff fue a sesiones 1,2,4 de movil. solo a la 1 de tpi.
      // Mateo
      //  Movil
      Asistencia(
        id: 0,
        asistio: false.obs,
        alumno: Usuario.lista[2],
        session: Sesion.lista[0],
      ),
      Asistencia(
        id: 1,
        asistio: false.obs,
        alumno: Usuario.lista[2],
        session: Sesion.lista[1],
      ),
      Asistencia(
        id: 2,
        asistio: true.obs,
        alumno: Usuario.lista[2],
        session: Sesion.lista[2],
      ),
      Asistencia(
        id: 3,
        asistio: true.obs,
        alumno: Usuario.lista[2],
        session: Sesion.lista[3],
      ),
      //  TPI
      Asistencia(
        id: 4,
        asistio: false.obs,
        alumno: Usuario.lista[2],
        session: Sesion.lista[4],
      ),
      Asistencia(
        id: 5,
        asistio: true.obs,
        alumno: Usuario.lista[2],
        session: Sesion.lista[5],
      ),
      //  SW2
      Asistencia(
        id: 6,
        asistio: true.obs,
        alumno: Usuario.lista[2],
        session: Sesion.lista[6],
      ),
      Asistencia(
        id: 7,
        asistio: false.obs,
        alumno: Usuario.lista[2],
        session: Sesion.lista[7],
      ),
      Asistencia(
        id: 8,
        asistio: true.obs,
        alumno: Usuario.lista[2],
        session: Sesion.lista[8],
      ),
      // Cliff
      //  Movil
      Asistencia(
        id: 9,
        asistio: true.obs,
        alumno: Usuario.lista[3],
        session: Sesion.lista[0],
      ),
      Asistencia(
        id: 10,
        asistio: true.obs,
        alumno: Usuario.lista[3],
        session: Sesion.lista[1],
      ),
      Asistencia(
        id: 11,
        asistio: false.obs,
        alumno: Usuario.lista[3],
        session: Sesion.lista[2],
      ),
      Asistencia(
        id: 12,
        asistio: true.obs,
        alumno: Usuario.lista[3],
        session: Sesion.lista[3],
      ),
      //  TPI
      Asistencia(
        id: 13,
        asistio: true.obs,
        alumno: Usuario.lista[3],
        session: Sesion.lista[4],
      ),
      Asistencia(
        id: 14,
        asistio: false.obs,
        alumno: Usuario.lista[3],
        session: Sesion.lista[5],
      ),
      
    ];
}
