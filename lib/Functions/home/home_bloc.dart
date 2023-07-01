import 'dart:async';

import 'package:demo_employee_app/Core/db/database.dart';
import 'package:demo_employee_app/Core/models/employee.dart';
import 'package:demo_employee_app/Functions/details/add_employee.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class HomeBloc {
  final currentListCtrl = StreamController<List<Employee>>.broadcast();
  final DatabaseHelper database = DatabaseHelper();
  init() {
    getCurrentEmployeeList();
  }

  void getCurrentEmployeeList() async {
    EasyLoading.show();
    final List<Employee> list = await database.getAllCurrentEmployees();
    currentListCtrl.sink.add(list);
    EasyLoading.dismiss();
  }

  addEmployee(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const EmployeePage(),
      ),
    );
  }
}
