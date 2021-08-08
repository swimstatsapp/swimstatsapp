import 'package:database/model/goal.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class GoalDatabase {
  //creating instance of SwimmerDatabase
  static final GoalDatabase instance = GoalDatabase._private();

  // private constructor to prevent instantiation
  GoalDatabase._private();

  static Database? _database;

  //getter for 'database'
  Future<Database> get database async {
    // if database already exists, then return the database
    if (_database != null) return _database!;

    //if database does not exist, initialize
    _database = await initDatabase('goal.db');
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
    final String doubleType = 'FLOAT NOT NULL';

    await database.execute(

        // three single quotes to create multi-line string

        //creating database schema
        ''' 
CREATE TABLE $tableName (
${GoalFields.id} $idType,
${GoalFields.name} $textType,
${GoalFields.unit} $textType,
${GoalFields.distance} $textType,
${GoalFields.stroke} $textType,
${GoalFields.goalTime} $textType,
${GoalFields.currentTime} $textType,
${GoalFields.needValue} $doubleType,
${GoalFields.needPercentValue} $doubleType,
${GoalFields.currentComparison} $textType
)
      ''');
  }

  //add swimmer entries to database
  Future<Goal> create(Goal goal) async {
    //grabbing the instance of database
    final database = await instance.database;

    //insert() returns the id of the database entry
    final id = await database.insert(tableName, goal.toJson());

    //need to send back the id to the note object
    return goal.copy(id: id);
  }

  //
  Future<Goal> read(int id) async {
    final database = await instance.database;

    final map = await database.query(
      tableName,
      columns: GoalFields.values,
      //SQL statement
      where: '${GoalFields.id} = ?',
      whereArgs: [id],
    );

    if (map.isNotEmpty) {
      return Goal.fromJson(map.first);
    } else {
      //in the case that ID does not successfully return a Swimmer
      throw Exception('ID $id not found');
    }
  }

  //
  Future<int> update(Goal goal) async {
    final database = await instance.database;
    print(goal.stroke);
    return await database.update(
      tableName,
      goal.toJson(),
      where: '${GoalFields.id} = ?',
      whereArgs: [goal.id],
    );
  }

  Future<List<Goal>> readAll() async {
    final database = await instance.database;

    final result = await database.query(tableName);

    // maps through each member of result and converts from Map to List of swimmers
    return result.map((json) => Goal.fromJson(json)).toList();
  }

  Future<int> delete(int id) async {
    final database = await instance.database;

    return await database
        .delete(tableName, where: '${GoalFields.id} = ?', whereArgs: [id]);
  }

  //close Database method
  Future close() async {
    //calling the getter, so a database will be returned either way
    final database = await instance.database;

    database.close();
  }
}
