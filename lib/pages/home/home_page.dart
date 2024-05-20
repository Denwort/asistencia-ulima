import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulimagym/models/entities/Usuario.dart';
import 'package:ulimagym/pages/profesorcursos/seccion_page.dart';
import 'package:ulimagym/pages/profile/profile_page.dart';
import 'package:ulimagym/pages/estudiantecursos/seccion_page.dart';
import 'package:ulimagym/pages/acercade/acercade_page.dart';
import 'package:ulimagym/pages/profesorqr/profesorqr_page.dart';
import 'package:ulimagym/pages/estudianteqr/estudianteqr_page.dart';

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

  late List<Widget> _widgetOptionsEstudiante;
  late List<Widget> _widgetOptionsProfesor;

  _HomePageState({required this.user});

  @override
  void initState() {
    super.initState();

    _widgetOptionsEstudiante = <Widget>[
      EstudianteCursosPage(usuario: user),
      EstudianteQRPage(usuario: user),
      ProfilePage(usuario: user),
    ];

    _widgetOptionsProfesor = <Widget>[
      ProfesorCursosPage(usuario: user),
      ProfesorQRPage(usuario: user),
      ProfilePage(usuario: user),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _navigationBottomEstudiante() {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.list_outlined),
          label: 'Estudiante-Cursos',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.qr_code_scanner),
          label: 'Escanear-QR',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Estudiante-Perfil',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Color(0XFFF26F29),
      onTap: _onItemTapped,
    );
  }

  Widget _navigationBottomProfesor() {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.list_outlined),
          label: 'Profesor-Cursos',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.qr_code),
          label: 'Generar-QR',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profesor-Perfil',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Color(0XFFF26F29),
      onTap: _onItemTapped,
    );
  }

  Widget _appbarActions() {
    return PopupMenuButton<int>(
      onSelected: (value) {
        if (value == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AcercadePage()),
          );
        } else if (value == 2) {
          Navigator.pop(context);
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
        PopupMenuItem<int>(
          value: 1,
          child: Text('Acerca de'),
        ),
        PopupMenuItem<int>(
          value: 2,
          child: Text('Cerrar sesion'),
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: Text('Home Page'),
    );
  }

  // Logica para estudiante o profesor

  Widget _body(){
    if (user.rol=='alumno'){
      return _widgetOptionsEstudiante.elementAt(_selectedIndex);
    }
    else if (user.rol=='profesor'){
      return _widgetOptionsProfesor.elementAt(_selectedIndex);
    }
    return Container();
  }

  Widget _nav(){
    if (user.rol=='alumno'){
      return _navigationBottomEstudiante();
    }
    else if (user.rol=='profesor'){
      return _navigationBottomProfesor();
    }
    return Container();
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
            'Asistencia ULima',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: Color(0XFFF26F29),
          actions: [

            _appbarActions(),
          ]
          ),
      body: _body(),
      bottomNavigationBar: _nav(),
    ));
  }
}
