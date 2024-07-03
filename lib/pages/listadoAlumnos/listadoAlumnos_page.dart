import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulimagym/models/entities/Asistencia.dart';
import 'package:ulimagym/models/entities/Seccion.dart';
import 'package:ulimagym/models/entities/Usuario.dart';
import './listadoAlumnos_controller.dart';

class ProfesorListadoAlumnos extends StatelessWidget {
  final Seccion seccion;
  final Usuario usuario;
  ProfesorListadoAlumnos({required this.seccion, required this.usuario});

  ProfesorListadoAlumnosController control = Get.put(ProfesorListadoAlumnosController());


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
                  seccion.curso.nombre,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(8.0),
                children: control.getAsistencias(seccion, usuario).map((asistencia) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${asistencia.alumno.nombres} ${asistencia.alumno.apellidos}',
                            style: TextStyle(fontSize: 16),
                          ),
                          Obx(() => Checkbox(
                            value: asistencia.asistio.value,
                            onChanged: (bool? nueva_asistencia) {
                              asistencia.asistio.value = nueva_asistencia!;
                              Asistencia.lista[asistencia.id].asistio = nueva_asistencia!.obs;
                              print(nueva_asistencia!.obs);
                              // Acción cuando se cambia el valor del checkbox
                            },
                          ),),
            
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: null,
        body: _buildBody(context),
      ),
    );
  }
}