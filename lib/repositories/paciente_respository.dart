import 'package:actividad/models/paciente.dart';
import 'package:actividad/settings/db.connection.dart';

class PacienteRespository {
  final String tableName = 'Paciente'; //envia dinamicamente el nombre de la tabla 
  
  //funcion pra crear paciente
  Future <int> create(Paciente paciente) async {
    return await DbConnection.insert(tableName, paciente.toMap());
  }
  Future<List<Paciente>> list() async {
    var data = await DbConnection.list(tableName);
    if(data.isEmpty){
      return List.empty();
    }
    return List.generate(data.length, (i) => Paciente.fromMap(data[i]));
  }
}
