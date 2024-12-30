import 'dart:async';
import 'package:actividad/models/paciente.dart';
import 'package:actividad/repositories/paciente_respository.dart';
import 'package:flutter/material.dart';

class PacienteListView extends StatefulWidget {
  const PacienteListView({super.key});

  @override
  State<PacienteListView> createState() => _PacienteListViewState();
}

class _PacienteListViewState extends State<PacienteListView> {
  final PacienteRespository _pacienteRespository = PacienteRespository();
  List<Paciente> _pacientes = [];

  @override
  void initState() {
    super.initState();
    _cargarPaciente();
  }

  Future<void> _cargarPaciente() async { 
    final data = await _pacienteRespository.list();
    setState(() {
      _pacientes = data;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Pacientes',
          style: TextStyle(
            color: Colors.white
          ),
        ),
        foregroundColor: Colors.white,
        backgroundColor:Color.fromARGB(255, 6, 67, 146),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.popUntil(context, ModalRoute.withName('/menu'));
          },
        ),
      ),
      body: _pacientes.isEmpty ?
        Center(
          child: Text('No hay datos'),
        ) :
        ListView.builder(
          itemCount: _pacientes.length, //construir los widget la cantidad 
          itemBuilder: (context, i) {
            final paciente = _pacientes[i];
            return Card(
              child: ListTile(
                 title: Text("${paciente.nombre} ${paciente.apellido}"),
                subtitle: Column(children: [
                  Text("Edad: ${paciente.edad}"),
                ], 
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: (){}, 
                      icon: Icon(
                        Icons.edit, 
                        color: Color.fromARGB(255, 6, 94, 9)
                      )
                    ),
                    IconButton(
                      onPressed: (){}, 
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      )
                    )
                  ]
                ),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){  
            Navigator.pushNamed(context, '/paciente/form');
          },
          backgroundColor: Color.fromARGB(255, 6, 67, 146) ,
          child: Icon(
            color: const Color.fromARGB(255, 250, 250, 250),
            Icons.add
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Paciente'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Medico'
          )
        ],
        currentIndex: 1,
        selectedItemColor: Color.fromARGB(255, 6, 67, 146),
        onTap: (index) {
          if (index == 0) {
            Navigator.popUntil(context, ModalRoute.withName('/menu')); 
          } else if (index == 1) {
            Navigator.pushNamed(context, '/paciente/index'); 
          } else if (index == 2) {
            Navigator.pushNamed(context, '/medico/index'); 
          }
        },
      ),
          
    );
  }
}