import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hirenearby/core/font_manager.dart';
import 'package:hirenearby/custom_widget/common_screen_setup.dart';
import 'package:hirenearby/custom_widget/selected_info_card.dart';
import 'package:hirenearby/custom_widget/universal_card.dart';
import 'package:hirenearby/view/client_user/home/directory/confirm_booking_screen.dart';

class SelectTimeScreen extends StatefulWidget {
  /// Date selected on the previous screen.
  ///
  /// If not provided, today's date will be used.
  final DateTime? selectedDate;

  const SelectTimeScreen({super.key, this.selectedDate});

  @override
  State<SelectTimeScreen> createState() => _SelectTimeScreenState();
}

class _SelectTimeScreenState extends State<SelectTimeScreen> {
  late DateTime _selectedDate;
  String _selectedTime = "3:00 PM";

  final List<String> _timeSlots = const [
    "8:00 AM",
    "9:00 AM",
    "10:00 AM",
    "11:00 AM",
    "12:00 AM",
    "1:00 PM",
    "2:00 PM",
    "3:00 PM",
    "4:00 PM",
    "5:00 PM",
    "6:00 PM",
    "7:00 PM",
  ];

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.selectedDate ?? DateTime(2025, 11, 27);
  }

  @override
  Widget build(BuildContext context) {
    return CommonScreenSetup(
      title: "Select Time",
      showBackButton: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSelectedDateCard(),
          SizedBox(height: 24.h),
          Text(
            "Available Time Slots",
            style: FontManager.titleText(fontSize: 20),
          ),
          SizedBox(height: 16.h),
          _buildTimeGrid(),
          SizedBox(height: 24.h),
          _buildSelectedTimeCard(),
          SizedBox(height: 32.h),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: Colors.deepOrange,
                foregroundColor: Colors.white,
              ),

              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ConfirmBookingScreen(),
                  ),
                );
              },

              child: Text("Next", style: FontManager.buttonText()),
            ),
          ),
        ],
      ),
    );
  }

  /// Top card showing the selected date (read‑only).
  Widget _buildSelectedDateCard() {
    final formattedDate = _formatSelectedDate(_selectedDate);
    return SelectedInfoCard(title: "Selected Date", value: formattedDate);
  }

  /// Grid of time slots using [UniversalCard].
  Widget _buildTimeGrid() {
    // Create rows of 3 cards each
    final rows = <Widget>[];
    for (var i = 0; i < _timeSlots.length; i += 3) {
      final slice = _timeSlots.sublist(
        i,
        i + 3 > _timeSlots.length ? _timeSlots.length : i + 3,
      );
      rows.add(
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 4.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: slice
                .map(
                  (time) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 4, right: 4),
                      child: UniversalCard(
                        label: time,
                        icon: Icons.access_time,
                        isSelected: _selectedTime == time,
                        onTap: () {
                          setState(() {
                            _selectedTime = time;
                          });
                        },
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      );
    }
    return Column(children: rows);
  }

  /// Bottom card showing the selected time.
  Widget _buildSelectedTimeCard() {
    return SelectedInfoCard(title: "Selected Time", value: _selectedTime);
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
}
