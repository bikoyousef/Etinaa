import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DBRequest {
  static Future<sql.Database> database() async {

    final dbPath = await sql.getDatabasesPath();

    return sql.openDatabase(
      path.join(
        dbPath,
        'requests.db',
      ),
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE user_requests(id TEXT PRIMARY KEY, price TEXT, date TEXT)');
      },
      version: 1,
    );
  }

  static Future<void> insert(String table, Map<String, Object> data) async {

    final db = await DBRequest.database();

    db.insert(
      table,
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String,dynamic>>> getData(String table) async {

    final db = await DBRequest.database();
    
    return db.query(table);
  }
}