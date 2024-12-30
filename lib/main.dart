import 'package:actividad/menu.dart';
import 'package:actividad/settings/connectionService.dart';
import 'package:actividad/settings/supabase.dart';
//import 'package:actividad/settings/syncService.dart';
import 'package:actividad/views/medico/medico_form_view.dart';
import 'package:actividad/views/medico/medico_list_view.dart';
import 'package:actividad/views/paciente/paciente_form_view.dart';
import 'package:actividad/views/paciente/paciente_list_view.dart';
import 'package:actividad/views/reconocimiento/camera.dart';
import 'package:flutter/material.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //Asegura que la inicialización de Flutter esté completa
  await SupabaseHelper.init(); //Inicializa Supabase
  // Verifica la conectividad y sincroniza los datos cuando haya conexión
  ConnectivityChecker connectivityChecker = ConnectivityChecker();
  await connectivityChecker.checkConnectivityAndSync(); // Llama a la función de verificación de conectividad
  // Comienza a escuchar los cambios de conectividad
  connectivityChecker.listenConnectivity();
  //SyncService().syncData(); // Sincroniza los datos
  runApp(MyApp()); //Inicia la aplicacion
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Aplicación de Hospital",
      initialRoute: '/menu',
      routes: {
        '/menu': (context) => Menu(),
        '/paciente/index': (context) => PacienteListView(),
        '/paciente/form': (context) => PacienteFormView(),
        '/medico/index': (context) => MedicoListView(),
        '/medico/form': (context) => MedicoFormView(),
        '/camara': (context) => CameraScreen(),
      },
    );
  }
}
