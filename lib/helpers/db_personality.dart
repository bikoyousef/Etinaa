import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DBPersonality {
  static Future<sql.Database> database() async {

    final dbPath = await sql.getDatabasesPath();

    return sql.openDatabase(
      path.join(
        dbPath,
        'personality.db',
      ),
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE user_profile(id TEXT PRIMARY KEY, image TEXT, name TEXT, email TEXT, phone_number TEXT)');
      },
      version: 1,
    );
  }

  static Future<void> insert(String table, Map<String, Object> data) async {

    final db = await DBPersonality.database();

    db.insert(
      table,
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {

    final db = await DBPersonality.database();
    
    return db.query(table);
  }
}
