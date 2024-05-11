import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'exercise_controller.dart';

class ExercisePage extends StatelessWidget {
  ExerciseController control = Get.put(ExerciseController());

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: Text('Exercise Page'),
    );
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
