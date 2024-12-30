import 'package:actividad/settings/db.connection.dart';
import 'package:actividad/settings/supabase.dart';


class SyncService {
  Future<void> syncPacientes() async {
    final pacientes = await DbConnection.list('Paciente');
    for (var paciente in pacientes) {
      try {
        final response = await SupabaseHelper.client.from('Paciente').insert(paciente);
        if (response != null && response.error == null) {
          await DbConnection.delete('Paciente', paciente['id']);
        } else {
          print('Error al subir paciente: ${response?.error?.message ?? 'Error desconocido'}');
        }
      } catch (e) {
        print('Excepción al subir paciente: $e');
      }
    }
  }
  Future<void> syncMedicos() async {
    final medicos = await DbConnection.list('Medico');
    for (var medico in medicos) {
      try {
        final response = await SupabaseHelper.client
            .from('Medico')
            .insert(medico);
       if (response != null && response.error == null) {
          await DbConnection.delete('Medico', medico['id']);
        } else {
          print('Error al insertar médico: ${response?.error?.message ?? 'Error desconocido'}');
        }
      } catch (e) {
        print('Excepción al subir médico: $e');
      }
    }
  }

  Future<void> syncData() async {
    print('Iniciando sincronización de datos...');
    await syncPacientes();
    await syncMedicos();
  }
}
