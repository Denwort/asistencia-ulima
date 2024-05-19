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

  Usuario.empty()
      : id = 0,
        usuario = '',
        contrasenia = '',
        rol = '',
        nombres = '',
        apellidos = '';

  Usuario({
    required this.id,
    required this.usuario,
    required this.contrasenia,
    required this.rol,
    required this.nombres,
    required this.apellidos,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        id: json["id"],
        usuario: json["usuario"],
        contrasenia: json["contrasenia"],
        rol: json["rol"],
        nombres: json["nombres"],
        apellidos: json["apellidos"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "usuario": usuario,
        "contrasenia": contrasenia,
        "rol": rol,
        "nombres": nombres,
        "apellidos": apellidos,
      };

  @override
  String toString() {
    return 'Usuario -> id: ${id}, usuario: ${this.usuario}, contrasenia: ${this.contrasenia}, rol: ${this.rol}, nombres: ${this.nombres}, apellidos: ${this.apellidos}';
  }

  static List<Usuario> lista = [
    // Lista de usuarios. 1 pepe y 1 mateo.
    Usuario(
      id: 0,
      usuario: 'profesor',
      contrasenia: 'profesor',
      rol: 'profesor',
      nombres: 'Pepe',
      apellidos: 'Valdivia',
    ),
    Usuario(
      id: 1,
      usuario: 'usuario1',
      contrasenia: 'contrasenia1',
      rol: 'alumno',
      nombres: 'mateo',
      apellidos: 'alvarez',
    )
  ];
}
