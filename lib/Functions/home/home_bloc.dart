import 'package:demo_employee_app/Functions/details/add_employee.dart';
import 'package:flutter/material.dart';

class HomeBloc {
  addEmployee(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const EmployeePage(),
      ),
    );
  }
}
