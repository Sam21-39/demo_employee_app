import 'package:demo_employee_app/Core/colors/ui_colors.dart';
import 'package:demo_employee_app/Core/models/employee.dart';
import 'package:demo_employee_app/Core/utils/logger/logger.dart';
import 'package:demo_employee_app/Functions/home/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';

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
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: StreamBuilder(
                stream: homeBloc.allListCtrl.stream,
                initialData: [],
                builder: (context, clist) {
                  Logger.printLog(clist.data);
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
                        ),
                      ],
                    );
                  }

                  return Container();
                },
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    StreamBuilder<List<Employee>>(
                      stream: homeBloc.currentListCtrl.stream,
                      initialData: [],
                      builder: (context, clist) {
                        if (clist.data!.isEmpty) {
                          return Container();
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
                                  return SwipeActionCell(
                                    key: ObjectKey(clist.data![index]),
                                    trailingActions: <SwipeAction>[
                                      SwipeAction(
                                          icon: Padding(
                                            padding:
                                                EdgeInsets.only(top: 20.sp),
                                            child: SvgPicture.asset(
                                                'assets/images/delete.svg'),
                                          ),
                                          title: "",
                                          onTap: (CompletionHandler
                                              handler) async {
                                            Logger.printLog(handler);
                                            homeBloc.deleteEmployee(
                                                clist.data![index].eid!);
                                          },
                                          color: Colors.red),
                                    ],
                                    child: Column(
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          padding: EdgeInsets.all(16.sp),
                                          decoration: const BoxDecoration(
                                              color: Colors.white),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
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
                                                  color:
                                                      const Color(0xFF949C9E),
                                                  fontSize: 14.sp,
                                                  fontFamily: 'Roboto',
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              SizedBox(height: 6.h),
                                              Text(
                                                'From ${clist.data![index].startDate}',
                                                style: TextStyle(
                                                  color:
                                                      const Color(0xFF949C9E),
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
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        );
                      },
                    ),
                    StreamBuilder<List<Employee>>(
                      stream: homeBloc.previousListCtrl.stream,
                      initialData: [],
                      builder: (context, clist) {
                        if (clist.data!.isEmpty) {
                          return Container();
                        }
                        Logger.printLog(clist.data);
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(16.sp),
                              child: Text(
                                'Previous employees',
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
                                  return SwipeActionCell(
                                    key: ObjectKey(clist.data![index]),
                                    trailingActions: <SwipeAction>[
                                      SwipeAction(
                                          icon: Padding(
                                            padding:
                                                EdgeInsets.only(top: 20.sp),
                                            child: SvgPicture.asset(
                                                'assets/images/delete.svg'),
                                          ),
                                          title: "",
                                          onTap: (CompletionHandler
                                              handler) async {
                                            Logger.printLog(handler);
                                            homeBloc.deleteEmployee(
                                                clist.data![index].eid!);
                                          },
                                          color: Colors.red),
                                    ],
                                    child: Column(
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          padding: EdgeInsets.all(16.sp),
                                          decoration: const BoxDecoration(
                                              color: Colors.white),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
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
                                                  color:
                                                      const Color(0xFF949C9E),
                                                  fontSize: 14.sp,
                                                  fontFamily: 'Roboto',
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              SizedBox(height: 6.h),
                                              Text(
                                                '${clist.data![index].startDate} - ${clist.data![index].endDate}',
                                                style: TextStyle(
                                                  color:
                                                      const Color(0xFF949C9E),
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
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
            StreamBuilder<List<Employee>>(
                stream: homeBloc.allListCtrl.stream,
                initialData: [],
                builder: (context, snapshot) {
                  if (snapshot.data!.isEmpty) {
                    return Container();
                  }
                  return Align(
                    alignment: const FractionalOffset(0.1, 0.975),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.sp, vertical: 12.sp),
                      child: Text(
                        'Swipe left to delete',
                        style: TextStyle(
                          color: Color(0xFF949C9E),
                          fontSize: 15.sp,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  );
                }),
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
