import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulimagym/models/entities/Usuario.dart';
import 'package:ulimagym/pages/exercise/exercise_page.dart';
import 'package:ulimagym/pages/profile/profile_page.dart';
import 'package:ulimagym/pages/routine/routine_page.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final Usuario usuarioLogged;

  // Constructor que acepta un parámetro
  const HomePage({Key? key, required this.usuarioLogged}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState(user: usuarioLogged);
}

class _HomePageState extends State<HomePage> {
  HomeController control = Get.put(HomeController());
  int _selectedIndex = 0;
  final Usuario user;

  _HomePageState({required this.user});

  static List<Widget> _widgetOptions = <Widget>[
    RoutinePage(),
    ExercisePage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _navigationBottom() {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.list_outlined),
          label: 'Mi Rutina',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.addchart_outlined),
          label: 'Ejercicios',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Mi Cuenta',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Color(0XFFF26F29),
      onTap: _onItemTapped,
    );
  }

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: Text('Home Page'),
    );
  }

  @override
  Widget build(BuildContext context) {
    print('usuario en home');
    print(this.user);
    return MaterialApp(
        home: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          title: Text(
            'ULima Gym',
            style: TextStyle(color: Colors.white),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: Color(0XFFF26F29),
          actions: [
            // Agregar un menú desplegable al AppBar
          ]),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: _navigationBottom(),
    ));
  }
}
