import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulimagym/models/entities/Usuario.dart';
import './listadoAlumnos_controller.dart';

class ProfesorListadoAlumnos extends StatelessWidget {
  final int sesionId;
  final Usuario usuario;
  final ProfesorListadoAlumnosController control;

  ProfesorListadoAlumnos({required this.sesionId, required this.usuario})
      : control = Get.put(ProfesorListadoAlumnosController(sesionId: sesionId));

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(16.0), // Más relleno alrededor de todo el widget
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Spacer(),
                Text(
                  "Asistencias", // Puedes actualizar esto para mostrar el nombre del curso
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            Expanded(
              child: Obx(() {
                if (control.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                } else if (control.asistencias.isEmpty) {
                  return Center(child: Text("No hay asistencias disponibles"));
                } else {
                  return ListView(
                    padding: EdgeInsets.all(8.0),
                    children: control.asistencias.map((asistencia) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${asistencia.nombres} ${asistencia.apellidos}',
                                style: TextStyle(fontSize: 16),
                              ),
                              Obx(
                                () => Checkbox(
                                  value: asistencia.asistio.value,
                                  onChanged: (bool? nueva_asistencia) {
                                    if (nueva_asistencia != null) {
                                      asistencia.asistio.value = nueva_asistencia;
                                      control.modificarAsistencia(asistencia.id, nueva_asistencia);
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Listado de Alumnos'),
      ),
      body: _buildBody(context),
    );
  }
}