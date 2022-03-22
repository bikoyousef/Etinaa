import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DBCallUs {
  static Future<sql.Database> database() async {

    final dbPath = await sql.getDatabasesPath();

    return sql.openDatabase(
      path.join(
        dbPath,
        'call_us.db',
      ),
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE user_call_us(id TEXT PRIMARY KEY, name TEXT, phone_number TEXT, email TEXT, request TEXT)');
      },
      version: 1,
    );
  }

  static Future<void> insert(String table, Map<String, Object> data) async {

    final db = await DBCallUs.database();

    db.insert(
      table,
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String,dynamic>>> getData(String table) async {

    final db = await DBCallUs.database();
    
    return db.query(table);
  }
}