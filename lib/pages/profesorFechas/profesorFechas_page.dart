import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulimagym/models/entities/Usuario.dart';
import 'package:ulimagym/models/entities/Seccion.dart';
import 'profesorFechas_controller.dart';

class ProfesorFechas_page extends StatelessWidget {
  final Usuario usuario;
  final int seccionId;
  ProfesorFechas_page({required this.seccionId, required this.usuario});

  late ProfesorFechas_controller control;

  @override
  Widget build(BuildContext context) {
    control = Get.put(ProfesorFechas_controller(seccionId: seccionId));
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: null,
        body: Obx(() {
          if (control.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          }

          if (control.sesiones.isEmpty) {
            return Center(child: Text("No hay datos disponibles"));
          }

          return SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.0),
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
                        "Fechas",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.all(8.0),
                      itemCount: control.sesiones.length,
                      itemBuilder: (context, index) {
                        final sesion = control.sesiones[index];
                        return GestureDetector(
                          onTap: () {
                            /*control.redireccionrAListadoAlumnos(context, sesion.id, usuario.id);*/
                          },
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${DateTime.parse(sesion.fechaFin).day}/${DateTime.parse(sesion.fechaFin).month}/${DateTime.parse(sesion.fechaFin).year}',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}