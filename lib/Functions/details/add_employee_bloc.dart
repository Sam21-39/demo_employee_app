import 'package:demo_employee_app/Core/colors/ui_colors.dart';
import 'package:demo_employee_app/Core/db/database.dart';
import 'package:demo_employee_app/Core/models/employee.dart';
import 'package:demo_employee_app/Core/widgets/calender.dart';
import 'package:demo_employee_app/Functions/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmployeeBloc {
  final nameCtrl = TextEditingController();
  final designationCtrl = TextEditingController();
  final startDateCtrl = TextEditingController();
  final endDateCtrl = TextEditingController();

  DateTime focusDate = DateTime.now();

  final List<String> designation = [
    'Product Designer',
    'Flutter Developer',
    'QA Tester',
    'Product Owner',
    'Full-stack Developer',
    'Senior Software developer',
  ];

  final DatabaseHelper database = DatabaseHelper();

  showDesignationDropDown(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          alignment: Alignment.bottomCenter,
          insetPadding: EdgeInsets.all(0.sp),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.sp),
            topRight: Radius.circular(16.sp),
          )),
          child: Container(
            padding: EdgeInsets.all(16.sp),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: designation.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  designationCtrl.text = designation[index];
                  Navigator.of(context).pop();
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      designation[index],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: UIColors.text,
                        fontSize: 16.sp,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    index == designation.length - 1
                        ? Container()
                        : const Divider(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  onCancel(BuildContext context) async {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => const HomePage(),
    ));
  }

  onSubmit(BuildContext context) async {
    if (isValid(context)) {
      final Employee employee = Employee(
        name: nameCtrl.text.trim(),
        role: designationCtrl.text.trim(),
        startDate: startDateCtrl.text.trim(),
        endDate: endDateCtrl.text.trim(),
      );
      database.addEmployee(employee);
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const HomePage(),
      ));
    }
  }

  bool isValid(context) {
    if (nameCtrl.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Name can not be empty!')));
      return false;
    }
    if (designationCtrl.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Role can not be empty!')));
      return false;
    }
    if (startDateCtrl.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Start Date can not be empty!')));
      return false;
    }
    if (endDateCtrl.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('End Date can not be empty!')));
      return false;
    }
    return true;
  }

  showCalender(BuildContext context, {bool isStartCalender = true}) {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.sp),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CalendarPage(
                isStartDate: isStartCalender,
                startDate: DateTime.tryParse(startDateCtrl.text) ??
                    DateTime(DateTime.now().year, DateTime.now().month,
                        DateTime.now().day),
                onSave: (String p0) {
                  if (isStartCalender) {
                    startDateCtrl.text = p0;
                  } else {
                    endDateCtrl.text = p0;
                  }
                },
              )
            ],
          ),
        );
      },
    );
  }
}
