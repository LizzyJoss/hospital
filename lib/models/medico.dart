class Medico {
  int? id;
  String nombre;
  String apellido;
  String especialidad;
  
  Medico({
    this.id,
    required this.nombre,
    required this.apellido,
    required this.especialidad
  });

  Map<String, dynamic>toMap(){
    return{
      'id':id,
      'nombre':nombre,
      'apellido':apellido,
      'especialidad': especialidad
    };
  }

  static Medico fromMap(Map<String, dynamic>map){
    return Medico(
      id: map['id'],
      nombre: map['nombre'], 
      apellido: map['apellido'], 
      especialidad: map['especialidad']
    );
  }

}
