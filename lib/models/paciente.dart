class Paciente{
  int? id;  //? no requerido AUTOINCREMENTAL
  String nombre;
  String apellido;
  int? edad; //? opcinal
  String? telefono; //? opcional

  Paciente({
    this.id,
    required this.nombre, //required cuando sea obligtorios
    required this.apellido, //required cuando sea obligtorios
    this.edad,
    this.telefono
  });

  //Funcion para convertir de Class a Map
  Map<String, dynamic> toMap(){
    return{
      'id' :id,  //el valor 'id' debe ser igual al de la tabla creada
      'nombre':nombre,
      'apellido':apellido,
      'edad':edad,
      'telefono':telefono
    };
  }

  //FUNCION PARA CONVERTIR DE MAP A CLASS (SELECT)

  static Paciente fromMap(Map<String, dynamic>map){
    return Paciente(
      id: map['id'], //nombre de la columna a extraer (atributo de la tabla)
      nombre: map['nombre'], 
      apellido: map['apellido'],
      edad: map['edad'],
      telefono: map['telefono']
    );
  }

}