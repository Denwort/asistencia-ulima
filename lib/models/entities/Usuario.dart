import 'dart:convert';

Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));

String usuarioToJson(Usuario data) => json.encode(data.toJson());

class Usuario {
  int id;
  String usuario;
  String contrasenia;
  String rol;
  String nombres;
  String apellidos;
  String correo;

  Usuario.empty()
      : id = 0,
        usuario = '',
        contrasenia = '',
        rol = '',
        nombres = '',
        apellidos = '',
        correo = '';

  Usuario({
    required this.id,
    required this.usuario,
    required this.contrasenia,
    required this.rol,
    required this.nombres,
    required this.apellidos,
    required this.correo,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        id: json["id"],
        usuario: json["usuario"] ?? '',
        contrasenia: json["contrasenia"] ?? '',
        rol: json["rol"],
        nombres: json["nombres"],
        apellidos: json["apellidos"],
        correo: json["correo"] ?? '' ,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "usuario": usuario,
        "contrasenia": contrasenia,
        "rol": rol,
        "nombres": nombres,
        "apellidos": apellidos,
        "correo": correo,
      };

  @override
  String toString() {
    return 'Usuario -> id: ${id}, usuario: ${this.usuario}, contrasenia: ${this.contrasenia}, rol: ${this.rol}, nombres: ${this.nombres}, apellidos: ${this.apellidos}, correo: ${this.correo}';
  }

  
}
