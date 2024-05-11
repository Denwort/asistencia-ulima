import 'dart:convert';

Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));

String usuarioToJson(Usuario data) => json.encode(data.toJson());

class Usuario {
  int id;
  String usuario;
  String contrasenia;
  int miembroId;

  Usuario.empty()
      : id = 0,
        usuario = '',
        contrasenia = '',
        miembroId = 0;

  Usuario({
    required this.id,
    required this.usuario,
    required this.contrasenia,
    required this.miembroId,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        id: json["id"],
        usuario: json["usuario"],
        contrasenia: json["contrasenia"],
        miembroId: json["miembro_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "usuario": usuario,
        "contrasenia": contrasenia,
        "miembro_id": miembroId,
      };

  @override
  String toString() {
    return 'Usuario -> id: ${id}, usuario: ${this.usuario}, contrasenia: ${this.contrasenia}, miembroId: ${this.miembroId},';
  }
}
