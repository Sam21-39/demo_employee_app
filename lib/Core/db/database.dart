import 'package:demo_employee_app/Core/models/employee.dart';
import 'package:demo_employee_app/Core/utils/logger/logger.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  final Employee employee = Employee();
  static String table = 'emp';

  static Future<Database> init() async {
    return openDatabase('employee.db', version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE $table (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, name TEXT, role TEXT, start_date TEXT, end_date TEXT)');
    });
  }

  void addEmployee(Employee employee) async {
    final db = await DatabaseHelper.init();
    final res = await db.insert(table, employee.toJson());
    Logger.printLog(res);
  }

  Future<List<Employee>> getAllCurrentEmployees() async {
    final db = await DatabaseHelper.init();
    try {
      final res =
          await db.query(table, where: 'end_date=?', whereArgs: ['No Date']);
      return List.generate(
          res.length, (index) => Employee.fromJson(res[index]));
    } catch (e) {
      Logger.printLog(e.toString());
    }

    return [];
  }
}
