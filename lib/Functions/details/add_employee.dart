import 'package:demo_employee_app/Core/colors/ui_colors.dart';
import 'package:demo_employee_app/Functions/details/add_employee_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmployeePage extends StatefulWidget {
  final String title;
  const EmployeePage({super.key, this.title = 'Add Employee Details'});

  @override
  State<EmployeePage> createState() => _AddEmployeePageState();
}

class _AddEmployeePageState extends State<EmployeePage> {
  late EmployeeBloc employeeBloc;

  @override
  void initState() {
    super.initState();
    employeeBloc = EmployeeBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: UIColors.base,
        title: Text(
          widget.title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: EdgeInsets.only(
          top: 24.sp,
          left: 16.sp,
          right: 16.sp,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: 40.h,
              child: TextField(
                controller: employeeBloc.nameCtrl,
                style: TextStyle(
                  color: UIColors.text,
                  fontSize: 16.sp,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(8.sp),
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(4.sp),
                    child: SvgPicture.asset(
                      'assets/images/person.svg',
                      fit: BoxFit.contain,
                    ),
                  ),
                  hintText: 'Employee name',
                  hintStyle: TextStyle(
                    color: const Color(0xFF949C9E),
                    fontSize: 16.sp,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.sp),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 23.h,
            ),
            SizedBox(
              height: 40.h,
              child: TextField(
                readOnly: true,
                controller: employeeBloc.designationCtrl,
                onTap: () {
                  employeeBloc.showDesignationDropDown(context);
                },
                style: TextStyle(
                  color: UIColors.text,
                  fontSize: 16.sp,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(8.sp),
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(4.sp),
                    child: SvgPicture.asset(
                      'assets/images/work.svg',
                      fit: BoxFit.contain,
                    ),
                  ),
                  hintText: 'Select role',
                  hintStyle: TextStyle(
                    color: const Color(0xFF949C9E),
                    fontSize: 16.sp,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                  suffixIcon: IconButton(
                      onPressed: () {
                        employeeBloc.showDesignationDropDown(context);
                      },
                      icon: const Icon(
                        Icons.arrow_drop_down_rounded,
                        color: UIColors.base,
                      )),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.sp),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 23.h,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 6,
                  child: SizedBox(
                    height: 40.h,
                    // width: 172.w,
                    child: TextField(
                      controller: employeeBloc.startDateCtrl,
                      readOnly: true,
                      onTap: () {
                        employeeBloc.showCalender(context);
                      },
                      style: TextStyle(
                        color: UIColors.text,
                        fontSize: 16.sp,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(8.sp),
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(4.sp),
                          child: SvgPicture.asset(
                            'assets/images/event.svg',
                            fit: BoxFit.contain,
                          ),
                        ),
                        hintText: 'Start date',
                        hintStyle: TextStyle(
                          color: const Color(0xFF949C9E),
                          fontSize: 16.sp,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.sp),
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
                Icon(
                  Icons.arrow_forward_rounded,
                  color: UIColors.base,
                  size: 20.sp,
                ),
                const Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 6,
                  child: SizedBox(
                    height: 40.h,
                    // width: 172.w,
                    child: TextField(
                      controller: employeeBloc.endDateCtrl,
                      readOnly: true,
                      onTap: () {
                        employeeBloc.showCalender(
                          context,
                          isStartCalender: false,
                        );
                      },
                      style: TextStyle(
                        color: UIColors.text,
                        fontSize: 16.sp,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(8.sp),
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(4.sp),
                          child: SvgPicture.asset(
                            'assets/images/event.svg',
                            fit: BoxFit.contain,
                          ),
                        ),
                        hintText: 'End date',
                        hintStyle: TextStyle(
                          color: const Color(0xFF949C9E),
                          fontSize: 16.sp,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.sp),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Divider(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.sp, horizontal: 16.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    employeeBloc.onCancel(context);
                  },
                  child: Container(
                    width: 73.w,
                    height: 40.w,
                    decoration: ShapeDecoration(
                      color: UIColors.baseLight,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)),
                    ),
                    child: Center(
                      child: Text(
                        'Cancel',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: UIColors.base,
                          fontSize: 14.sp,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 16.w,
                ),
                GestureDetector(
                  onTap: () {
                    employeeBloc.onSubmit(context);
                  },
                  child: Container(
                    width: 73.w,
                    height: 40.w,
                    decoration: ShapeDecoration(
                      color: UIColors.base,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)),
                    ),
                    child: Center(
                      child: Text(
                        'Save',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
