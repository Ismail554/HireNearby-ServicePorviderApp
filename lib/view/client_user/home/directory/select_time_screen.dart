import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hirenearby/core/font_manager.dart';
import 'package:hirenearby/custom_widget/common_screen_setup.dart';

class SelectTimeScreen extends StatefulWidget {
  const SelectTimeScreen({super.key});

  @override
  State<SelectTimeScreen> createState() => _SelectTimeScreenState();
}

class _SelectTimeScreenState extends State<SelectTimeScreen> {
  late DateTime _selectedDate;
  late DateTime _currentMonth;
  late DateTime _today;

  @override
  void initState() {
    super.initState();
    _today = DateTime.now();
    _selectedDate = _today; // Default to today's date
    _currentMonth = DateTime(_today.year, _today.month); // Current month
  }

  @override
  Widget build(BuildContext context) {
    return CommonScreenSetup(
      title: "Select Date",
      showBackButton: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Instruction text
          Text(
            "Choose your preferred date for the service",
            style: FontManager.generalText(),
          ),
          SizedBox(height: 16.h),
          // Calendar widget
          _buildCalendar(),
          SizedBox(height: 20.h),
          // Selected date display
          _buildSelectedDateCard(),
          SizedBox(height: 20.h),
          // Continue button
          FilledButton(
            onPressed: () {
              // Handle continue action
            },
            style: FilledButton.styleFrom(
              backgroundColor: Colors.deepOrange,
              foregroundColor: Colors.white,
              minimumSize: Size(double.infinity, 48.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            child: Text(
              "Continue",
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCalendar() {
    final firstDayOfMonth = DateTime(
      _currentMonth.year,
      _currentMonth.month,
      1,
    );
    final lastDayOfMonth = DateTime(
      _currentMonth.year,
      _currentMonth.month + 1,
      0,
    );
    final daysInMonth = lastDayOfMonth.day;
    final startingWeekday = firstDayOfMonth.weekday; // 1 = Monday, 7 = Sunday

    // Adjust to show Monday as first day (0 = Monday, 6 = Sunday)
    final adjustedStartingWeekday = startingWeekday == 7
        ? 0
        : startingWeekday - 1;

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          // Month header with navigation
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    _formatMonthYear(_currentMonth),
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Container(
                    width: 4.w,
                    height: 4.w,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: _isPreviousMonthDisabled()
                        ? null
                        : () {
                            setState(() {
                              _currentMonth = DateTime(
                                _currentMonth.year,
                                _currentMonth.month - 1,
                              );
                            });
                          },
                    icon: Icon(Icons.chevron_left, size: 20.w),
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                    color: _isPreviousMonthDisabled()
                        ? Colors.grey
                        : Colors.black,
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _currentMonth = DateTime(
                          _currentMonth.year,
                          _currentMonth.month + 1,
                        );
                      });
                    },
                    icon: Icon(Icons.chevron_right, size: 20.w),
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 16.h),
          // Days of week header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: ['Mo', 'Tu', 'Wed', 'Th', 'Fr', 'Sa', 'Su']
                .map(
                  (day) => Expanded(
                    child: Center(
                      child: Text(
                        day,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          SizedBox(height: 12.h),
          // Calendar grid
          ...List.generate((daysInMonth + adjustedStartingWeekday + 6) ~/ 7, (
            weekIndex,
          ) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(7, (dayIndex) {
                final dateIndex =
                    weekIndex * 7 + dayIndex - adjustedStartingWeekday + 1;

                if (dateIndex < 1 || dateIndex > daysInMonth) {
                  // Show empty cells for days outside current month
                  return Expanded(
                    child: Container(
                      margin: EdgeInsets.all(2.w),
                      height: 40.h,
                      child: Center(
                        child: Text(
                          '', // Empty text for days outside current month
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ),
                    ),
                  );
                }

                final date = DateTime(
                  _currentMonth.year,
                  _currentMonth.month,
                  dateIndex,
                );
                final isSelected =
                    date.year == _selectedDate.year &&
                    date.month == _selectedDate.month &&
                    date.day == _selectedDate.day;
                final isToday =
                    date.year == _today.year &&
                    date.month == _today.month &&
                    date.day == _today.day;

                return Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedDate = date;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(2.w),
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Colors.deepOrange
                            : isToday
                            ? Colors.grey.shade200
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Center(
                        child: Text(
                          dateIndex.toString(),
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: isSelected
                                ? FontWeight.w600
                                : FontWeight.normal,
                            color: isSelected
                                ? Colors.white
                                : isToday
                                ? Colors.black87
                                : Colors.black87,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            );
          }),
        ],
      ),
    );
  }

  bool _isPreviousMonthDisabled() {
    // Disable previous month if current month is the same as today's month and year
    return _currentMonth.year == _today.year &&
        _currentMonth.month == _today.month;
  }

  String _formatMonthYear(DateTime date) {
    const months = [
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
      'December',
    ];
    return '${months[date.month - 1]} ${date.year}';
  }

  String _formatSelectedDate(DateTime date) {
    const weekdays = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];
    const months = [
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
      'December',
    ];
    return '${weekdays[date.weekday - 1]}, ${months[date.month - 1]} ${date.day}, ${date.year}';
  }

  Widget _buildSelectedDateCard() {
    final formattedDate = _formatSelectedDate(_selectedDate);

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.orange.shade100,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Selected Date",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              formattedDate,
              style: TextStyle(fontSize: 14.sp, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}
