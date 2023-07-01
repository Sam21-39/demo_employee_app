import 'package:demo_employee_app/Core/colors/ui_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmployeeBloc {
  final nameCtrl = TextEditingController();
  final designationCtrl = TextEditingController();
  final startDateCtrl = TextEditingController();
  final endDateCtrl = TextEditingController();

  final List<String> designation = [
    'Product Designer',
    'Flutter Developer',
    'QA Tester',
    'Product Owner'
  ];

  showDropDown(BuildContext context) {
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
}
