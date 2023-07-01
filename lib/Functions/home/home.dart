import 'package:demo_employee_app/Core/colors/ui_colors.dart';
import 'package:demo_employee_app/Core/models/employee.dart';
import 'package:demo_employee_app/Core/utils/logger/logger.dart';
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
    homeBloc.init();
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
        child: StreamBuilder<List<Employee>>(
          stream: homeBloc.currentListCtrl.stream,
          initialData: [],
          builder: (context, clist) {
            if (clist.data!.isEmpty) {
              return Column(
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
              );
            }
            Logger.printLog(clist.data);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.all(16.sp),
                  child: Text(
                    'Current employees',
                    style: TextStyle(
                      color: UIColors.base,
                      fontSize: 16.sp,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  height: 312.h,
                  child: ListView.builder(
                    itemCount: clist.data!.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(16.sp),
                            decoration:
                                const BoxDecoration(color: Colors.white),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  clist.data![index].name ?? '',
                                  style: TextStyle(
                                    color: UIColors.text,
                                    fontSize: 16.sp,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 6.h),
                                Text(
                                  clist.data![index].role ?? '',
                                  style: TextStyle(
                                    color: const Color(0xFF949C9E),
                                    fontSize: 14.sp,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(height: 6.h),
                                Text(
                                  'From ${clist.data![index].startDate}',
                                  style: TextStyle(
                                    color: const Color(0xFF949C9E),
                                    fontSize: 12.sp,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          index == clist.data!.length - 1
                              ? Container()
                              : Container(
                                  color: Colors.white,
                                  child: const Divider(),
                                ),
                        ],
                      );
                    },
                  ),
                )
              ],
            );
          },
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
