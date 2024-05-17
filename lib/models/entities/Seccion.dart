import 'dart:convert';

Seccion seccionFromJson(String str) => Seccion.fromJson(json.decode(str));

String seccionToJson(Seccion data) => json.encode(data.toJson());

class Seccion {
  int id;
  String codigo;
  String periodo;
  String curso;
  String profesor;

  Seccion.empty()
      : id = 0,
        codigo = '',
        periodo = '',
        curso = '',
        profesor = '';

  Seccion({
    required this.id,
    required this.codigo,
    required this.periodo,
    required this.curso,
    required this.profesor,
  });

  factory Seccion.fromJson(Map<String, dynamic> json) => Seccion(
        id: json["id"],
        codigo: json["codigo"],
        periodo: json["periodo"],
        curso: json["curso"],
        profesor: json["profesor"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "codigo": codigo,
        "periodo": periodo,
        "curso": curso,
        "profesor": profesor,
      };
  @override
  String toString() {
    return 'Usuario -> id: ${id}, codigo: ${this.codigo}, periodo: ${this.periodo}, curso: ${this.curso}, profesor: ${this.profesor}';
  }
}
