import 'package:demo_employee_app/Core/colors/ui_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddEmployeePage extends StatefulWidget {
  const AddEmployeePage({super.key});

  @override
  State<AddEmployeePage> createState() => _AddEmployeePageState();
}

class _AddEmployeePageState extends State<AddEmployeePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: UIColors.base,
        title: Text(
          'Add Employee Details',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      backgroundColor: UIColors.background,
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
                      onPressed: () {},
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
                  flex: 1,
                  child: SizedBox(
                    height: 40.h,
                    child: TextField(
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
                ),
                Icon(
                  Icons.arrow_forward_rounded,
                  color: UIColors.base,
                  size: 20.sp,
                ),
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: 40.h,
                    child: TextField(
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
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
