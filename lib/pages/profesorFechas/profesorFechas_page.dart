import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulimagym/models/entities/Usuario.dart';
import 'package:ulimagym/models/entities/Seccion.dart';
import 'profesorFechas_controller.dart';

class ProfesorFechas_page extends StatefulWidget {
  final Usuario usuario;
  final int seccionId;

  ProfesorFechas_page({required this.seccionId, required this.usuario});

  @override
  _ProfesorFechas_page createState() => _ProfesorFechas_page();
}

class _ProfesorFechas_page extends State<ProfesorFechas_page> {

  late ProfesorFechas_controller control;
  
  @override
  void initState() {
    super.initState();
    control = Get.put(ProfesorFechas_controller(seccionId: widget.seccionId));
  }

  @override
  void dispose() {
    Get.delete<ProfesorFechas_controller>();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
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
                            control.redireccionrAListadoAlumnos(context, sesion.id, widget.usuario);
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