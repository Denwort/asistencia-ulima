import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'fechasAlumno_controller.dart';

class FechasAlumnoPage extends StatelessWidget {
  FechasAlumnoController control = Get.put(FechasAlumnoController());

  DateTime startDate = DateTime(2024, 4, 1);
  int weeksCount = 16;

  List<DateTime> getDateList() {
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
                  'Prog Movil',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(8.0),
                children: getDateList().map((date) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${date.day}/${date.month}/${date.year}',
                            style: TextStyle(fontSize: 16),
                          ),
                          Checkbox(
                            value: false,
                            onChanged: (bool? newValue) {
                              // Acción cuando se cambia el valor del checkbox
                            },
                          ),
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