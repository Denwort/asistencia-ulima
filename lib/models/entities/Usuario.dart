import 'dart:convert';

Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));

String usuarioToJson(Usuario data) => json.encode(data.toJson());

class Usuario {
  int id;
  String usuario;
  String contrasenia;
  String nombres;
  String apellidos;

  Usuario.empty()
      : id = 0,
        usuario = '',
        contrasenia = '',
        nombres = '',
        apellidos = '';

  Usuario({
    required this.id,
    required this.usuario,
    required this.contrasenia,
    required this.nombres,
    required this.apellidos,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        id: json["id"],
        usuario: json["usuario"],
        contrasenia: json["contrasenia"],
        nombres: json["nombres"],
        apellidos: json["apellidos"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "usuario": usuario,
        "contrasenia": contrasenia,
        "nombres": nombres,
        "apellidos": apellidos,
      };

  @override
  String toString() {
    return 'Usuario -> id: ${id}, usuario: ${this.usuario}, contrasenia: ${this.contrasenia}, nombres: ${this.nombres}, apellidos: ${this.apellidos}';
  }
}
