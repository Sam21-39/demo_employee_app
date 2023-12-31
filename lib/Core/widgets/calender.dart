import 'package:demo_employee_app/Core/utils/logger/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../colors/ui_colors.dart';

class CalendarPage extends StatefulWidget {
  final Function(String)? onSave;
  final bool isStartDate;
  final DateTime? startDate;
  const CalendarPage({
    super.key,
    this.onSave,
    this.startDate,
    this.isStartDate = true,
  });

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  List<String> weekDay = [
    '___',
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday'
  ];

  List<String> month = [
    '_',
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  DateTime _selectedDate = DateTime.now(),
      tempDate = DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day);

  bool isNoDateSelected = false;

  void _previousMonth() {
    setState(() {});
    _selectedDate = DateTime(_selectedDate.year, _selectedDate.month - 1);
  }

  void _nextMonth() {
    setState(() {});
    _selectedDate = DateTime(_selectedDate.year, _selectedDate.month + 1);
  }

  List<Widget> _buildCalendarDays() {
    final List<String> daysOfWeek = weekDay.sublist(1)..add(weekDay[0]);

    return daysOfWeek.map((day) {
      return Expanded(
        child: Container(
          alignment: Alignment.center,
          child: Text(
            day,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      );
    }).toList();
  }

  List<Widget> _buildCalendarGrid() {
    final List<Widget> calendarTiles = [];
    final DateTime firstDayOfMonth =
        DateTime(_selectedDate.year, _selectedDate.month, 1);
    final int daysInMonth =
        DateTime(_selectedDate.year, _selectedDate.month + 1, 0).day;
    int weekdayOfFirstDay = firstDayOfMonth.weekday;

    calendarTiles.addAll(
      List.generate(
        weekdayOfFirstDay % 7,
        (index) => Container(),
      ),
    );

    calendarTiles.addAll(
      List.generate(
        daysInMonth,
        (index) {
          final DateTime day =
              DateTime(_selectedDate.year, _selectedDate.month, index + 1);

          return _buildCalendarTile(
              day,
              day == _selectedDate,
              DateTime(day.year, day.month, day.day) ==
                  DateTime(DateTime.now().year, DateTime.now().month,
                      DateTime.now().day));
        },
      ),
    );

    return calendarTiles;
  }

  Widget _buildCalendarTile(DateTime date, bool isSelected, bool isToday) {
    final TextStyle defaultStyle =
        TextStyle(color: isSelected ? Colors.white : UIColors.text);

    TextStyle textStyle = defaultStyle;

    if (isToday) {
      textStyle.copyWith(color: UIColors.base, fontWeight: FontWeight.bold);
    } else if (isSelected) {
      textStyle.copyWith(color: Colors.white, fontWeight: FontWeight.bold);
    }

    return GestureDetector(
      onTap: () {
        setState(() {});
        _selectedDate = date;
      },
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color:
              isSelected ? Theme.of(context).primaryColor : Colors.transparent,
        ),
        child: Center(
          child: Text(
            date.day.toString(),
            style: textStyle.copyWith(
                color: isToday && isSelected
                    ? Colors.white
                    : isToday
                        ? UIColors.base
                        : isSelected
                            ? Colors.white
                            : UIColors.text,
                fontWeight: isToday || isSelected
                    ? FontWeight.bold
                    : FontWeight.normal),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 24.sp, left: 16.sp, right: 16.sp),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          widget.isStartDate
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      flex: 5,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {});
                          _selectedDate = tempDate;
                        },
                        child: Container(
                          height: 36.h,
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: UIColors.baseLight,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4)),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Today',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: UIColors.base,
                                  fontSize: 14.sp,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Expanded(
                      flex: 5,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {});
                          _selectedDate =
                              _selectedDate.add(const Duration(days: 7));
                        },
                        child: Container(
                          height: 36.h,
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: UIColors.baseLight,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4)),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Next ${weekDay[_selectedDate.add(const Duration(days: 8)).weekday]}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: UIColors.base,
                                  fontSize: 14.sp,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      flex: 5,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {});
                          _selectedDate = tempDate;
                          isNoDateSelected = true;
                        },
                        child: Container(
                          height: 36.h,
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: UIColors.baseLight,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4)),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'No Date',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: UIColors.base,
                                  fontSize: 14.sp,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Expanded(
                      flex: 5,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {});
                          _selectedDate = tempDate;
                          isNoDateSelected = false;
                        },
                        child: Container(
                          height: 36.h,
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: UIColors.baseLight,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4)),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Today',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: UIColors.base,
                                  fontSize: 14.sp,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
          SizedBox(
            height: 16.h,
          ),
          widget.isStartDate
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      flex: 5,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {});
                          _selectedDate =
                              _selectedDate.add(const Duration(days: 8));
                        },
                        child: Container(
                          height: 36.h,
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: UIColors.baseLight,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4)),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Next ${weekDay[_selectedDate.add(const Duration(days: 9)).weekday]}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: UIColors.base,
                                  fontSize: 14.sp,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Expanded(
                      flex: 5,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {});
                          _selectedDate = tempDate.add(const Duration(days: 7));
                        },
                        child: Container(
                          height: 36.h,
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: UIColors.baseLight,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4)),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'After 1 week',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: UIColors.base,
                                  fontSize: 14.sp,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : Container(),
          widget.isStartDate
              ? SizedBox(
                  height: 16.h,
                )
              : Container(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: _previousMonth,
                icon: const Icon(
                  Icons.arrow_left_rounded,
                  color: UIColors.text,
                ),
              ),
              Text(
                '${month[_selectedDate.month]} ${_selectedDate.year}',
                style: TextStyle(
                  color: UIColors.text,
                  fontSize: 18.sp,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                ),
              ),
              IconButton(
                onPressed: _nextMonth,
                icon: const Icon(
                  Icons.arrow_right_rounded,
                  color: UIColors.text,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Sun',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Mon',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Tue',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Wed',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Thu',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Fri',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Sat',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 7,
            children: _buildCalendarGrid(),
          ),
          SizedBox(height: 8.h),
          const Divider(),
          SizedBox(height: 8.h),
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.all(8.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(4.sp),
                      child: SvgPicture.asset(
                        'assets/images/event.svg',
                        fit: BoxFit.contain,
                      ),
                    ),
                    Text(
                      '${_selectedDate.day} ${month[_selectedDate.month]} ${_selectedDate.year}',
                      style: TextStyle(
                        color: UIColors.text,
                        fontSize: 16.sp,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
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
                    )
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    if (widget.isStartDate) {
                      widget.onSave!(
                          '${_selectedDate.day} ${month[_selectedDate.month]} ${_selectedDate.year}');
                    } else {
                      if (isNoDateSelected) {
                        widget.onSave!('No Date');
                      } else {
                        Logger.printLog(_selectedDate);
                        Logger.printLog(widget.startDate);
                        if (_selectedDate
                            .difference(widget.startDate!)
                            .isNegative) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      'Previous Date cannot be selected!')));
                        } else {
                          widget.onSave!(
                              '${_selectedDate.day} ${month[_selectedDate.month]} ${_selectedDate.year}');
                        }
                      }
                    }

                    Navigator.pop(context);
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
          )
        ],
      ),
    );
  }
}
