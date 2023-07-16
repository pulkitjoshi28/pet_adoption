import 'package:path/path.dart';
import 'package:pet_adoption/models/petmodel.dart';
import 'package:sqflite/sqflite.dart';

Future<void> insertPetsToDatabase() async {
  final pets = PetAdoption.fromJson(petData).data;
  final dbHelper = DBHelper();
  final db = await dbHelper.database;
  for (var pet in pets) {
    final petExists = await db.query(
      'pets',
      where: 'id = ?',
      whereArgs: [pet.id],
    );

    if (petExists.isEmpty) {
      await db.insert('pets', pet.toMap());
    }
  }
}

class DBHelper {
  static final DBHelper _instance = DBHelper.internal();

  factory DBHelper() => _instance;
  static Database? _database;

  DBHelper.internal();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    final path = join(await getDatabasesPath(), 'pet_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          '''
          CREATE TABLE pets(
            id TEXT PRIMARY KEY,
            name TEXT,
            pet TEXT,
            age INTEGER,
            price TEXT,
            image TEXT,
            about TEXT,
            status INTEGER,
            adoption_date TEXT
          )
          ''',
        );
      },
    );
  }

  Future<List<Map<String, dynamic>>> getPets() async {
    final db = await database;
    return await db.query('pets');
  }

  Future<List<Map<String, dynamic>>> getPetsPaginated(int page) async {
    final db = await database;
    final offset = (page - 1) * 5;
    final result =
        await db.rawQuery('SELECT * FROM pets ORDER BY id LIMIT 5 OFFSET $offset');
    return result;
  }

  Future<List<Map<String, dynamic>>> getSortedHistory() async {
    final db = await database;
    return await db.query(
      'pets',
      orderBy: 'adoption_date DESC',
    );
  }

  Future<void> updatePetStatus(String id, int status) async {
    final db = await database;
    await db.update(
      'pets',
      {
        'status': status,
        'adoption_date': DateTime.now().toIso8601String(),
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> updateAllPetsStatus(int status) async {
    final db = await database;
    await db.update(
      'pets',
      {'status': status},
    );
  }
}
