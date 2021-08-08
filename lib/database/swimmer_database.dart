import 'package:database/model/swimmer.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SwimmerDatabase {
  //creating instance of SwimmerDatabase
  static final SwimmerDatabase instance = SwimmerDatabase._private();

  // private constructor to prevent instantiation
  SwimmerDatabase._private();

  static Database? _database;

  //getter for 'database'
  Future<Database> get database async {
    // if database already exists, then return the database
    if (_database != null) return _database!;

    //if database does not exist, initialize
    _database = await initDatabase('swimmer.db');
    return _database!;
  }

  Future<Database> initDatabase(String fileName) async {
    //getting database storage path
    final databasePath = await getDatabasesPath();

    //joins path parts into a single path
    final path = join(databasePath, fileName);

    return await openDatabase(path, version: 1, onCreate: _createDatabase);
  }

  //create Database method

  Future _createDatabase(Database database, int version) async {
    //defining SQL types for each field
    final String idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final String textType = 'TEXT NOT NULL';
    final String numType = 'INTEGER NOT NULL';
    await database.execute(

        // three single quotes to create multi-line string

        //creating database schema
        ''' 
CREATE TABLE $tableName (
${SwimmerFields.id} $idType,
${SwimmerFields.firstName} $textType,
${SwimmerFields.lastName} $textType,
${SwimmerFields.identifier} $textType,
${SwimmerFields.swimmerintAge} $numType,
${SwimmerFields.swimmerClub} $textType,
${SwimmerFields.swimmerGender} $textType,
${SwimmerFields.swimmerLastMeet} $textType,
${SwimmerFields.swimmerLastMeetDate} $textType,
${SwimmerFields.free50YTime} $textType,
${SwimmerFields.free50MTime} $textType,
${SwimmerFields.free100YTime} $textType,
${SwimmerFields.free100MTime} $textType,
${SwimmerFields.free200YTime} $textType,
${SwimmerFields.free200MTime} $textType,
${SwimmerFields.free500YTime} $textType,
${SwimmerFields.free400MTime} $textType,
${SwimmerFields.free1000YTime} $textType,
${SwimmerFields.free800MTime} $textType,
${SwimmerFields.free1650YTime} $textType,
${SwimmerFields.free1500MTime} $textType,
${SwimmerFields.back100YTime} $textType,
${SwimmerFields.back100MTime} $textType,
${SwimmerFields.back200YTime} $textType,
${SwimmerFields.back200MTime} $textType,
${SwimmerFields.brst100YTime} $textType,
${SwimmerFields.brst100MTime} $textType,
${SwimmerFields.brst200YTime} $textType,
${SwimmerFields.brst200MTime} $textType,
${SwimmerFields.fly100YTime} $textType,
${SwimmerFields.fly100MTime} $textType,
${SwimmerFields.fly200YTime} $textType,
${SwimmerFields.fly200MTime} $textType,
${SwimmerFields.im200YTime} $textType,
${SwimmerFields.im200MTime} $textType,
${SwimmerFields.im400YTime} $textType,
${SwimmerFields.im400MTime} $textType,
${SwimmerFields.fullUrl} $textType,
${SwimmerFields.currentRegion} $textType,
${SwimmerFields.currentLSCidentifier} $textType
)
      ''');
  }

  //add swimmer entries to database
  Future<Swimmer> create(Swimmer swimmer) async {
    final database = await instance.database;

    //insert() returns the id of the database entry
    final id = await database.insert(tableName, swimmer.toJson());

    //need to send back the id to the note object
    return swimmer.copy(id: id);
  }

  //
  Future<Swimmer> read(int id) async {
    final database = await instance.database;

    final map = await database.query(
      tableName,
      columns: SwimmerFields.values,
      //SQL statement
      where: '${SwimmerFields.id} = ?',
      whereArgs: [id],
    );

    if (map.isNotEmpty) {
      return Swimmer.fromJson(map.first);
    } else {
      //in the case that ID does not successfully return a Swimmer
      throw Exception('ID $id not found');
    }
  }

  //
  Future<int> update(Swimmer swimmer) async {
    final database = await instance.database;

    return database.update(
      tableName,
      swimmer.toJson(),
      where: '${SwimmerFields.id} = ?',
      whereArgs: [swimmer.id],
    );
  }

  Future<List<Swimmer>> readAll() async {
    final database = await instance.database;

    final result = await database.query(tableName);

    // maps through each member of result and converts from Map to List of swimmers
    return result.map((json) => Swimmer.fromJson(json)).toList();
  }

  Future<int> delete(int id) async {
    final database = await instance.database;

    return await database
        .delete(tableName, where: '${SwimmerFields.id} = ?', whereArgs: [id]);
  }

  //close Database method
  Future close() async {
    //calling the getter, so a database will be returned either way
    final database = await instance.database;

    database.close();
  }
}
