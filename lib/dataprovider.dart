// import 'package:flutter_todolist/taskclasss.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';

// class dbprovider {
//   dbprovider();

//   static final dbprovider dataBase = dbprovider();
//   static Database _database;

//   Future<Database> get database async {
//     if (_database != null) {
//       return _database;
//     }

//     _database = await initDataBase();
//     return _database;
//   }

//   Future<List<Taskclass>> getTasksfromMap() async {
//     List<Map<String, dynamic>> maplist = await getTaskList();
//     List<Taskclass> taskmodel = List();
//     Taskclass tc = new Taskclass();
//     for (int i = 0; i < maplist.length; i++) {
//       taskmodel.add(tc.fromMap(maplist[i]));
//     }
//     return taskmodel;
//   }

//   initDataBase() async {
//     return await openDatabase(join(await getDatabasesPath(), 'todo1_db.db'),
//         onCreate: (db, version) async {
//       await db.execute(
//           '''CREATE TABLE task(id INTEGER PRIMARY KEY AUTOINCREMENT,taskname TEXT,creationDate TEXT)
//   ''');
//     }, version: 1);
//   }

//   addNewTask(Taskclass newtask) async {
//     final db = await database;
//     db.insert("task", newtask.toMap(),
//         conflictAlgorithm: ConflictAlgorithm.replace);
//     String s = await getDatabasesPath();
//     print(s);
//   }

//   Future<List<Map<String, dynamic>>> getTaskList() async {
//     Database db = await this.database;
//     return db.query("task");
//   }

//   Future<dynamic> getTask() async {
//     final db = await database;
//     var res = await db.query("task");
//     if (res.length == 0) {
//       return Null;
//     } else {
//       var resultMap = res.toList();
//       return resultMap.isNotEmpty ? resultMap : Null;

//       print(resultMap);
//     }
//   }
// }
