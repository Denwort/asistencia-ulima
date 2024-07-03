import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulimagym/models/entities/Asistencia.dart';
import 'package:ulimagym/models/entities/Seccion.dart';
import 'package:ulimagym/models/entities/Usuario.dart';
import 'fechasAlumno_controller.dart';

class FechasAlumnoPageN extends StatelessWidget {
  final Seccion seccion;
  final Usuario usuario;
  FechasAlumnoPageN({required this.seccion, required this.usuario});

  FechasAlumnoControllerN control = Get.put(FechasAlumnoControllerN());

  DateTime startDate = DateTime(2024, 4, 1);
  int weeksCount = 16;

  List<DateTime> getDateList(seccion) {
    List<DateTime> dateList = [];
    for (int i = 0; i < weeksCount * 7; i++) {
      dateList.add(startDate.add(Duration(days: i)));
    }
    return dateList;
  }

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
                            '${asistencia.session.fechaFin.day}/${asistencia.session.fechaFin.month}/${asistencia.session.fechaFin.year}',
                            style: TextStyle(fontSize: 16),
                          ),
                          Obx(() => Checkbox(
                            value: asistencia.asistio.value,
                            onChanged: null ,
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