import 'package:actividad/models/paciente.dart';
import 'package:actividad/repositories/paciente_respository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PacienteFormView extends StatefulWidget {
  @override
  State<PacienteFormView> createState() => _PacienteFormViewState();
}

class _PacienteFormViewState extends State<PacienteFormView> {
  final _formPacienteKey  = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _apellidoController = TextEditingController();
  final _edadController = TextEditingController();
  final _telefonoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Insertar Paciente',
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
          key:_formPacienteKey ,
          child: ListView(
            children: [
              SizedBox(height: 20),
              TextFormField(
                controller: _nombreController,
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]'))],
                decoration: InputDecoration(
                  labelText: 'Nombre del Paciente',
                  border: OutlineInputBorder()
                ),
                validator: (value) {
                  if (value==null || value.isEmpty){
                    return 'El nombre es requerido';
                  }
                  if (value.length<3) {
                    return 'El nombre debe tener 3 caracteres';
                  }
                  if (value.length>20) {
                    return 'El nombre debe tener maximo 20 caracteres';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _apellidoController,
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]'))],
                decoration: InputDecoration(
                  labelText: 'Apellido del Paciente',
                  border: OutlineInputBorder()
                ),
                validator: (value) {
                  if (value==null || value.isEmpty){
                    return 'El Apellido es requerido';
                  }
                  if (value.length<2) {
                    return 'El apellido debe tener 2 caracteres';
                  }
                  if (value.length>20) {
                    return 'El apellido debe tener maximo 20 caracteres';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _edadController,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Edad del Paciente',
                  border: OutlineInputBorder()
                ),
                validator: (value) {
                  if (value==null || value.isEmpty){
                    return 'La Edad es requerido';
                  }
                  if (value.length<1) {
                    return 'la edad debe tener 1 caracter';
                  }
                  if (value.length>3) {
                    return 'la edad debe tener maximo 3 caracteres';
                  }
                  return null;
                  
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _telefonoController,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Telefono del Paciente',
                  border: OutlineInputBorder()
                ),
                validator: (value) {
                  if (value==null || value.isEmpty){
                    return 'El Telefono es requerido';
                  }
                  if (value.length<10) {
                    return 'El Telefono deb tener 10 digitos';
                  }
                  if (value.length>10) {
                    return 'El Telefono deb tener 10 digitos';
                  }
                  return null;
                },
              ),
              SizedBox(height: 50,),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async { //async  de forma asincrona
                        if(_formPacienteKey.currentState!.validate()){
                          Paciente paciente = Paciente(
                            nombre: _nombreController.text, 
                            apellido: _apellidoController.text,
                            edad: int.parse(_edadController.text),
                            telefono: _telefonoController.text
                          );
                          var result = await PacienteRespository().create(paciente);
                          print('el id del registro es: ' + result.toString());
                          Navigator.pushNamed(context, '/paciente/index');
                        }
                      }, 
                      style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 6, 67, 146)),
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
                        Navigator.pushNamed(context, '/paciente/index'); 
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
              ),
            ],
          ),
        ),
      )
    );
  }
}