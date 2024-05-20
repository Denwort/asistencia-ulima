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
    // Lista de usuarios. 1 pepe, 1 nina, 1 mateo y 1 cliff.
    Usuario(
      id: 0,
      usuario: 'profesor',
      contrasenia: '',
      rol: 'profesor',
      nombres: 'Pepe',
      apellidos: 'Valdivia',
    ),
    Usuario(
      id: 1,
      usuario: 'profesor2',
      contrasenia: '',
      rol: 'profesor',
      nombres: 'Hernan',
      apellidos: 'Nina',
    ),
    Usuario(
      id: 2,
      usuario: 'usuario',
      contrasenia: '',
      rol: 'alumno',
      nombres: 'mateo',
      apellidos: 'alvarez',
    ),
    Usuario(
      id: 1,
      usuario: 'usuario3',
      contrasenia: '',
      rol: 'alumno',
      nombres: 'cliff',
      apellidos: 'de la cruz',
    ),
  ];
}
