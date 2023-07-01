import 'package:demo_employee_app/Core/colors/ui_colors.dart';
import 'package:demo_employee_app/Functions/home/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeBloc homeBloc;

  @override
  void initState() {
    super.initState();
    homeBloc = HomeBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: UIColors.base,
        title: Text(
          'Employee List',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      backgroundColor: UIColors.background,
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            SvgPicture.asset('assets/images/Group.svg'),
            Text(
              'No employee records found',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: UIColors.text,
                fontSize: 18.sp,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          homeBloc.addEmployee(context);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.sp),
        ),
        child: SvgPicture.asset("assets/images/PlusIcon.svg"),
      ),
    );
  }
}
