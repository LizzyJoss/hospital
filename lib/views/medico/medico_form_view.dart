import 'package:actividad/models/medico.dart';
import 'package:actividad/repositories/medico_respository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MedicoFormView extends StatefulWidget {
  @override
  State<MedicoFormView> createState() => _MedicoFormViewState();
}

class _MedicoFormViewState extends State<MedicoFormView> {
  final _formMedicoKey  = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _apellidoController = TextEditingController();
  final _especialidadController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Insertar Medico',
          style: TextStyle(
            color: Colors.white
          ),
        ),
        foregroundColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 6, 67, 146)
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key:_formMedicoKey ,
          child: ListView(
            children: [
              SizedBox(height: 20),
              TextFormField(
                controller: _nombreController,
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]'))],
                decoration: InputDecoration(
                  labelText: 'Nombre del Medico',
                  border: OutlineInputBorder()
                ),
                validator: (value) {
                  if (value==null || value.isEmpty){
                    return 'El medico es requerido';
                  }
                  if (value.length<3) {
                    return 'El medico debe tener minimo 3 caracteres';
                  }
                  if (value.length>20) {
                    return 'El medico debe tener maximo 20 caracteres';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _apellidoController,
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]'))],
                decoration: InputDecoration(
                  labelText: 'Apellido del Medico',
                  border: OutlineInputBorder()
                ),
                validator: (value) {
                  if (value==null || value.isEmpty){
                    return 'El Apellido es requerido';
                  }
                  if (value.length<3) {
                    return 'El apellido debe tener 3 caracteres';
                  }
                  if (value.length>20) {
                    return 'El apellido debe tener maximo 20 caracteres';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _especialidadController,
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]'))],
                decoration: InputDecoration(
                  labelText: 'Especialidad del Medico',
                  border: OutlineInputBorder()
                ),
                validator: (value) {
                  if (value==null || value.isEmpty){
                    return 'La Especialidad es requerido';
                  }
                  return null;
                },
              ),
              SizedBox(height: 50,),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        if(_formMedicoKey.currentState!.validate()){
                          Medico medico = Medico(
                            nombre: _nombreController.text,
                            apellido: _apellidoController.text,
                            especialidad: _especialidadController.text
                          );
                          var result = await MedicoRespository().create(medico);
                          print('el id del registro medico es: ' + result.toString());
                          Navigator.pushNamed(context, '/medico/index');
                    
                        }
                      }, 
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 6, 67, 146)
                      ),
                      child: Text('Aceptar',
                      style: TextStyle(
                        color: Colors.white
                        ),
                      )
                    ),
                  ),
                  SizedBox(width: 25,),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: (){
                        Navigator.pushNamed(context, '/medico/index'); 
                      }, 
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 185, 6, 6)
                      ),
                      child: Text('Cancelar',
                       style: TextStyle(
                          color: Colors.white
                        ),
                      )
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}