import 'dart:convert';

Usuario1 usuarioFromJson(String str) => Usuario1.fromJson(json.decode(str));

String usuarioToJson(Usuario1 data) => json.encode(data.toJson());

class Usuario1 {
  int id;
  String usuario;
  String contrasenia;
  String rol;
  String nombres;
  String apellidos;
  String correo;
  DateTime creadoEn;
  DateTime actualizadoEn;

  Usuario1.empty()
      : id = 0,
        usuario = '',
        contrasenia = '',
        rol = '',
        nombres = '',
        apellidos = '',
        correo = '',
        creadoEn = DateTime.now(),
        actualizadoEn = DateTime.now();

  Usuario1({
    required this.id,
    required this.usuario,
    required this.contrasenia,
    required this.rol,
    required this.nombres,
    required this.apellidos,
    required this.correo,
    required this.creadoEn,
    required this.actualizadoEn,
  });

  factory Usuario1.fromJson(Map<String, dynamic> json) => Usuario1(
        id: json["id"],
        usuario: json["usuario"],
        contrasenia: json["contrasenia"],
        rol: json["rol"],
        nombres: json["nombres"],
        apellidos: json["apellidos"],
        correo: json["correo"],
        creadoEn: DateTime.parse(json["creadoEn"]),
        actualizadoEn: DateTime.parse(json["actualizadoEn"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "usuario": usuario,
        "contrasenia": contrasenia,
        "rol": rol,
        "nombres": nombres,
        "apellidos": apellidos,
        "correo": correo,
        "creadoEn": creadoEn.toIso8601String(),
        "actualizadoEn": actualizadoEn.toIso8601String(),
      };

  @override
  String toString() {
    return 'Usuario -> id: $id, usuario: $usuario, contrasenia: $contrasenia, rol: $rol, nombres: $nombres, apellidos: $apellidos, correo: $correo, creadoEn: $creadoEn, actualizadoEn: $actualizadoEn';
  }
}