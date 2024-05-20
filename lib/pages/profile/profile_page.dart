import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulimagym/models/entities/Usuario.dart';
import 'profile_controller.dart';

class ProfilePage extends StatelessWidget {
  final Usuario usuario;
  ProfilePage({required this.usuario});

  ProfileController control = Get.put(ProfileController());

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: Text('Profile Page'),
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
