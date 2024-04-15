import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('favorites.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const boolType = 'BOOLEAN NOT NULL';
    const textType = 'TEXT NOT NULL';

    await db.execute('''
    CREATE TABLE favorites (
      id $idType,
      name $textType,
      isLiked $boolType
    )
    ''');
  }

  Future<int> addOrUpdateFavorite(String name, bool isLiked) async {
    final db = await instance.database;
    final data = {'name': name, 'isLiked': isLiked};
    final existingId =
        await db.query('favorites', where: 'name = ?', whereArgs: [name]);

    if (existingId.isNotEmpty) {
      return db.update('favorites', data, where: 'name = ?', whereArgs: [name]);
    } else {
      return db.insert('favorites', data);
    }
  }

  Future<bool?> getFavorite(String name) async {
    final db = await instance.database;
    final maps = await db.query(
      'favorites',
      columns: ['isLiked'],
      where: 'name = ?',
      whereArgs: [name],
    );

    if (maps.isNotEmpty) {
      return maps.first['isLiked'] == 1 ? true : false;
    }
    return null;
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
