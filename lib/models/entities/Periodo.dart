import 'dart:convert';

Periodo PeriodoFromJson(String str) => Periodo.fromJson(json.decode(str));

String PeriodoToJson(Periodo data) => json.encode(data.toJson());

class Periodo {
  int id;
  String nombre;

  Periodo({
    required this.id,
    required this.nombre,
  });
  Periodo.empty()
      : id = 0,
        nombre = '';

  factory Periodo.fromJson(Map<String, dynamic> json) => Periodo(
        id: json["id"],
        nombre: json["nombre"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
      };

  @override
  String toString() {
    return 'Periodo -> id: ${id}, nombre: ${nombre}';
  }
}
