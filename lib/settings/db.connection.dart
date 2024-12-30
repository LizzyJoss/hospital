import 'package:sqflite/sqflite.dart'; //importar conexop a sqliite
import 'package:path/path.dart'; //importar gestor de rutas

class DbConnection {
  static const version = 1; // tener un control por eso es version = 1
  static const String dbname = 'hospital.db'; //nombre de la base de datos 

  static Future<Database> getDatabase() async{  
    //future: son datos asincronos
    //getDatabase es un nombre que se da 
    return openDatabase(
      join(await getDatabasesPath(),dbname),
      version: version,  //es opcional
      onCreate: (db, version) async =>{ //valida la base de datos del wait si existe pasa al oncreate 
        await db.execute( """
          CREATE TABLE Paciente(
            id integer primary key AUTOINCREMENT,
            nombre text not null,
            apellido text not null,
            edad integer not null,
            telefono text not null
          )
          """
        ),
        await db.execute("""insert into Paciente values
          (1, 'Juan','Lopez','23','0959084125'),
          (2, 'Luisa','Perez','24','0999845122'),
          (3, 'Juan Carlos','Chancusig','25','0959085214')

          """
        ),
        await db.execute("""
          CREATE TABLE  Medico(
            id integer primary key AUTOINCREMENT,
            nombre text not null,
            apellido text not null,
            especialidad text not null 
          ); 
          """
        ),
        await db.execute("""insert into Medico values
          (1, 'Pedro','Lopez','Odontologo'),
          (2, 'Luisa','Perez','Cirujano'),
          (3, 'Juan Carlos','Chancusig','Vaquero')

          """
        )
      }
    );
  } 
  //insert : mandar datos y se crea solo el insert 
  static Future<int> insert(String tableName, dynamic data) async{
    final db = await getDatabase(); //tableName nombre de la tabla ejem pacientes,medicame,dep
    return db.insert(tableName, data, conflictAlgorithm: ConflictAlgorithm.replace);     
  }
  //rowInsert : mandar un paramaetro con el insert into
  static Future<int> insertSql(String,sql) async {
    final db=await getDatabase();
    return db.rawInsert(sql);
  }

  //FUNCIONES DE ACTUALIZACION DE DATOS
  static Future<int> update(String tableName, dynamic data, int id) async{
    final db = await getDatabase();
    return db.update(tableName, 
      data,
      where: "id=?",
      whereArgs: [id],
      conflictAlgorithm: ConflictAlgorithm.replace
    );
  }

  static Future<int> updatesql(String sql) async{
    final db = await getDatabase();
    return db.rawUpdate(sql);
    
  }
  //Funcion delete

  static Future<int> delete(String tableName, int id) async{
    final db = await getDatabase();
    return db.delete(tableName,
    where: "id=?",
    whereArgs: [id],
    );
  }

  static Future<int> deletesql(String sql) async{
    final db = await getDatabase();
    return db.rawDelete(sql);
  }

  //FUNCION LISTAR

  static Future <List<Map<String, dynamic>>> list(String tableName) async{
    final db=await getDatabase(); //base de datos
    return await db.query(tableName); //select * form y el table muestra toda la tabla  
  }
  ///select * from ---- where ..... cndition
  static Future <List<Map<String, dynamic>>> filter(String tableName, String where, dynamic whereArgs) async{
    final db=await getDatabase(); 
    return await db.query(
      tableName,
      where: where,
      whereArgs: whereArgs
    );   
  }
  //enviar tal cual el sql
  static Future<List<Map<String, dynamic>>> selectSql(String sql) async{
    final db=await getDatabase();
    return db.rawQuery(sql);
  }
}