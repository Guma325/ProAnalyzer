import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {
  DB._();

  static final DB instance = DB._();
  static Database? _database;

  get database async {
    if (_database != null) return _database;

    return await _initDatabase();
  }

  _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'proAnalyzer.db'),
      version: 1,
      onCreate: _onCreate,
    );
  }
}

_onCreate(db, versao) async {
  await db.execute(_conta);
  await db.execute(_favoritos);
}

String get _conta => '''
  CREATE TABLE conta (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nomeInvocador TEXT
  );
''';

String get _favoritos => '''
  CREATE TABLE favoritos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nomeInvocador TEXT
  );
''';

