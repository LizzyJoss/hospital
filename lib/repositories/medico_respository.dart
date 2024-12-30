import 'package:actividad/models/medico.dart';
import 'package:actividad/settings/db.connection.dart';

class MedicoRespository {
  final String tableName = 'Medico';
  
  Future <int> create(Medico medico) async {
    return await DbConnection.insert(tableName, medico.toMap());
  }
  Future<List<Medico>> list() async {
    var data = await DbConnection.list(tableName);
    if(data.isEmpty){
      return List.empty();
    }
    return List.generate(data.length, (i) => Medico.fromMap(data[i]));
  }
}