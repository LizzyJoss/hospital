import 'package:actividad/models/medico.dart';
import 'package:actividad/repositories/medico_respository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MedicoListView extends StatefulWidget {
  const MedicoListView({super.key});

  @override
  State<MedicoListView> createState() => _MedicoListViewState();
}

class _MedicoListViewState extends State<MedicoListView> {
  final MedicoRespository _medicoRespository  =MedicoRespository();
  List<Medico> _medicos = [];

  @override
  void initState() {
    super.initState();
    _cargarMedico();
  }
  Future<void> _cargarMedico() async { 
    final data = await _medicoRespository.list();
    setState(() {
      _medicos = data;
    });
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista Medico",
            style: TextStyle(
            color: Colors.white
          ),
        ),
        foregroundColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 6, 67, 146),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.popUntil(context, ModalRoute.withName('/menu'));
          },
        ),
      ),
      body: _medicos.isEmpty ?
        Center(
          child: Text('No hay datos'),
        ) :
        ListView.builder(
          itemCount: _medicos.length,
          itemBuilder: (context, i) {
            final medico  = _medicos[i];
            return Card(
              child: ListTile(
                title: Text('${medico.nombre} ${medico.apellido}'),
                subtitle:Column(
                  children: [
                    Text('Especialidad: ${medico.especialidad}')
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
                  ],
                ), 
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){  
            Navigator.pushNamed(context, '/medico/form');
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
        currentIndex: 2,
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