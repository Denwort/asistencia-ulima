import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'fechasAlumno_controller.dart';

class FechasAlumnoPageN extends StatefulWidget {
  final int seccionId;
  final int usuarioId;

  FechasAlumnoPageN({required this.seccionId, required this.usuarioId});

  @override
  _FechasAlumnoPageNState createState() => _FechasAlumnoPageNState();
}

class _FechasAlumnoPageNState extends State<FechasAlumnoPageN> {
  late FechasAlumnoControllerN control;

  @override
  void initState() {
    super.initState();
    control = Get.put(FechasAlumnoControllerN(usuarioId: widget.usuarioId, seccionId: widget.seccionId));
  }

  @override
  void dispose() {
    Get.delete<FechasAlumnoControllerN>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text('Sesiones', style: TextStyle(fontSize: 16)),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(
                  child: Obx(() {
                    if (control.isLoading.value) {
                      return Center(child: CircularProgressIndicator());
                    } else if (control.sesiones.isEmpty) {
                      return Center(child: Text("No hay sesiones disponibles."));
                    } else {
                      return ListView.builder(
                        padding: EdgeInsets.all(8.0),
                        itemCount: control.sesiones.length,
                        itemBuilder: (context, index) {
                          final sesion = control.sesiones[index];
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${sesion.fechaFin.split("T")[0]}', // Formato de fecha
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Checkbox(
                                    value: sesion.asistio == 1,
                                    onChanged: null, // Solo lectura
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
