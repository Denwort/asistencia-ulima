import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'routine_controller.dart';
import '../../models/entities/BodyPart.dart';

class RoutinePage extends StatelessWidget {
  RoutineController control = Get.put(RoutineController());

  Widget _buildBody(BuildContext context) {
    return Obx(() => SafeArea(
          child: Column(children: [
            Text('Routine Page'),
            Expanded(
                child: Container(
                    height: 50, // Altura fija
                    child: DropdownButton<BodyPart>(
                      isExpanded: true,
                      value: control.selectedBodyPart.value ??
                          control.bodyPartList[0], // Elemento predeterminado,
                      onChanged: (BodyPart? newValue) {
                        control.setSelectedBodyPart(newValue);
                      },
                      items: control.bodyPartList.map((BodyPart bodyPart) {
                        return DropdownMenuItem<BodyPart>(
                          value: bodyPart,
                          child: Text(bodyPart.name),
                        );
                      }).toList(),
                    ))),
            Text('hola')
          ]),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: null,
      body: _buildBody(context),
    ));
  }
}
