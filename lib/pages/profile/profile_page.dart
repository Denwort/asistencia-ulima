import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'profile_controller.dart';

class ProfilePage extends StatelessWidget {
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
