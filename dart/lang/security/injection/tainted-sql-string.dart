import 'package:sqflite/sqflite.dart';

class UserRepo {
  final Database db;
  UserRepo(this.db);

  Future<List<Map<String, Object?>>> findInterpolated(String name) async {
    // ruleid: tainted-sql-string
    return db.rawQuery("SELECT * FROM users WHERE name = '$name'");
  }

  Future<List<Map<String, Object?>>> findBraced(int id) async {
    // ruleid: tainted-sql-string
    return db.rawQuery("SELECT * FROM users WHERE id = ${id}");
  }

  Future<int> insertInterpolated(String name) async {
    // ruleid: tainted-sql-string
    return db.rawInsert("INSERT INTO users(name) VALUES('$name')");
  }

  Future<int> updateInterpolated(int id, String name) async {
    // ruleid: tainted-sql-string
    return db.rawUpdate("UPDATE users SET name='$name' WHERE id=$id");
  }

  Future<int> deleteInterpolated(int id) async {
    // ruleid: tainted-sql-string
    return db.rawDelete("DELETE FROM users WHERE id=$id");
  }

  Future<void> executeInterpolated(String table) async {
    // ruleid: tainted-sql-string
    return db.execute("DROP TABLE $table");
  }

  Future<List<Map<String, Object?>>> findConcat(String name) async {
    // ruleid: tainted-sql-string
    return db.rawQuery("SELECT * FROM users WHERE name = '" + name + "'");
  }

  // Variable-built SQL — only caught by taint mode
  Future<List<Map<String, Object?>>> findIndirect(String name) async {
    final sql = "SELECT * FROM users WHERE name = '$name'";
    // ruleid: tainted-sql-string
    return db.rawQuery(sql);
  }

  Future<int> insertIndirect(String name) async {
    final query = "INSERT INTO users(name) VALUES('" + name + "')";
    // ruleid: tainted-sql-string
    return db.rawInsert(query);
  }

  Future<List<Map<String, Object?>>> findParam(String name) async {
    // ok: tainted-sql-string
    return db.rawQuery("SELECT * FROM users WHERE name = ?", [name]);
  }

  Future<int> insertParam(String name) async {
    // ok: tainted-sql-string
    return db.rawInsert("INSERT INTO users(name) VALUES(?)", [name]);
  }

  Future<int> updateParam(int id, String name) async {
    // ok: tainted-sql-string
    return db.rawUpdate(
      "UPDATE users SET name = ? WHERE id = ?",
      [name, id],
    );
  }

  Future<List<Map<String, Object?>>> staticQuery() async {
    // ok: tainted-sql-string
    return db.rawQuery("SELECT id, name FROM users");
  }
}
